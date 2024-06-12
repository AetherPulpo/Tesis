; ModuleID = '/home/usuario/Escritorio/Tesis/IP_V3/punto_flotante/Filters/axi_modulus/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"class.hls::stream" = type { %"class.hls::stream.0" }
%"class.hls::stream.0" = type { %"struct.std::complex" }
%"struct.std::complex" = type { { float, float } }
%"class.hls::stream.1" = type { %"class.hls::stream.2" }
%"class.hls::stream.2" = type { float }

; Function Attrs: noinline
define void @apatb_axi_modulus_ir(%"class.hls::stream"* %in_complex_data, %"class.hls::stream.1"* %out_modulus) local_unnamed_addr #0 {
entry:
  %in_complex_data_copy = alloca %"class.hls::stream", align 512
  %out_modulus_copy1 = alloca %"class.hls::stream.1", align 512
  call fastcc void @copy_in(%"class.hls::stream"* %in_complex_data, %"class.hls::stream"* nonnull align 512 %in_complex_data_copy, %"class.hls::stream.1"* %out_modulus, %"class.hls::stream.1"* nonnull align 512 %out_modulus_copy1)
  call void @apatb_axi_modulus_hw(%"class.hls::stream"* %in_complex_data_copy, %"class.hls::stream.1"* %out_modulus_copy1)
  call fastcc void @copy_out(%"class.hls::stream"* %in_complex_data, %"class.hls::stream"* nonnull align 512 %in_complex_data_copy, %"class.hls::stream.1"* %out_modulus, %"class.hls::stream.1"* nonnull align 512 %out_modulus_copy1)
  ret void
}

; Function Attrs: noinline
define internal fastcc void @copy_in(%"class.hls::stream"*, %"class.hls::stream"* noalias align 512, %"class.hls::stream.1"*, %"class.hls::stream.1"* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream"(%"class.hls::stream"* align 512 %1, %"class.hls::stream"* %0)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream.1"(%"class.hls::stream.1"* align 512 %3, %"class.hls::stream.1"* %2)
  ret void
}

; Function Attrs: noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream"(%"class.hls::stream"* noalias align 512, %"class.hls::stream"* noalias) unnamed_addr #2 {
entry:
  %2 = icmp eq %"class.hls::stream"* %0, null
  %3 = icmp eq %"class.hls::stream"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %5 = bitcast %"class.hls::stream"* %1 to i8*
  %6 = call i1 @fpga_fifo_exist_8(i8* %5)
  br i1 %6, label %7, label %8

; <label>:7:                                      ; preds = %copy
  call fastcc void @"streamcpy_hls.p0class.hls::stream"(%"class.hls::stream"* nonnull align 512 %0, %"class.hls::stream"* nonnull %1)
  br label %ret

; <label>:8:                                      ; preds = %copy
  %.0 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0
  %.01 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0
  %9 = call i1 @fpga_fifo_exist_8(i8* %5)
  br i1 %9, label %10, label %11

; <label>:10:                                     ; preds = %8
  call fastcc void @"streamcpy_hls.p0class.hls::stream.0"(%"class.hls::stream.0"* align 512 %.01, %"class.hls::stream.0"* %.0)
  br label %ret

; <label>:11:                                     ; preds = %8
  %.0.02 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 0
  %.01.03 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 0
  %12 = call i1 @fpga_fifo_exist_8(i8* %5)
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %11
  call fastcc void @"streamcpy_hls.p0struct.std::complex"(%"struct.std::complex"* align 512 %.01.03, %"struct.std::complex"* %.0.02)
  br label %ret

; <label>:14:                                     ; preds = %11
  %15 = bitcast %"class.hls::stream"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %15, i8* align 1 %5, i64 4, i1 false)
  %.01.0.0.19.gep11 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 0, i32 0, i32 1
  %16 = bitcast float* %.01.0.0.19.gep11 to i8*
  %.0.0.0.18.gep12 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 0, i32 0, i32 1
  %17 = bitcast float* %.0.0.0.18.gep12 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %16, i8* align 1 %17, i64 4, i1 false)
  br label %ret

ret:                                              ; preds = %14, %13, %10, %7, %entry
  ret void
}

declare i1 @fpga_fifo_exist_8(i8*) local_unnamed_addr

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream"(%"class.hls::stream"* noalias nocapture align 512, %"class.hls::stream"* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %"class.hls::stream"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_8(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream"* %2 to i8*
  %6 = bitcast %"class.hls::stream"* %1 to i8*
  call void @fpga_fifo_pop_8(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream", %"class.hls::stream"* %2
  %8 = bitcast %"class.hls::stream"* %2 to i8*
  %9 = bitcast %"class.hls::stream"* %0 to i8*
  call void @fpga_fifo_push_8(i8* %8, i8* %9)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  %10 = bitcast %"class.hls::stream"* %1 to i8*
  %11 = bitcast %"class.hls::stream"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 8, i1 false)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #4

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream.0"(%"class.hls::stream.0"* noalias nocapture align 512, %"class.hls::stream.0"* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %"class.hls::stream.0"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream.0"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_8(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream.0"* %2 to i8*
  %6 = bitcast %"class.hls::stream.0"* %1 to i8*
  call void @fpga_fifo_pop_8(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream.0", %"class.hls::stream.0"* %2
  %8 = bitcast %"class.hls::stream.0"* %2 to i8*
  %9 = bitcast %"class.hls::stream.0"* %0 to i8*
  call void @fpga_fifo_push_8(i8* %8, i8* %9)
  br label %empty, !llvm.loop !7

ret:                                              ; preds = %empty
  %10 = bitcast %"class.hls::stream.0"* %1 to i8*
  %11 = bitcast %"class.hls::stream.0"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 8, i1 false)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0struct.std::complex"(%"struct.std::complex"* noalias nocapture align 512, %"struct.std::complex"* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %"struct.std::complex"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"struct.std::complex"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_8(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"struct.std::complex"* %2 to i8*
  %6 = bitcast %"struct.std::complex"* %1 to i8*
  call void @fpga_fifo_pop_8(i8* %5, i8* %6)
  %7 = load volatile %"struct.std::complex", %"struct.std::complex"* %2
  %8 = bitcast %"struct.std::complex"* %2 to i8*
  %9 = bitcast %"struct.std::complex"* %0 to i8*
  call void @fpga_fifo_push_8(i8* %8, i8* %9)
  br label %empty, !llvm.loop !8

ret:                                              ; preds = %empty
  %10 = bitcast %"struct.std::complex"* %1 to i8*
  %11 = bitcast %"struct.std::complex"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 8, i1 false)
  ret void
}

; Function Attrs: noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream.1"(%"class.hls::stream.1"* noalias align 512, %"class.hls::stream.1"* noalias) unnamed_addr #2 {
entry:
  %2 = icmp eq %"class.hls::stream.1"* %0, null
  %3 = icmp eq %"class.hls::stream.1"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %5 = bitcast %"class.hls::stream.1"* %1 to i8*
  %6 = call i1 @fpga_fifo_exist_4(i8* %5)
  br i1 %6, label %7, label %8

; <label>:7:                                      ; preds = %copy
  call fastcc void @"streamcpy_hls.p0class.hls::stream.1"(%"class.hls::stream.1"* nonnull align 512 %0, %"class.hls::stream.1"* nonnull %1)
  br label %ret

; <label>:8:                                      ; preds = %copy
  %.0 = getelementptr %"class.hls::stream.1", %"class.hls::stream.1"* %1, i32 0, i32 0
  %.01 = getelementptr %"class.hls::stream.1", %"class.hls::stream.1"* %0, i32 0, i32 0
  %9 = call i1 @fpga_fifo_exist_4(i8* %5)
  br i1 %9, label %10, label %11

; <label>:10:                                     ; preds = %8
  call fastcc void @"streamcpy_hls.p0class.hls::stream.2"(%"class.hls::stream.2"* align 512 %.01, %"class.hls::stream.2"* %.0)
  br label %ret

; <label>:11:                                     ; preds = %8
  %12 = bitcast %"class.hls::stream.1"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %12, i8* align 1 %5, i64 4, i1 false)
  br label %ret

ret:                                              ; preds = %11, %10, %7, %entry
  ret void
}

declare i1 @fpga_fifo_exist_4(i8*) local_unnamed_addr

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream.1"(%"class.hls::stream.1"* noalias nocapture align 512, %"class.hls::stream.1"* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %"class.hls::stream.1"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream.1"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_4(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream.1"* %2 to i8*
  %6 = bitcast %"class.hls::stream.1"* %1 to i8*
  call void @fpga_fifo_pop_4(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream.1", %"class.hls::stream.1"* %2
  %8 = bitcast %"class.hls::stream.1"* %2 to i8*
  %9 = bitcast %"class.hls::stream.1"* %0 to i8*
  call void @fpga_fifo_push_4(i8* %8, i8* %9)
  br label %empty, !llvm.loop !9

ret:                                              ; preds = %empty
  %10 = bitcast %"class.hls::stream.1"* %1 to i8*
  %11 = bitcast %"class.hls::stream.1"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 4, i1 false)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream.2"(%"class.hls::stream.2"* noalias nocapture align 512, %"class.hls::stream.2"* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %"class.hls::stream.2"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream.2"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_4(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream.2"* %2 to i8*
  %6 = bitcast %"class.hls::stream.2"* %1 to i8*
  call void @fpga_fifo_pop_4(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream.2", %"class.hls::stream.2"* %2
  %8 = bitcast %"class.hls::stream.2"* %2 to i8*
  %9 = bitcast %"class.hls::stream.2"* %0 to i8*
  call void @fpga_fifo_push_4(i8* %8, i8* %9)
  br label %empty, !llvm.loop !10

ret:                                              ; preds = %empty
  %10 = bitcast %"class.hls::stream.2"* %1 to i8*
  %11 = bitcast %"class.hls::stream.2"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 4, i1 false)
  ret void
}

; Function Attrs: noinline
define internal fastcc void @copy_out(%"class.hls::stream"*, %"class.hls::stream"* noalias align 512, %"class.hls::stream.1"*, %"class.hls::stream.1"* noalias align 512) unnamed_addr #5 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream"(%"class.hls::stream"* %0, %"class.hls::stream"* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream.1"(%"class.hls::stream.1"* %2, %"class.hls::stream.1"* align 512 %3)
  ret void
}

declare void @apatb_axi_modulus_hw(%"class.hls::stream"*, %"class.hls::stream.1"*)

define void @axi_modulus_hw_stub_wrapper(%"class.hls::stream"*, %"class.hls::stream.1"*) #6 {
entry:
  call void @copy_out(%"class.hls::stream"* null, %"class.hls::stream"* %0, %"class.hls::stream.1"* null, %"class.hls::stream.1"* %1)
  call void @axi_modulus_hw_stub(%"class.hls::stream"* %0, %"class.hls::stream.1"* %1)
  call void @copy_in(%"class.hls::stream"* null, %"class.hls::stream"* %0, %"class.hls::stream.1"* null, %"class.hls::stream.1"* %1)
  ret void
}

declare void @axi_modulus_hw_stub(%"class.hls::stream"*, %"class.hls::stream.1"*)

declare i1 @fpga_fifo_not_empty_8(i8*)

declare i1 @fpga_fifo_not_empty_4(i8*)

declare void @fpga_fifo_pop_8(i8*, i8*)

declare void @fpga_fifo_pop_4(i8*, i8*)

declare void @fpga_fifo_push_8(i8*, i8*)

declare void @fpga_fifo_push_4(i8*, i8*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { noinline "fpga.wrapper.func"="copyin" }
attributes #2 = { noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline "fpga.wrapper.func"="streamcpy_hls" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { noinline "fpga.wrapper.func"="copyout" }
attributes #6 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.rotate.disable"}
!7 = distinct !{!7, !6}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !6}
!10 = distinct !{!10, !6}
