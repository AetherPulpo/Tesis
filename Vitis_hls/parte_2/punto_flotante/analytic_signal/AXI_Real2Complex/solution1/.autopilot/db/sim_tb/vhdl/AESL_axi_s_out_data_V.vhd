-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;


entity AESL_axi_s_out_data_V is
  generic (
      constant    TV_OUT_out_data_V_TDATA : STRING (1 to 52) := "./impl_rtl.AXI_Real2Complex.autotvout_out_data_V.dat";
      constant    LENGTH_out_data_V : INTEGER := 512;
      constant    INTERFACE_TYPE : STRING (1 to 5) := "axi_s";
      constant    AUTOTB_TRANSACTION_NUM : INTEGER := 1
  );
  port (
      clk         :   IN  STD_LOGIC;
      reset       :   IN  STD_LOGIC;
    TRAN_out_data_V_TDATA : IN STD_LOGIC_VECTOR (64 - 1 downto 0);
    out_data_V_TDATA_trans_num : OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRAN_out_data_V_TVALID : IN STD_LOGIC;
    TRAN_out_data_V_TREADY : OUT STD_LOGIC;
      ready     : IN   STD_LOGIC;
      done      : IN   STD_LOGIC
  );
end AESL_axi_s_out_data_V;

architecture behav of AESL_axi_s_out_data_V is
------------------------Local signal-------------------
  signal reg_out_data_V_TREADY :   STD_LOGIC;
  signal  out_data_V_TDATA_mInPtr  :   STD_LOGIC_VECTOR (10 downto 0) := (others => '0');
  signal  out_data_V_TDATA_mOutPtr :   STD_LOGIC_VECTOR (10 downto 0) := (others => '0');
  signal  out_data_V_TDATA_empty_n  :   STD_LOGIC;
  signal  out_data_V_TDATA_full_n   :   STD_LOGIC;
  type out_data_V_TDATA_arr2D is array(0 to 512) of STD_LOGIC_VECTOR(64 - 1 downto 0);
  signal out_data_V_TDATA_mem :   out_data_V_TDATA_arr2D := (others => (others => '0'));
  signal out_data_V_TDATA_ingress_status :  INTEGER;
  signal out_data_V_TDATA_ingress_status_bit :  STD_LOGIC;

  signal out_data_V_TDATA_out_i : INTEGER;
  signal out_data_V_TDATA_out_end : STD_LOGIC;
  signal out_data_V_TDATA_out_end_reg : STD_LOGIC;
  signal out_data_V_TDATA_out_size : INTEGER;
  signal out_data_V_TDATA_out_size_reg : INTEGER;
  signal out_data_V_TDATA_out_step : INTEGER;
  signal out_data_V_TDATA_trans_num_sig : STD_LOGIC_VECTOR(31 DOWNTO 0);
  signal out_data_V_TDATA_trans_num_reg : STD_LOGIC_VECTOR(31 DOWNTO 0);
  signal reset_reg : STD_LOGIC;
  -- Subtype for random state number, to prevent confusing it with true integers
  -- Top of range should be (2**31)-1 but this literal calculation causes overflow on 32-bit machines
  subtype T_RANDINT is integer range 1 to integer'high;

      function esl_icmp_eq(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
          variable res : STD_LOGIC_VECTOR(0 downto 0);
      begin
          if v1 = v2 then
              res := "1";
          else
              res := "0";
          end if;
          return res;
      end function;
      procedure esl_read_token (file textfile: TEXT; textline: inout LINE; token: out STRING; token_len: out INTEGER) is
          variable whitespace : CHARACTER;
          variable i : INTEGER;
          variable ok: BOOLEAN;
          variable buff: STRING(1 to token'length);
      begin
          ok := false;
          i := 1;
          loop_main: while not endfile(textfile) loop
              if textline = null or textline'length = 0 then
                  readline(textfile, textline);
              end if;
              loop_remove_whitespace: while textline'length > 0 loop
                  if textline(textline'left) = ' ' or
                      textline(textline'left) = HT or
                      textline(textline'left) = CR or
                      textline(textline'left) = LF then
                      read(textline, whitespace);
                  else 
                      exit loop_remove_whitespace;
                  end if;
              end loop;
              loop_aesl_read_token: while textline'length > 0 and i <= buff'length loop
                  if textline(textline'left) = ' ' or
                     textline(textline'left) = HT or
                     textline(textline'left) = CR or
                     textline(textline'left) = LF then
                      exit loop_aesl_read_token;
                  else 
                      read(textline, buff(i));
                      i := i + 1;
                  end if;
                  ok := true;
              end loop;
              if ok = true then
                  exit loop_main;
              end if;
          end loop;
          buff(i) := ' ';
          token := buff;
          token_len:= i-1;
      end procedure esl_read_token;

      procedure esl_read_token (file textfile: TEXT; 
                                textline: inout LINE; 
                                token: out STRING) is
          variable i : INTEGER;
      begin
          esl_read_token (textfile, textline, token, i);
      end procedure esl_read_token;

      function esl_add(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
          variable res : unsigned(v1'length-1 downto 0);
      begin
          res := unsigned(v1) + unsigned(v2);
          return std_logic_vector(res);
      end function;

      function esl_icmp_ult(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
          variable res : STD_LOGIC_VECTOR(0 downto 0);
      begin
          if unsigned(v1) < unsigned(v2) then
              res := "1";
          else
              res := "0";
          end if;
          return res;
      end function;

      function esl_str2lv_hex (RHS : STRING; data_width : INTEGER) return STD_LOGIC_VECTOR is
          variable    ret    :   STD_LOGIC_VECTOR(data_width - 1 downto 0);
          variable    idx    :   integer := 3;
      begin
          ret := (others => '0');
          if (RHS(1) /= '0' and (RHS(2) /= 'x' or RHS(2) /= 'X')) then
                 report "Error! The format of hex number is not initialed by 0x";
          end if;
          while true loop
              if (data_width > 4) then
                  case RHS(idx)  is
                      when '0'    =>  ret := ret(data_width - 5 downto 0) & "0000";
                         when '1'    =>  ret := ret(data_width - 5 downto 0) & "0001";
                      when '2'    =>  ret := ret(data_width - 5 downto 0) & "0010";
                      when '3'    =>  ret := ret(data_width - 5 downto 0) & "0011";
                      when '4'    =>  ret := ret(data_width - 5 downto 0) & "0100";
                      when '5'    =>  ret := ret(data_width - 5 downto 0) & "0101";
                      when '6'    =>  ret := ret(data_width - 5 downto 0) & "0110";
                      when '7'    =>  ret := ret(data_width - 5 downto 0) & "0111";
                      when '8'    =>  ret := ret(data_width - 5 downto 0) & "1000";
                      when '9'    =>  ret := ret(data_width - 5 downto 0) & "1001";
                      when 'a' | 'A'  =>  ret := ret(data_width - 5 downto 0) & "1010";
                      when 'b' | 'B'  =>  ret := ret(data_width - 5 downto 0) & "1011";
                      when 'c' | 'C'  =>  ret := ret(data_width - 5 downto 0) & "1100";
                      when 'd' | 'D'  =>  ret := ret(data_width - 5 downto 0) & "1101";
                      when 'e' | 'E'  =>  ret := ret(data_width - 5 downto 0) & "1110";
                      when 'f' | 'F'  =>  ret := ret(data_width - 5 downto 0) & "1111";
                      when 'x' | 'X'  =>  ret := ret(data_width - 5 downto 0) & "XXXX";
                      when ' '    =>  return ret;
                      when others    =>  report "Wrong hex char " & RHS(idx);    return ret;
                  end case;
              elsif (data_width = 4) then
                  case RHS(idx)  is
                      when '0'    =>  ret := "0000";
                         when '1'    =>  ret := "0001";
                      when '2'    =>  ret := "0010";
                      when '3'    =>  ret := "0011";
                      when '4'    =>  ret := "0100";
                      when '5'    =>  ret := "0101";
                      when '6'    =>  ret := "0110";
                      when '7'    =>  ret := "0111";
                      when '8'    =>  ret := "1000";
                      when '9'    =>  ret := "1001";
                      when 'a' | 'A'  =>  ret := "1010";
                      when 'b' | 'B'  =>  ret := "1011";
                      when 'c' | 'C'  =>  ret := "1100";
                      when 'd' | 'D'  =>  ret := "1101";
                      when 'e' | 'E'  =>  ret := "1110";
                      when 'f' | 'F'  =>  ret := "1111";
                      when 'x' | 'X'  =>  ret := "XXXX";
                      when ' '    =>  return ret;
                      when others    =>  report "Wrong hex char " & RHS(idx);    return ret;
                  end case;
              elsif (data_width = 3) then
                  case RHS(idx)  is
                      when '0'    =>  ret := "000";
                         when '1'    =>  ret := "001";
                      when '2'    =>  ret := "010";
                      when '3'    =>  ret := "011";
                      when '4'    =>  ret := "100";
                      when '5'    =>  ret := "101";
                      when '6'    =>  ret := "110";
                      when '7'    =>  ret := "111";
                      when 'x' | 'X'  =>  ret := "XXX";
                      when ' '    =>  return ret;
                      when others    =>  report "Wrong hex char " & RHS(idx);    return ret;
                  end case;
              elsif (data_width = 2) then
                  case RHS(idx)  is
                      when '0'    =>  ret := "00";
                         when '1'    =>  ret := "01";
                      when '2'    =>  ret := "10";
                      when '3'    =>  ret := "11";
                      when 'x' | 'X'  =>  ret := "XX";
                      when ' '    =>  return ret;
                      when others    =>  report "Wrong hex char " & RHS(idx);    return ret;
                  end case;
              elsif (data_width = 1) then
                  case RHS(idx)  is
                      when '0'    =>  ret := "0";
                         when '1'    =>  ret := "1";
                      when 'x' | 'X'  =>  ret := "X";
                      when ' '    =>  return ret;
                      when others    =>  report "Wrong hex char " & RHS(idx);    return ret;
                  end case;
              else
                  report string'("Wrong data_width.");
                  return ret;
              end if;
              idx := idx + 1;
          end loop;
          return ret;
      end function;

      function esl_conv_string_hex (lv : STD_LOGIC_VECTOR) return STRING is
          constant str_len : integer := (lv'length + 3)/4;
          variable ret : STRING (1 to str_len);
          variable i, tmp: INTEGER;
          variable normal_lv : STD_LOGIC_VECTOR(lv'length - 1 downto 0);
          variable tmp_lv : STD_LOGIC_VECTOR(3 downto 0);
      begin
          normal_lv := lv;
          for i in 1 to str_len loop
              if (i = 1) then
                  if ((lv'length mod 4) = 3) then
                      tmp_lv(2 downto 0) := normal_lv(lv'length - 1 downto lv'length - 3);
                      case tmp_lv(2 downto 0) is
                          when "000" => ret(i) := '0';
                          when "001" => ret(i) := '1';
                          when "010" => ret(i) := '2';
                          when "011" => ret(i) := '3';
                          when "100" => ret(i) := '4';
                          when "101" => ret(i) := '5';
                          when "110" => ret(i) := '6';
                          when "111" => ret(i) := '7';
                          when others  => ret(i) := 'X';
                      end case;
                  elsif ((lv'length mod 4) = 2) then
                      tmp_lv(1 downto 0) := normal_lv(lv'length - 1 downto lv'length - 2);
                      case tmp_lv(1 downto 0) is
                          when "00" => ret(i) := '0';
                          when "01" => ret(i) := '1';
                          when "10" => ret(i) := '2';
                          when "11" => ret(i) := '3';
                          when others => ret(i) := 'X';
                      end case;
                  elsif ((lv'length mod 4) = 1) then
                      tmp_lv(0 downto 0) := normal_lv(lv'length - 1 downto lv'length - 1);
                      case tmp_lv(0 downto 0) is
                          when "0" => ret(i) := '0';
                          when "1" => ret(i) := '1';
                          when others=> ret(i) := 'X';
                      end case;
                  elsif ((lv'length mod 4) = 0) then
                      tmp_lv(3 downto 0) := normal_lv(lv'length - 1 downto lv'length - 4);
                      case tmp_lv(3 downto 0) is
                          when "0000" => ret(i) := '0';
                          when "0001" => ret(i) := '1';
                          when "0010" => ret(i) := '2';
                          when "0011" => ret(i) := '3';
                          when "0100" => ret(i) := '4';
                          when "0101" => ret(i) := '5';
                          when "0110" => ret(i) := '6';
                          when "0111" => ret(i) := '7';
                          when "1000" => ret(i) := '8';
                          when "1001" => ret(i) := '9';
                          when "1010" => ret(i) := 'a';
                          when "1011" => ret(i) := 'b';
                          when "1100" => ret(i) := 'c';
                          when "1101" => ret(i) := 'd';
                          when "1110" => ret(i) := 'e';
                          when "1111" => ret(i) := 'f';
                          when others   => ret(i) := 'X';
                      end case;
                  end if;
              else
                  tmp_lv(3 downto 0) := normal_lv((str_len - i) * 4 + 3 downto (str_len - i) * 4);
                  case tmp_lv(3 downto 0) is
                      when "0000" => ret(i) := '0';
                      when "0001" => ret(i) := '1';
                      when "0010" => ret(i) := '2';
                      when "0011" => ret(i) := '3';
                      when "0100" => ret(i) := '4';
                      when "0101" => ret(i) := '5';
                      when "0110" => ret(i) := '6';
                      when "0111" => ret(i) := '7';
                      when "1000" => ret(i) := '8';
                      when "1001" => ret(i) := '9';
                      when "1010" => ret(i) := 'a';
                      when "1011" => ret(i) := 'b';
                      when "1100" => ret(i) := 'c';
                      when "1101" => ret(i) := 'd';
                      when "1110" => ret(i) := 'e';
                      when "1111" => ret(i) := 'f';
                      when others   => ret(i) := 'X';
                  end case;
              end if;
          end loop;
          return ret;
      end function;

      function esl_str_dec2int (RHS : STRING) return INTEGER is
          variable    ret    :   integer;
          variable    idx    :   integer := 1;
      begin
          ret := 0;
          while true loop
              case RHS(idx)  is
                  when '0'    =>  ret := ret * 10 + 0;
                  when '1'    =>  ret := ret * 10 + 1;
                  when '2'    =>  ret := ret * 10 + 2;
                  when '3'    =>  ret := ret * 10 + 3;
                  when '4'    =>  ret := ret * 10 + 4;
                  when '5'    =>  ret := ret * 10 + 5;
                  when '6'    =>  ret := ret * 10 + 6;
                  when '7'    =>  ret := ret * 10 + 7;
                  when '8'    =>  ret := ret * 10 + 8;
                  when '9'    =>  ret := ret * 10 + 9;
                  when ' '    =>  return ret;
                  when others    =>  report "Wrong dec char " & RHS(idx);    return ret;
              end case;
              idx := idx + 1;
          end loop;
          return ret;
      end esl_str_dec2int;

  -- purpose: initialise the random state variable based on an integer seed
  function init_rand(seed : integer) return T_RANDINT is
    variable result : T_RANDINT;
  begin
    -- If the seed is smaller than the minimum value of the random state variable, use the minimum value
    if seed < T_RANDINT'low then
      result := T_RANDINT'low;
      -- If the seed is larger than the maximum value of the random state variable, use the maximum value
    elsif seed > T_RANDINT'high then
      result := T_RANDINT'high;
      -- If the seed is within the range of the random state variable, just use the seed
    else
      result := seed;
    end if;
    -- Return the result
    return result;
  end init_rand;


  -- purpose: generate a random integer between min and max limits
  procedure rand_int(variable rand   : inout T_RANDINT;
                     constant minval : in    integer;
                     constant maxval : in    integer;
                     variable result : out   integer
                     ) is

    variable k, q      : integer;
    variable real_rand : real;
    variable res       : integer;

  begin
    -- Create a new random integer in the range 1 to 2**31-1 and put it back into rand VARIABLE
    -- Based on an example from Numerical Recipes in C, 2nd Edition, page 279
    k   := rand/127773;
    q   := 16807*(rand-k*127773)-2836*k;
    if q < 0 then
      q := q + 2147483647;
    end if;
    rand := init_rand(q);

    -- Convert this integer to a real number in the range 0 to 1
    real_rand := (real(rand - T_RANDINT'low)) / real(T_RANDINT'high - T_RANDINT'low);
    -- Convert this real number to an integer in the range minval to maxval
    -- The +1 and -0.5 are to get equal probability of minval and maxval as other values
    res    := integer((real_rand * real(maxval+1-minval)) - 0.5) + minval;
    -- VHDL real to integer conversion doesn't define what happens for x.5 so deal with this
    if res < minval then
      res  := minval;
    elsif res > maxval then
      res  := maxval;
    end if;
    -- assign output
    result := res;

  end rand_int;

begin
  TRAN_out_data_V_TREADY_proc  :   process( out_data_V_TDATA_full_n, reset)
  begin
      if reset = '0' then
          TRAN_out_data_V_TREADY <= '0';
          reg_out_data_V_TREADY <= '0';
      else
          TRAN_out_data_V_TREADY <= '1' and out_data_V_TDATA_full_n and '1';
          reg_out_data_V_TREADY <= '1' and out_data_V_TDATA_full_n and '1';
      end if;
  end process;
------------------------Write-only axi_s-------------------

--------------------Assignment for output axi_s port--------------
  ------------------------------------ out_data_V_TDATA ------------------------------
  out_data_V_TDATA_full_n_proc   :   process(out_data_V_TDATA_mInPtr, out_data_V_TDATA_mOutPtr)
  begin
      if (esl_icmp_eq(out_data_V_TDATA_mInPtr, out_data_V_TDATA_mOutPtr) = "1") then
          out_data_V_TDATA_full_n   <=  '0';
      else
          out_data_V_TDATA_full_n   <=  '1';
      end if;
  end process;

out_data_V_TDATA_out_end <= '1' when (out_data_V_TDATA_out_size /= 0) and ((out_data_V_TDATA_out_i = (out_data_V_TDATA_out_size - 1)) and (TRAN_out_data_V_TVALID = '1')) else '0';
out_data_V_TDATA_trans_num_sig <= (out_data_V_TDATA_trans_num_reg + out_data_V_TDATA_out_step) when ((out_data_V_TDATA_out_end = '1') and (out_data_V_TDATA_trans_num_reg /= AUTOTB_TRANSACTION_NUM)) or ((out_data_V_TDATA_trans_num_reg + out_data_V_TDATA_out_step = AUTOTB_TRANSACTION_NUM) and (out_data_V_TDATA_out_size = 0)) else out_data_V_TDATA_trans_num_reg;
out_data_V_TDATA_trans_num <= (others => '0') when (reset = '0') else (out_data_V_TDATA_trans_num_reg + out_data_V_TDATA_out_step - 1) when ((out_data_V_TDATA_out_end = '0') and (out_data_V_TDATA_out_end_reg = '0') and (out_data_V_TDATA_trans_num_reg /= AUTOTB_TRANSACTION_NUM)) else out_data_V_TDATA_trans_num_sig;

proc_gen_out_data_V_TDATA_out_i : process(reset, clk)
begin
    if(reset = '0') then
        out_data_V_TDATA_out_i <= 0;
    elsif(clk'event and clk = '1') then
        if(TRAN_out_data_V_TVALID = '1' and out_data_V_TDATA_out_i < out_data_V_TDATA_out_size - 1) then
            out_data_V_TDATA_out_i <= out_data_V_TDATA_out_i + 1;
        elsif(out_data_V_TDATA_out_end = '1') then
            out_data_V_TDATA_out_i <= 0;
        end if;
    end if;
end process;

proc_gen_out_data_V_TDATA_trans_num_reg : process(reset, clk)
begin
    if(reset = '0') then
        out_data_V_TDATA_trans_num_reg <= X"00000000";
    elsif(clk'event and clk = '1') then
        out_data_V_TDATA_trans_num_reg <= out_data_V_TDATA_trans_num_sig;
    end if;
end process;

proc_gen_out_data_V_TDATA_out_end_reg: process(reset, clk)
begin
    if(reset = '0') then
        out_data_V_TDATA_out_end_reg <= '0';
    elsif(clk'event and clk = '1') then
        out_data_V_TDATA_out_end_reg <= out_data_V_TDATA_out_end;
    end if;
end process;

proc_gen_out_data_V_TDATA_out_size: process
file        fp          :   TEXT;
variable    i           :   INTEGER;
variable    size        :   INTEGER;
variable    fstatus     :   FILE_OPEN_STATUS;
variable    token_line  :   LINE;
variable    token       :   STRING(1 to 160);
variable    transaction_idx :   INTEGER;
begin
    file_open(fstatus, fp,"./stream_size_out_out_data_V.dat" , READ_MODE);
    if(fstatus /= OPEN_OK) then
        assert false report "Open file " & "../tv/stream_size/stream_size_out_out_data_V.dat"  & " failed!!!" severity note;
        assert false report "ERROR: Simulation using HLS TB failed." severity failure;
    end if;
    esl_read_token(fp, token_line, token);
    if(token(1 to 13) /= "[[[runtime]]]") then
        assert false report "ERROR: Simulation using HLS TB failed." severity failure;
    end if;
    esl_read_token(fp, token_line, token);
    wait until clk'event and clk = '1';
      wait until reset = '1';
    while(token(1 to 14) /= "[[[/runtime]]]") loop
        i := 1;
        if(token(1 to 15) /= "[[transaction]]") then
        assert false report "ERROR: Simulation using HLS TB failed." severity failure;
        end if;
        esl_read_token(fp, token_line, token);  -- Skip transaction number
        esl_read_token(fp, token_line, token);
        size := esl_str_dec2int(token);
        esl_read_token(fp, token_line, token); --[[/transaction]] 
        esl_read_token(fp, token_line, token);
        while((size = 0) and (token(1 to 14) /= "[[[/runtime]]]")) loop
            i := i + 1;
            esl_read_token(fp, token_line, token);  -- Skip transaction number
            esl_read_token(fp, token_line, token);
            size := esl_str_dec2int(token);
            esl_read_token(fp, token_line, token); --[[/transaction]] 
            esl_read_token(fp, token_line, token);
        end loop; 
        out_data_V_TDATA_out_size <= size;
        out_data_V_TDATA_out_step <= i;
        if(token(1 to 14) /= "[[[/runtime]]]") then
            wait until clk'event and clk = '0';
            while (out_data_V_TDATA_out_end_reg /= '1') loop
                    wait until clk'event and clk = '0';
            end loop; 
        end if;
    end loop;
    if(token(1 to 14) /= "[[[/runtime]]]") then
        assert false report "ERROR: Simulation using HLS TB failed." severity failure;
    end if;
    file_close (fp);
    wait;
end process;


  out_data_V_TDATA_out_mem_proc : process(out_data_V_TDATA_mInPtr, clk)
  begin
      if (CONV_INTEGER(out_data_V_TDATA_mInPtr) = 0) then
          out_data_V_TDATA_mem(0) <= TRAN_out_data_V_TDATA ;
      elsif (clk'event and clk = '1') then
          if (TRAN_out_data_V_TVALID = '1' and reg_out_data_V_TREADY = '1' ) then
              if (CONV_INTEGER(out_data_V_TDATA_mInPtr) < 512) then
                  out_data_V_TDATA_mem(CONV_INTEGER(out_data_V_TDATA_mInPtr)) <= TRAN_out_data_V_TDATA ;
              end if;
          end if;
      end if;
  end process;

  out_data_V_TDATA_mInPtr_proc : process(clk)
  begin
      if (clk'event and clk = '0') then
          if (reset = '0' OR out_data_V_TDATA_out_end_reg = '1') then
              out_data_V_TDATA_mInPtr <= (others => '0');
          end if;
      elsif (clk'event and clk = '1') then
          if (TRAN_out_data_V_TVALID = '1' and reg_out_data_V_TREADY = '1' ) then
              if (CONV_INTEGER(out_data_V_TDATA_mInPtr) < 512) then
                  out_data_V_TDATA_mInPtr <=  esl_add(out_data_V_TDATA_mInPtr, "1");
              end if;
          end if;
      end if;
  end process;

  out_data_V_TDATA_out_size_reg_proc : process(reset, clk)
  begin
          if (reset = '0') then
          out_data_V_TDATA_out_size_reg <= 0;
      elsif (clk'event and clk = '1') then
          out_data_V_TDATA_out_size_reg <= out_data_V_TDATA_out_size;
      end if;
  end process;

  out_data_V_TDATA_write_file_proc :   process
      file        fp              :   TEXT;
      variable    fstatus         :   FILE_OPEN_STATUS;
      variable    token_line      :   LINE;
      variable    token           :   STRING(1 to 1024);
      variable    transaction_idx :   INTEGER;
      variable    i               :   INTEGER;
  begin
      transaction_idx :=  0;
      out_data_V_TDATA_mOutPtr <=  std_logic_vector(to_unsigned(513, out_data_V_TDATA_mOutPtr'length));
      wait until reset = '1';
      while (true) loop
          wait until clk'event and clk = '1';
          i := out_data_V_TDATA_out_step;
          if ((i + transaction_idx) < AUTOTB_TRANSACTION_NUM + 1) then
              while ((i /= 0) and ((i /= 1) or (i = 1 and out_data_V_TDATA_out_size = 0))) loop
                  file_open(fstatus, fp, TV_OUT_out_data_V_TDATA, APPEND_MODE);
                  if (fstatus /= OPEN_OK) then
                      assert false report "Open file " & TV_OUT_out_data_V_TDATA & " failed!!!" severity failure;
                  end if;
                  write(token_line, "[[transaction]]    " & integer'image(transaction_idx));
                  writeline(fp, token_line);
                  write(token_line, string'("[[/transaction]]"));
                  writeline(fp, token_line);
                  transaction_idx := transaction_idx + 1;
                  file_close(fp);
                  i := i - 1;
              end loop;
          end if;
          wait until clk'event and clk = '0';
          while (out_data_V_TDATA_out_end_reg /= '1') loop
              wait until clk'event and clk = '0';
          end loop;
          file_open(fstatus, fp, TV_OUT_out_data_V_TDATA, APPEND_MODE);
          if (fstatus /= OPEN_OK) then
              assert false report "Open file " & TV_OUT_out_data_V_TDATA & " failed!!!" severity failure;
          end if;
          write(token_line, "[[transaction]]    " & integer'image(transaction_idx));
          writeline(fp, token_line);
          if (out_data_V_TDATA_out_size_reg /= 0) then
              for i in 0 to out_data_V_TDATA_out_size_reg - 1 loop
                  write(token_line, "0x" & esl_conv_string_hex(out_data_V_TDATA_mem(i)));
                  writeline(fp, token_line);
              end loop;
          end if;
          write(token_line, string'("[[/transaction]]"));
          writeline(fp, token_line);
          transaction_idx := transaction_idx + 1;
          file_close(fp);
      end loop;
      wait;
  end process;

end behav;
