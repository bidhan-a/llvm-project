; RUN: llc < %s -mtriple=bpfel | FileCheck %s
; RUN: llc < %s -mtriple=bpfeb | FileCheck %s

; CHECK-LABEL: atomic_fence
; CHECK: #MEMBARRIER
; CHECK: #MEMBARRIER
; CHECK: #MEMBARRIER
; CHECK: #MEMBARRIER
; CHECK: #MEMBARRIER
; CHECK: exit
define void @atomic_fence() nounwind {
entry:
  fence acquire
  fence release
  fence acq_rel
  fence seq_cst
  fence syncscope("singlethread") seq_cst
  ret void
}
