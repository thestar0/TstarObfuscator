; ModuleID = 'IR/TestProgram.ll'
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
@x = private global i32 22038
@y = private global i32 6656
@x.1 = private global i32 1309
@y.2 = private global i32 10998
@x.3 = private global i32 23894
@y.4 = private global i32 29059
@x.5 = private global i32 4705
@y.6 = private global i32 22895
@x.7 = private global i32 28711
@y.8 = private global i32 6019
@x.9 = private global i32 15854
@y.10 = private global i32 3232
@x.11 = private global i32 13178
@y.12 = private global i32 12875
@x.13 = private global i32 11649
@y.14 = private global i32 20804
@x.15 = private global i32 4472
@y.16 = private global i32 4083
@x.17 = private global i32 5783
@y.18 = private global i32 31452
@x.19 = private global i32 4853
@y.20 = private global i32 8892
@x.21 = private global i32 797
@y.22 = private global i32 14909
@x.23 = private global i32 16107
@y.24 = private global i32 32304
@x.25 = private global i32 19340
@y.26 = private global i32 12680
@x.27 = private global i32 14591
@y.28 = private global i32 25858
@x.29 = private global i32 28847
@y.30 = private global i32 28303
@x.31 = private global i32 7729
@y.32 = private global i32 16338
@x.33 = private global i32 20686
@y.34 = private global i32 15370
@x.35 = private global i32 13489
@y.36 = private global i32 23453
@x.37 = private global i32 12154
@y.38 = private global i32 99
@x.39 = private global i32 12952
@y.40 = private global i32 15006
@x.41 = private global i32 29059
@y.42 = private global i32 14543
@x.43 = private global i32 6199
@y.44 = private global i32 30219
@x.45 = private global i32 15846
@y.46 = private global i32 27546
@x.47 = private global i32 21944
@y.48 = private global i32 14786
@x.49 = private global i32 13945
@y.50 = private global i32 25479

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
  br label %10

10:                                               ; preds = %109, %2
  %11 = load i32, i32* %6, align 4
  %12 = load i32, i32* %5, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %190

14:                                               ; preds = %10
  %15 = load i8*, i8** %4, align 8
  %16 = load i32, i32* %6, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i8, i8* %15, i64 %17
  %19 = load i8, i8* %18, align 1
  %20 = sext i8 %19 to i32
  %21 = load i32, i32* %6, align 4
  %22 = load i32, i32* @x, align 4
  %23 = load i32, i32* @y, align 4
  %24 = load i32, i32* @x.3, align 4
  %25 = load i32, i32* @y.4, align 4
  %26 = load i32, i32* @x.15, align 4
  %27 = load i32, i32* @y.16, align 4
  %28 = shl i32 %26, 5
  %29 = lshr i32 %27, 3
  %30 = or i32 %28, %29
  %31 = xor i32 %30, 142047
  %32 = mul i32 %24, %31
  %33 = load i32, i32* @x.17, align 4
  %34 = load i32, i32* @y.18, align 4
  %35 = mul i32 %33, 29377
  %36 = mul i32 %34, 10487
  %37 = add i32 %35, %36
  %38 = add i32 %37, -499696946
  %39 = mul i32 %25, %38
  %40 = add i32 %32, %39
  %41 = load i32, i32* @x.19, align 4
  %42 = load i32, i32* @y.20, align 4
  %43 = shl i32 %41, 5
  %44 = lshr i32 %42, 3
  %45 = or i32 %43, %44
  %46 = xor i32 %45, -826773623
  %47 = add i32 %40, %46
  %48 = mul i32 %22, %47
  %49 = load i32, i32* @x.5, align 4
  %50 = load i32, i32* @y.6, align 4
  %51 = load i32, i32* @x.21, align 4
  %52 = load i32, i32* @y.22, align 4
  %53 = shl i32 %51, 5
  %54 = lshr i32 %52, 3
  %55 = or i32 %53, %54
  %56 = xor i32 %55, 18386
  %57 = mul i32 %49, %56
  %58 = load i32, i32* @x.23, align 4
  %59 = load i32, i32* @y.24, align 4
  %60 = shl i32 %58, 5
  %61 = lshr i32 %59, 3
  %62 = or i32 %60, %61
  %63 = xor i32 %62, 501282
  %64 = mul i32 %50, %63
  %65 = add i32 %57, %64
  %66 = load i32, i32* @x.25, align 4
  %67 = load i32, i32* @y.26, align 4
  %68 = shl i32 %66, 5
  %69 = lshr i32 %67, 3
  %70 = or i32 %68, %69
  %71 = xor i32 %70, -751886830
  %72 = add i32 %65, %71
  %73 = mul i32 %23, %72
  %74 = add i32 %48, %73
  %75 = load i32, i32* @x.7, align 4
  %76 = load i32, i32* @y.8, align 4
  %77 = load i32, i32* @x.27, align 4
  %78 = load i32, i32* @y.28, align 4
  %79 = shl i32 %77, 5
  %80 = lshr i32 %78, 3
  %81 = or i32 %79, %80
  %82 = xor i32 %81, 483957
  %83 = mul i32 %75, %82
  %84 = load i32, i32* @x.29, align 4
  %85 = load i32, i32* @y.30, align 4
  %86 = shl i32 %84, 5
  %87 = lshr i32 %85, 3
  %88 = or i32 %86, %87
  %89 = xor i32 %88, 927265
  %90 = mul i32 %76, %89
  %91 = add i32 %83, %90
  %92 = load i32, i32* @x.31, align 4
  %93 = load i32, i32* @y.32, align 4
  %94 = shl i32 %92, 5
  %95 = lshr i32 %93, 3
  %96 = or i32 %94, %95
  %97 = xor i32 %96, -1802193207
  %98 = add i32 %91, %97
  %99 = add i32 %74, %98
  %100 = sub nsw i32 %99, %21
  %101 = add nsw i32 %20, %100
  %102 = load i32, i32* %6, align 4
  %103 = xor i32 %101, %102
  %104 = trunc i32 %103 to i8
  %105 = load i8*, i8** %3, align 8
  %106 = load i32, i32* %6, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds i8, i8* %105, i64 %107
  store i8 %104, i8* %108, align 1
  br label %109

109:                                              ; preds = %14
  %110 = load i32, i32* %6, align 4
  %111 = load i32, i32* @x.1, align 4
  %112 = load i32, i32* @y.2, align 4
  %113 = load i32, i32* @x.9, align 4
  %114 = load i32, i32* @y.10, align 4
  %115 = load i32, i32* @x.33, align 4
  %116 = load i32, i32* @y.34, align 4
  %117 = mul i32 %115, 7705
  %118 = mul i32 %116, 24769
  %119 = add i32 %117, %118
  %120 = add i32 %119, -540072015
  %121 = mul i32 %113, %120
  %122 = load i32, i32* @x.35, align 4
  %123 = load i32, i32* @y.36, align 4
  %124 = mul i32 %122, 7303
  %125 = mul i32 %123, 23976
  %126 = add i32 %124, %125
  %127 = add i32 %126, -660810821
  %128 = mul i32 %114, %127
  %129 = add i32 %121, %128
  %130 = load i32, i32* @x.37, align 4
  %131 = load i32, i32* @y.38, align 4
  %132 = shl i32 %130, 5
  %133 = lshr i32 %131, 3
  %134 = or i32 %132, %133
  %135 = xor i32 %134, -235419317
  %136 = add i32 %129, %135
  %137 = shl i32 %111, %136
  %138 = load i32, i32* @x.11, align 4
  %139 = load i32, i32* @y.12, align 4
  %140 = load i32, i32* @x.39, align 4
  %141 = load i32, i32* @y.40, align 4
  %142 = shl i32 %140, 5
  %143 = lshr i32 %141, 3
  %144 = or i32 %142, %143
  %145 = xor i32 %144, 418019
  %146 = mul i32 %138, %145
  %147 = load i32, i32* @x.41, align 4
  %148 = load i32, i32* @y.42, align 4
  %149 = mul i32 %147, 18165
  %150 = mul i32 %148, 15630
  %151 = add i32 %149, %150
  %152 = add i32 %151, -755161378
  %153 = mul i32 %139, %152
  %154 = add i32 %146, %153
  %155 = load i32, i32* @x.43, align 4
  %156 = load i32, i32* @y.44, align 4
  %157 = mul i32 %155, 20312
  %158 = mul i32 %156, 7108
  %159 = add i32 %157, %158
  %160 = add i32 %159, -560081430
  %161 = add i32 %154, %160
  %162 = lshr i32 %112, %161
  %163 = or i32 %137, %162
  %164 = load i32, i32* @x.13, align 4
  %165 = load i32, i32* @y.14, align 4
  %166 = load i32, i32* @x.45, align 4
  %167 = load i32, i32* @y.46, align 4
  %168 = mul i32 %166, 1260
  %169 = mul i32 %167, 32185
  %170 = add i32 %168, %169
  %171 = add i32 %170, -906518405
  %172 = mul i32 %164, %171
  %173 = load i32, i32* @x.47, align 4
  %174 = load i32, i32* @y.48, align 4
  %175 = shl i32 %173, 5
  %176 = lshr i32 %174, 3
  %177 = or i32 %175, %176
  %178 = xor i32 %177, 689574
  %179 = mul i32 %165, %178
  %180 = add i32 %172, %179
  %181 = load i32, i32* @x.49, align 4
  %182 = load i32, i32* @y.50, align 4
  %183 = shl i32 %181, 5
  %184 = lshr i32 %182, 3
  %185 = or i32 %183, %184
  %186 = xor i32 %185, -450476854
  %187 = add i32 %180, %186
  %188 = xor i32 %163, %187
  %189 = add nsw i32 %110, %188
  store i32 %189, i32* %6, align 4
  br label %10, !llvm.loop !2

190:                                              ; preds = %10
  ret void
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #1

; Function Attrs: noinline norecurse optnone uwtable mustprogress
define dso_local i32 @main(i32 %0, i8** %1) #2 {
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
  br i1 %10, label %11, label %13

11:                                               ; preds = %2
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.1, i64 0, i64 0))
  store i32 0, i32* %3, align 4
  br label %39

13:                                               ; preds = %2
  %14 = load i8**, i8*** %5, align 8
  %15 = getelementptr inbounds i8*, i8** %14, i64 1
  %16 = load i8*, i8** %15, align 8
  store i8* %16, i8** @input, align 8
  %17 = load i8*, i8** @input, align 8
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0), i8* %17)
  %19 = bitcast [100 x i8]* %6 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %19, i8 0, i64 100, i1 false)
  %20 = getelementptr inbounds [100 x i8], [100 x i8]* %6, i64 0, i64 0
  %21 = load i8*, i8** @input, align 8
  call void @_Z7encryptPhPc(i8* %20, i8* %21)
  %22 = load i8*, i8** @input, align 8
  %23 = call i64 @strlen(i8* %22) #5
  %24 = icmp eq i64 %23, 22
  br i1 %24, label %25, label %30

25:                                               ; preds = %13
  %26 = getelementptr inbounds [100 x i8], [100 x i8]* %6, i64 0, i64 0
  %27 = call i32 @memcmp(i8* %26, i8* getelementptr inbounds ([100 x i8], [100 x i8]* bitcast (<{ [22 x i8], [78 x i8] }>* @enc to [100 x i8]*), i64 0, i64 0), i64 22) #5
  %28 = icmp ne i32 %27, 0
  %29 = xor i1 %28, true
  br label %30

30:                                               ; preds = %25, %13
  %31 = phi i1 [ false, %13 ], [ %29, %25 ]
  %32 = zext i1 %31 to i8
  store i8 %32, i8* %7, align 1
  %33 = load i8, i8* %7, align 1
  %34 = trunc i8 %33 to i1
  br i1 %34, label %35, label %37

35:                                               ; preds = %30
  %36 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i64 0, i64 0))
  br label %39

37:                                               ; preds = %30
  %38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.4, i64 0, i64 0))
  br label %39

39:                                               ; preds = %37, %35, %11
  %40 = load i32, i32* %3, align 4
  ret i32 %40
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
!2 = distinct !{!2, !3}
!3 = !{!"llvm.loop.mustprogress"}
