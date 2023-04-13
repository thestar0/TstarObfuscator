; ModuleID = 'IR/TestProgram_lowerswitch.ll'
source_filename = "TestProgram.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@input = dso_local global i8* null, align 8
@enc = dso_local global <{ [22 x i8], [78 x i8] }> <{ [22 x i8] c"\86\8A}\87\93\8BM\81\80\8AC\7FII\86q\7FbSi(\9D", [78 x i8] zeroinitializer }>, align 16
@.str = private unnamed_addr constant [26 x i8] c"Welcome to LLVM world...\0A\00", align 1
@.str.1 = private unnamed_addr constant [33 x i8] c"Input your flag as an argument.\0A\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Your flag is: %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [18 x i8] c"Congratulations~\0A\00", align 1
@.str.4 = private unnamed_addr constant [18 x i8] c"Sorry try again.\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable mustprogress
define dso_local void @_Z7encryptPhPc(i8* %0, i8* %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %7 = load i8*, i8** %4, align 8
  %8 = call i64 @strlen(i8* %7) #5
  %9 = trunc i64 %8 to i32
  store i32 %9, i32* %5, align 4
  store i32 0, i32* %6, align 4
  %swVar.ptr = alloca i32, align 4
  store i32 1287139532, i32* %swVar.ptr, align 4
  br label %dispatchBB

dispatchBB:                                       ; preds = %returnBB, %2
  %swVar = load i32, i32* %swVar.ptr, align 4
  switch i32 %swVar, label %defaultBB [
    i32 1287139532, label %10
    i32 1787494655, label %15
    i32 1673515647, label %32
    i32 269276598, label %35
  ]

defaultBB:                                        ; preds = %dispatchBB
  br label %returnBB

10:                                               ; preds = %dispatchBB
  %11 = load i32, i32* %6, align 4
  %12 = load i32, i32* %5, align 4
  %13 = icmp slt i32 %11, %12
  %14 = select i1 %13, i32 1787494655, i32 269276598
  store i32 %14, i32* %swVar.ptr, align 4
  br label %returnBB

15:                                               ; preds = %dispatchBB
  %16 = load i8*, i8** %4, align 8
  %17 = load i32, i32* %6, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i8, i8* %16, i64 %18
  %20 = load i8, i8* %19, align 1
  %21 = sext i8 %20 to i32
  %22 = load i32, i32* %6, align 4
  %23 = sub nsw i32 32, %22
  %24 = add nsw i32 %21, %23
  %25 = load i32, i32* %6, align 4
  %26 = xor i32 %24, %25
  %27 = trunc i32 %26 to i8
  %28 = load i8*, i8** %3, align 8
  %29 = load i32, i32* %6, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i8, i8* %28, i64 %30
  store i8 %27, i8* %31, align 1
  store i32 1673515647, i32* %swVar.ptr, align 4
  br label %returnBB

32:                                               ; preds = %dispatchBB
  %33 = load i32, i32* %6, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %6, align 4
  store i32 1287139532, i32* %swVar.ptr, align 4
  br label %returnBB

35:                                               ; preds = %dispatchBB
  ret void

returnBB:                                         ; preds = %32, %15, %10, %defaultBB
  br label %dispatchBB
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #1

; Function Attrs: noinline norecurse optnone uwtable mustprogress
define dso_local i32 @main(i32 %0, i8** %1) #2 {
  %.reg2mem1 = alloca i1, align 1
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca [100 x i8], align 16
  %7 = alloca i8, align 1
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str, i64 0, i64 0))
  %9 = load i32, i32* %4, align 4
  %10 = icmp sle i32 %9, 1
  store i1 %10, i1* %.reg2mem1, align 1
  %swVar.ptr = alloca i32, align 4
  store i32 1615933409, i32* %swVar.ptr, align 4
  %.reg2mem = alloca i1, align 1
  br label %dispatchBB

dispatchBB:                                       ; preds = %returnBB, %2
  %swVar = load i32, i32* %swVar.ptr, align 4
  switch i32 %swVar, label %defaultBB [
    i32 1615933409, label %11
    i32 598490564, label %13
    i32 1767200842, label %15
    i32 1052235578, label %28
    i32 2122211416, label %33
    i32 482752503, label %38
    i32 1171224961, label %40
    i32 792235128, label %42
  ]

defaultBB:                                        ; preds = %dispatchBB
  br label %returnBB

11:                                               ; preds = %dispatchBB
  %.reload2 = load volatile i1, i1* %.reg2mem1, align 1
  %12 = select i1 %.reload2, i32 598490564, i32 1767200842
  store i32 %12, i32* %swVar.ptr, align 4
  br label %returnBB

13:                                               ; preds = %dispatchBB
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.1, i64 0, i64 0))
  store i32 0, i32* %3, align 4
  store i32 792235128, i32* %swVar.ptr, align 4
  br label %returnBB

15:                                               ; preds = %dispatchBB
  %16 = load i8**, i8*** %5, align 8
  %17 = getelementptr inbounds i8*, i8** %16, i64 1
  %18 = load i8*, i8** %17, align 8
  store i8* %18, i8** @input, align 8
  %19 = load i8*, i8** @input, align 8
  %20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0), i8* %19)
  %21 = bitcast [100 x i8]* %6 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %21, i8 0, i64 100, i1 false)
  %22 = getelementptr inbounds [100 x i8], [100 x i8]* %6, i64 0, i64 0
  %23 = load i8*, i8** @input, align 8
  call void @_Z7encryptPhPc(i8* %22, i8* %23)
  %24 = load i8*, i8** @input, align 8
  %25 = call i64 @strlen(i8* %24) #5
  %26 = icmp eq i64 %25, 22
  %27 = select i1 %26, i32 1052235578, i32 2122211416
  store i32 %27, i32* %swVar.ptr, align 4
  store i1 false, i1* %.reg2mem, align 1
  br label %returnBB

28:                                               ; preds = %dispatchBB
  %29 = getelementptr inbounds [100 x i8], [100 x i8]* %6, i64 0, i64 0
  %30 = call i32 @memcmp(i8* %29, i8* getelementptr inbounds ([100 x i8], [100 x i8]* bitcast (<{ [22 x i8], [78 x i8] }>* @enc to [100 x i8]*), i64 0, i64 0), i64 22) #5
  %31 = icmp ne i32 %30, 0
  %32 = xor i1 %31, true
  store i32 2122211416, i32* %swVar.ptr, align 4
  store i1 %32, i1* %.reg2mem, align 1
  br label %returnBB

33:                                               ; preds = %dispatchBB
  %.reload = load i1, i1* %.reg2mem, align 1
  %34 = zext i1 %.reload to i8
  store i8 %34, i8* %7, align 1
  %35 = load i8, i8* %7, align 1
  %36 = trunc i8 %35 to i1
  %37 = select i1 %36, i32 482752503, i32 1171224961
  store i32 %37, i32* %swVar.ptr, align 4
  br label %returnBB

38:                                               ; preds = %dispatchBB
  %39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i64 0, i64 0))
  store i32 792235128, i32* %swVar.ptr, align 4
  br label %returnBB

40:                                               ; preds = %dispatchBB
  %41 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.4, i64 0, i64 0))
  store i32 792235128, i32* %swVar.ptr, align 4
  br label %returnBB

42:                                               ; preds = %dispatchBB
  %43 = load i32, i32* %3, align 4
  ret i32 %43

returnBB:                                         ; preds = %40, %38, %33, %28, %15, %13, %11, %defaultBB
  br label %dispatchBB
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @memcmp(i8*, i8*, i64) #1

attributes #0 = { noinline nounwind optnone uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly willreturn "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse optnone uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nofree nosync nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.1"}
