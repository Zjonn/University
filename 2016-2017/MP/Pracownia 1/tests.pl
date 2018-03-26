:- module(tests, [tests/5]).
% definiujemy operatory ~/1 oraz v/2
:- op(200, fx, ~).
:- op(500, xfy, v).

tests(small_testcase0, validity, [~a, ~a v ~b v b v ~b, ~a v c, a, a v c v a], 2000, count(0)).
tests(small_testcase1, validity, [~a, a v ~c, b v ~c, b v ~a], 2000, count(2)).
tests(small_testcase2, validity, [~c, ~c v ~c, ~c v ~b v ~c v ~c, c v c], 2000, count(0)).
tests(small_testcase3, validity, [~c v ~b v ~a, ~b v ~a v b, a, b v b, c v c v ~c], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase4, validity, [~c v b, ~a, ~a v b v a, ~a v c, b v ~b v b], 2000, count(3)).
tests(small_testcase5, validity, [~c, ~a, ~a v b v b, a v ~b v b, c v a], 2000, count(0)).
tests(small_testcase6, validity, [a v b v b v a, b, c v ~c v a, c v ~b v ~a, c v ~b v b v ~a], 2000, count(3)).
tests(small_testcase7, validity, [~c v ~c v c, ~c v ~b v ~a, a, a v ~a, b v ~a v a v ~a], 2000, count(3)).
tests(small_testcase8, validity, [~b, ~b v a v ~a v c, a, c v ~b v ~c], 2000, count(2)).
tests(small_testcase9, validity, [~c v ~a v ~b v ~c, ~a v a v b, a v ~a, b, c v a v ~b v ~a], 2000, count(3)).
tests(small_testcase10, validity, [~c v ~c, ~a, ~a v ~b, a v ~c v ~a v ~c, b v ~b], 2000, count(2)).
tests(small_testcase11, validity, [~b, ~a v b v ~c, a, a v b, c], 2000, count(0)).
tests(small_testcase12, validity, [~a v ~c v c v ~b, ~a v a, a, c v ~b, c v c], 2000, count(2)).
tests(small_testcase13, validity, [~c v ~b, ~a v ~b, a, b v ~a, c v a], 2000, count(0)).
tests(small_testcase14, validity, [~c v ~b, ~b v ~b, ~a v ~b v b v ~c, a v ~b, c v ~b v ~b], 2000, count(4)).
tests(small_testcase15, validity, [~c v a v a v ~c, ~a, a v b, b v c v ~a], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase16, validity, [~c v a v ~c v b, ~a v ~c, b v b v ~a v ~b, b v c v ~c], 2000, count(5)).
tests(small_testcase17, validity, [~b, ~b v b, ~b v b v a v b, a, b v ~a v ~b], 2000, solution([(a, t) ,(b, f)])).
tests(small_testcase18, validity, [~b v ~c, ~b v ~a v ~b, ~b v ~a v c, a v ~b v ~c, c], 2000, count(2)).
tests(small_testcase19, validity, [~c, ~b v ~b, c v ~c v ~a v ~b, c v b v b v b, c v c v ~b v ~b], 2000, count(0)).
tests(small_testcase20, validity, [~b v ~a v ~c, a v ~c v ~c v b, b, b v a v c v ~a, c v ~c v ~b v c], 2000, count(3)).
tests(small_testcase21, validity, [~b v a v c v ~b, ~b v c v c, ~a v ~a, ~a v c, a v ~c], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase22, validity, [b, b v ~b, b v b v c, c v ~c v a v b, c v c v c], 2000, count(2)).
tests(small_testcase23, validity, [~b, ~a v ~a, a, c v ~a v b v ~a, c v c v ~b v a], 2000, count(0)).
tests(small_testcase24, validity, [~b, ~b v ~a v ~b, a, b v a v ~c, c], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase25, validity, [~c, ~a, b v ~c, b v b, c v a], 2000, count(0)).
tests(small_testcase26, validity, [~c v b v ~a, ~b v b, a v a v a, b, c v ~c], 2000, count(2)).
tests(small_testcase27, validity, [~b v ~b v a, ~b v a v a v ~a, a v ~a, c v ~c v ~c v ~a, c v a], 2000, count(5)).
tests(small_testcase28, validity, [~c v ~b, ~c v a, ~b v ~c v ~c v a, ~a, b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase29, validity, [~a, a v ~c, a v ~a v c v c, a v c v a v ~c, b v c v ~a v a], 2000, count(2)).
tests(small_testcase30, validity, [~c v c v c v b, b, b v ~b v ~b, b v ~a v ~a v ~b, c v ~a v b], 2000, count(4)).
tests(small_testcase31, validity, [~c, ~c v ~a v a, ~b, a v a v ~c v ~c, c v ~c v a], 2000, count(2)).
tests(small_testcase32, validity, [~c v a v b v ~b, a v ~a, c, c v b v b, c v c v ~b v ~b], 2000, count(4)).
tests(small_testcase33, validity, [~b v ~c v ~c v a, ~b v c v ~a, ~a v ~a, a v ~c v ~a v c, a v ~a], 2000, count(3)).
tests(small_testcase34, validity, [~b v a, ~a v b, a v ~a v ~b v c, b v a, c v c], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase35, validity, [~c v ~c, ~c v ~b, ~b, ~b v c v a, c], 2000, count(0)).
tests(small_testcase36, validity, [~c, ~c v b v ~a, b, b v c v ~c, c v ~b], 2000, count(0)).
tests(small_testcase37, validity, [~b, ~a, ~a v ~c, ~a v b v a v ~b], 2000, count(2)).
tests(small_testcase38, validity, [~a v ~a v ~a v b, a v ~b, a v ~b v ~a, b v a v ~a v a, b v b], 2000, solution([(a, t) ,(b, t)])).
tests(small_testcase39, validity, [~c v ~a v ~b v b, ~b v a v ~c, a, b v c v c v c, c], 2000, count(2)).
tests(small_testcase40, validity, [~c v ~b v ~b v ~c, ~c v ~a v c v c, ~b v ~b v c v c, ~b v a, ~a v b v ~c], 2000, count(3)).
tests(small_testcase41, validity, [~b v a, ~a v ~c v ~c, ~a v c, a v ~a v ~c v ~a, a v ~a v a v ~a], 2000, count(2)).
tests(small_testcase42, validity, [~c, ~b v ~c v ~a v ~c, ~b v a v ~b, a, b v ~b v c], 2000, count(2)).
tests(small_testcase43, validity, [~b v ~a v ~b, ~a v c v ~b, a v c v a, b v ~b v a v ~c, b v c], 2000, count(3)).
tests(small_testcase44, validity, [~a, a, b, b v c v c v c], 2000, count(0)).
tests(small_testcase45, validity, [~c v a v c v c, ~a v c, a, a v ~b, b v a v b], 2000, count(2)).
tests(small_testcase46, validity, [~c v c v ~a, ~b, ~a v ~b v ~c v c, b v ~c v ~b, c v c v c v ~a], 2000, count(3)).
tests(small_testcase47, validity, [~b, ~b v ~a v ~b v b, ~b v b v ~c, a v ~c v ~b v b, c], 2000, count(2)).
tests(small_testcase48, validity, [~c v c, a, a v c v a v ~c, b v ~c v ~a v ~b, c v ~b v ~a v b], 2000, count(4)).
tests(small_testcase49, validity, [~c, ~c v ~b v c, ~a v ~a v ~b v ~b, b v ~c v ~a, c v a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase50, validity, [~c v ~a, ~c v b, ~b v a v ~b, b v c v b v a, c v ~a v c], 2000, count(0)).
tests(small_testcase51, validity, [a v b v ~a, a v c v a v ~b, b, c], 2000, count(2)).
tests(small_testcase52, validity, [~c v b v ~a, ~a v c v c v ~c, b v b v ~b, b v c v c v b, c v b v ~c], 2000, count(5)).
tests(small_testcase53, validity, [~a, a, b v a v ~a v c, c, c v ~a], 2000, count(0)).
tests(small_testcase54, validity, [~c v a v ~b v ~c, a v b, b v ~b, b v c v ~b v ~a, b v c v c v ~b], 2000, count(5)).
tests(small_testcase55, validity, [~c v a, ~b v c, ~a v ~c v ~b v b, ~a v b v a v ~c, c v c v c v b], 2000, count(2)).
tests(small_testcase56, validity, [~c v ~b v ~a v ~b, ~c v a, ~c v a v ~a v ~b, ~a v c, a v ~b v ~b v b], 2000, count(3)).
tests(small_testcase57, validity, [~c, ~a v b v ~a, a v ~c v a v ~c, c v ~a v ~a, c v c v ~c v a], 2000, count(2)).
tests(small_testcase58, validity, [~c v b v ~c, ~b v c, ~b v c v b, a v b, c], 2000, count(2)).
tests(small_testcase59, validity, [~c v ~c, ~c v b v ~a v c, ~a v ~a, b v c v b, c v ~b v b v ~b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase60, validity, [~b v c v b, ~a v b, ~a v b v ~b v ~a, b v ~c v a v ~b, b v ~a v a v c], 2000, count(6)).
tests(small_testcase61, validity, [~b v ~c, ~a v ~b, a v c v a, b, b v ~c v b], 2000, count(0)).
tests(small_testcase62, validity, [~b v ~b v ~a, ~b v ~a, ~a v ~b v a, ~a v b v c v b, ~a v c v a v a], 2000, count(5)).
tests(small_testcase63, validity, [~b v c, ~a v ~c, a, a v ~a v c, c], 2000, count(0)).
tests(small_testcase64, validity, [~c v a v a v c, ~b v ~a v ~c, b v a, c v a v ~c, c v b v a v a], 2000, count(5)).
tests(small_testcase65, validity, [~b v c v b, ~a v ~a v ~a, a v ~a v a v ~c, a v a, a v a v c], 2000, count(0)).
tests(small_testcase66, validity, [~b, ~a v ~b v b v ~c, a v ~b v c v ~b, a v a v ~a v ~b, c v ~a v ~a v ~c], 2000, count(4)).
tests(small_testcase67, validity, [~c v c, ~a v ~c, ~a v ~b v a v ~a, a v a, c v a v ~a], 2000, count(2)).
tests(small_testcase68, validity, [~b, ~b v b v ~b, ~a v c, a v ~b v ~c, c v a v ~a v ~b], 2000, count(3)).
tests(small_testcase69, validity, [~b v ~c v c v c, ~b v a v ~c, ~b v a v ~b, a v c v a, b v a], 2000, count(4)).
tests(small_testcase70, validity, [~c, ~c v ~b, ~c v ~a v a v c, ~b, c v ~b], 2000, count(2)).
tests(small_testcase71, validity, [~c v b, ~b, ~b v c v ~c, b], 2000, count(0)).
tests(small_testcase72, validity, [~c v c v ~a, ~b v ~a v a, ~a v c v b, a v a v b v a, b v c v b v c], 2000, count(5)).
tests(small_testcase73, validity, [~a v b v c v ~b, a v ~a v ~b, a v ~a v c v ~b, b v ~a v b v a, c v ~c v c v ~b], 2000, count(8)).
tests(small_testcase74, validity, [~a, ~a v a v a v b, c v ~a v ~c v a, c v c v ~c], 2000, count(4)).
tests(small_testcase75, validity, [~c, ~c v ~c v b, ~b v ~c v ~c v a, ~a v c, b v c v a v ~b], 2000, count(2)).
tests(small_testcase76, validity, [~c v ~c, ~a, a v c, b, c v ~c], 2000, count(0)).
tests(small_testcase77, validity, [~c v ~b v a, ~b, ~b v c v b v ~a, ~a v a v a v c, b v ~c v b v ~a], 2000, count(3)).
tests(small_testcase78, validity, [~b v ~a v ~b v ~b, ~a v ~c v ~a, b v c, c v b, c v b v b], 2000, count(3)).
tests(small_testcase79, validity, [~c v a v ~b v c, ~b v c v b v b, ~a v c, a v a v b v ~b, b v ~a v ~a], 2000, count(5)).
tests(small_testcase80, validity, [~a v ~c v c, ~a v ~b, a v b, b v a v ~b, c v c], 2000, count(2)).
tests(small_testcase81, validity, [~a, a v c, b v ~c v ~a v ~c, b v ~a v a v ~b, c v ~a v ~a], 2000, count(2)).
tests(small_testcase82, validity, [~a, ~a v b, ~a v c v a, c], 2000, count(2)).
tests(small_testcase83, validity, [~c v b v ~b, ~a v a v ~a v c, a v ~a v b, b v c v c v ~c, c], 2000, count(4)).
tests(small_testcase84, validity, [~c v ~a v ~c v ~a, ~b, ~a, b v ~c v a v c], 2000, count(2)).
tests(small_testcase85, validity, [~b v a v c, ~a v ~b, a v ~c v ~c, a v b v a, b v a v b v a], 2000, count(2)).
tests(small_testcase86, validity, [~c v ~c, a v a v ~a, b v c, c v ~b v c v ~a, c v b v ~b v ~c], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase87, validity, [~b v ~a v ~a v ~b, ~b v a v ~b, ~a v c v c, a v a v c, c v b], 2000, count(2)).
tests(small_testcase88, validity, [~c v ~c v c v ~a, ~b v ~c v a, b v ~a v ~a, c v ~c, c v ~b v ~a], 2000, count(4)).
tests(small_testcase89, validity, [~c v b, ~b, a v c v b v c, b v ~a v c, c v c v a], 2000, count(0)).
tests(small_testcase90, validity, [~b v b v ~b, ~a, ~a v ~a v c v ~b, c v ~c], 2000, count(4)).
tests(small_testcase91, validity, [~b, ~a v ~a v c, a, c, c v ~c v c], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase92, validity, [~c v ~b v ~b, ~a v c v ~a, a v ~a v ~c v b, a v b v ~c v ~a, b v ~c v c], 2000, count(4)).
tests(small_testcase93, validity, [~c, ~c v ~a v a v ~a, a v ~c v ~c, c, c v b v b], 2000, count(0)).
tests(small_testcase94, validity, [~c, ~c v ~a v ~a, ~a v ~c, c v ~b v ~a, c v c v c], 2000, count(0)).
tests(small_testcase95, validity, [~c v ~a v ~a v c, ~a v c v a, a, a v ~c v b, b], 2000, count(2)).
tests(small_testcase96, validity, [a v ~c v ~b v ~a, b, b v ~b v a v ~b, c v ~c v ~c, c v b v ~a v ~a], 2000, count(4)).
tests(small_testcase97, validity, [~c v b, ~b, a, b, b v ~b], 2000, count(0)).
tests(small_testcase98, validity, [~b v a, ~a v ~b, a v b v a v ~a, b v ~c, c], 2000, count(0)).
tests(small_testcase99, validity, [~c, ~c v ~a, ~b v ~b, ~a, c], 2000, count(0)).
tests(small_testcase100, validity, [~c v ~c v ~a, ~b v a v c, a v ~a v ~b, b, b v b v ~a v a], 2000, count(2)).
tests(small_testcase101, validity, [~b v b, a v c v c, b v b, c v ~c, c v c v ~b], 2000, count(2)).
tests(small_testcase102, validity, [~c, ~c v ~a v ~c, a v a v c, b v ~a v ~c v a, b v b v a v a], 2000, count(2)).
tests(small_testcase103, validity, [~a, ~a v ~a v a, b, c v ~b], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase104, validity, [~a v ~c, ~a v ~c v ~b v ~c, a v c v b, b v ~c v a v ~b, b v b v c v a], 2000, count(5)).
tests(small_testcase105, validity, [~b v ~b, ~b v ~b v ~c v ~b, ~b v ~b v ~b v b, a v ~a, b v a v c v ~c], 2000, count(4)).
tests(small_testcase106, validity, [~c, ~a, ~a v ~c v ~c, a v c, c v b v ~b v ~c], 2000, count(0)).
tests(small_testcase107, validity, [~c v ~c v c, ~b, ~a v ~a v ~c, a v ~c v ~c, c], 2000, count(0)).
tests(small_testcase108, validity, [~b v c v ~a v a, ~a v ~a v a v ~c, a v ~c v b v a, b v c v a, c], 2000, count(3)).
tests(small_testcase109, validity, [~b v c, ~a v ~b v b v ~b, ~a v ~a, b, b v a], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase110, validity, [~c v ~b, ~c v ~a v b v a, ~c v b v a v c, ~b, ~a], 2000, count(2)).
tests(small_testcase111, validity, [~b v ~c, ~a v a, ~a v c v b, c v ~a, c v ~a v b], 2000, count(4)).
tests(small_testcase112, validity, [~c v ~a v ~b, ~b, ~b v c, a, a v ~b v a v ~c], 2000, count(2)).
tests(small_testcase113, validity, [~b, ~a v ~b v ~c, a, a v b v a v ~a, c v ~a v ~c v b], 2000, count(2)).
tests(small_testcase114, validity, [~c v ~b v ~c v b, ~b, ~b v ~a v ~a v b, ~b v c v ~c, c v a], 2000, count(3)).
tests(small_testcase115, validity, [~a v ~a v a, c, c v ~b, c v ~a v ~b v ~b, c v ~a v b], 2000, count(4)).
tests(small_testcase116, validity, [~c, ~b, ~a v a, ~a v b v ~a v ~b, c], 2000, count(0)).
tests(small_testcase117, validity, [~b v a v c v a, ~b v c, b, b v a, b v c v ~c], 2000, count(2)).
tests(small_testcase118, validity, [~c v c v ~b v a, ~b, ~b v ~b v ~a, ~b v c v b, a v ~b], 2000, count(4)).
tests(small_testcase119, validity, [~c, ~c v ~b, ~a v b, a v ~a v ~a, b v b v c v c], 2000, count(2)).
tests(small_testcase120, validity, [~c v ~b v ~a, ~c v c v c, ~b, ~b v ~c v ~a, a v ~c], 2000, count(3)).
tests(small_testcase121, validity, [~c, ~c v c, ~b v c v ~c, a v c v ~a v ~c, b v b], 2000, count(2)).
tests(small_testcase122, validity, [~a, ~a v ~c, ~a v ~b v ~b, c, c v a], 2000, count(2)).
tests(small_testcase123, validity, [~b v ~c v a v b, ~b v b v ~b v ~a, ~a v ~a v ~b v ~c, a, c v ~b v ~c v ~b], 2000, count(3)).
tests(small_testcase124, validity, [~b, ~a v a v b v c, a v ~c v ~b v c, c v ~c, c v ~b v ~c], 2000, count(4)).
tests(small_testcase125, validity, [~b v ~b v a, ~b v ~b v c, c, c v ~b, c v a v c v b], 2000, count(3)).
tests(small_testcase126, validity, [~a v ~a, a v ~c v ~c v c, b, b v a, c v c v ~a], 2000, count(2)).
tests(small_testcase127, validity, [~c, ~a, ~a v ~a v a, a v ~b v ~b v ~b, b v c v ~c], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase128, validity, [~c v ~c v a v ~b, a v ~c, b v ~a v a v a, c v a, c v a v a], 2000, count(4)).
tests(small_testcase129, validity, [~c, a, a v ~c v b, b v b v ~a v ~c, c v c], 2000, count(0)).
tests(small_testcase130, validity, [~b v ~c v ~c, ~b v a v a v c, a, a v b v ~b, b v c v ~b v b], 2000, count(3)).
tests(small_testcase131, validity, [~c v ~b, ~a v c v ~c v ~b, c, c v ~c, c v c], 2000, count(2)).
tests(small_testcase132, validity, [~b v ~a v a, ~a, a v ~c, a v ~b v ~c, b v a v c v a], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase133, validity, [~b v ~a, ~b v a, ~a v ~b, a v a, b v ~b v a], 2000, solution([(a, t) ,(b, f)])).
tests(small_testcase134, validity, [~c v ~b, a v ~c, b v ~a v ~b v ~b, b v a v ~c v ~c, b v a v ~b], 2000, count(5)).
tests(small_testcase135, validity, [~b v ~b v a v ~b, ~a v ~c, a, a v a v a v ~b, c v ~c v b], 2000, count(2)).
tests(small_testcase136, validity, [~c v c, ~a v ~c v ~b v ~c, ~a v ~b v a v ~c, a v ~c v ~a, b], 2000, count(3)).
tests(small_testcase137, validity, [~b v b, ~a v c v ~c, a, c v ~a v b v ~c, c v a v a], 2000, count(4)).
tests(small_testcase138, validity, [~c, ~b v c v ~c, c, c v ~c v a v ~c, c v ~a], 2000, count(0)).
tests(small_testcase139, validity, [~c, ~a, c, c v a v ~b v ~a], 2000, count(0)).
tests(small_testcase140, validity, [~c v ~b, ~b v a v ~a v b, a v ~b, a v ~b v ~a], 2000, count(5)).
tests(small_testcase141, validity, [~b v ~b, ~b v ~b v ~a v b, b v a v ~b v b, c v ~c v a v ~b, c v b], 2000, count(2)).
tests(small_testcase142, validity, [~c v ~b, ~c v c v ~b, a v c, b v ~a v b v ~b, c v ~b v c v a], 2000, count(4)).
tests(small_testcase143, validity, [~c v ~b, ~a, a, c v ~c, c v c], 2000, count(0)).
tests(small_testcase144, validity, [~b v ~c, ~a v ~c v b v a, ~a v a v ~c, a v a, b v a], 2000, count(3)).
tests(small_testcase145, validity, [~b, ~a v ~c v c v ~c, b, c, c v ~a v ~b], 2000, count(0)).
tests(small_testcase146, validity, [~c v ~b v ~a, ~b v ~a v a, ~a v ~c v a, a, b], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase147, validity, [~c v ~c, ~b v ~a, ~a v ~a v b v ~c, a v ~c v ~a v ~c, b v b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase148, validity, [~c, ~c v ~a v b, ~b v a v c v b, ~b v b v ~a, b v a v ~b v ~b], 2000, count(4)).
tests(small_testcase149, validity, [~c v b v ~c v ~a, ~b v ~c, ~b v a v c, ~b v c v ~c v ~b, ~a v b], 2000, count(3)).
tests(small_testcase150, validity, [a, a v ~c v ~c v ~b, b v ~c v a v b, c], 2000, count(2)).
tests(small_testcase151, validity, [~c v a v b, ~a v b, a v b, b v ~a v c, b v b v ~b], 2000, count(4)).
tests(small_testcase152, validity, [~c, a v a v b, b, b v ~b, c], 2000, count(0)).
tests(small_testcase153, validity, [~c, b, b v a v a v ~c, b v c v ~c], 2000, count(2)).
tests(small_testcase154, validity, [~b v a v ~b v ~a, ~a v ~c v ~a v ~a, ~a v ~a v b, a v b v ~b v a, b], 2000, count(3)).
tests(small_testcase155, validity, [~a, a v ~b v ~a v b, b v c v c, c, c v b v b], 2000, count(2)).
tests(small_testcase156, validity, [~b v ~c v b v ~a, ~b v ~b v a v ~c, ~a v ~c v a v a, b v ~a, c], 2000, count(2)).
tests(small_testcase157, validity, [~c v ~a v ~b, ~a, ~a v ~c, a, c v ~a], 2000, count(0)).
tests(small_testcase158, validity, [~c v ~b v a v c, ~c v b v b v ~c, a, a v ~c v ~c v ~c], 2000, count(3)).
tests(small_testcase159, validity, [~c, ~c v ~c v a, ~c v ~c v a v ~a, ~b], 2000, count(2)).
tests(small_testcase160, validity, [~c v b v ~c, ~b, ~b v ~c, ~a v c v ~a v a, a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase161, validity, [~b, b v ~a v c, b v a, b v b v b, b v b v c], 2000, count(0)).
tests(small_testcase162, validity, [~c v ~c v ~b v b, ~c v a v b, ~b, ~a v b v b, c], 2000, count(0)).
tests(small_testcase163, validity, [~a v ~b v c v a, ~a v a v ~c, a, b, c v b v ~a v a], 2000, count(2)).
tests(small_testcase164, validity, [~c, ~b, a, a v b, b], 2000, count(0)).
tests(small_testcase165, validity, [~c v ~c v ~c, ~b v a v a, ~b v b, ~a v b, a], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase166, validity, [~c v a v c v b, ~c v b v ~a, ~b, b v a v ~a, c v a v ~c v b], 2000, count(3)).
tests(small_testcase167, validity, [~c v ~b v ~a v c, ~c v b, a v b v c, c, c v ~b v c v ~b], 2000, count(2)).
tests(small_testcase168, validity, [~b, ~b v ~b v ~c v ~a, ~b v ~a, a v ~b v c v ~c, b v c], 2000, count(2)).
tests(small_testcase169, validity, [a v ~b v c, a v c v a, b v ~a, b v ~a v c v ~b, c v ~a], 2000, count(3)).
tests(small_testcase170, validity, [~c, ~b, ~b v ~c v ~b v ~c, ~b v ~b, ~b v ~b v ~b], 2000, solution([(b, f) ,(c, f)])).
tests(small_testcase171, validity, [~c v b v ~a v b, ~a v ~c v a, ~a v b v a v c, b v ~a v b, b v c], 2000, count(5)).
tests(small_testcase172, validity, [~b v ~a v c, a v c v ~b v b, b, b v ~c v ~c, b v ~b v ~c v b], 2000, count(3)).
tests(small_testcase173, validity, [~b, a v c, b, c v ~b v ~b v ~b], 2000, count(0)).
tests(small_testcase174, validity, [~b v a, ~a, b, b v b v ~c v ~b, c v b v ~c v b], 2000, count(0)).
tests(small_testcase175, validity, [~c v ~b v b, a v ~a v c v a, a v a v ~a, c v a v c, c v c], 2000, count(4)).
tests(small_testcase176, validity, [~b v b, ~b v c v ~c, ~a, a v a v ~a v b, b v ~c v c v ~a], 2000, count(4)).
tests(small_testcase177, validity, [~c v ~c v c v ~c, ~b, ~b v c v b v ~c, ~a v ~a, b v ~c], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase178, validity, [~c v ~c, ~a v ~b v c v ~b, ~a v a v a v b, a, c v ~a v ~b], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase179, validity, [~c v ~c, ~b v ~c v b v b, ~b v b v ~a v ~c, a, b v ~a v ~a], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase180, validity, [~c v a v ~a, ~b v ~b v b, a, b v b v c v ~b, c], 2000, count(2)).
tests(small_testcase181, validity, [~c v a, ~b v c v ~b, ~a v ~c v ~b v a, ~a v b v ~a v ~b, a v c v ~c], 2000, count(4)).
tests(small_testcase182, validity, [~b, ~b v b v ~a v ~c, ~b v c, a v ~c v ~a v ~a, b v b v ~c v c], 2000, count(4)).
tests(small_testcase183, validity, [~c v a v b, ~b v ~a, ~b v b, ~a v c v ~a v ~b, a], 2000, count(2)).
tests(small_testcase184, validity, [~c v c v c v ~c, ~b v c v ~b, ~a v ~a v b v c, a, b v b v b v c], 2000, count(2)).
tests(small_testcase185, validity, [~c v c, ~b, ~a v ~a, a v b, b], 2000, count(0)).
tests(small_testcase186, validity, [~c v ~c v ~a v ~a, ~b v b, a, b v ~a v a v c, c v b], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase187, validity, [~b v ~b, ~a v ~c, ~a v ~a v ~c v a, b, c], 2000, count(0)).
tests(small_testcase188, validity, [~b v ~c v ~b v a, ~b v a, ~a, b v a v ~a, c v c v b v ~b], 2000, count(2)).
tests(small_testcase189, validity, [~c, ~b, a, a v c v ~c, c v ~b], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase190, validity, [~c v a v ~a v a, ~c v b v ~c, ~a, a v ~c v a], 2000, count(2)).
tests(small_testcase191, validity, [~c v b v b v ~c, ~a v ~b v a, c, c v ~c v ~a v a, c v ~a], 2000, count(2)).
tests(small_testcase192, validity, [~a v c, b v a v b v ~b, b v b v b, c v ~c v c, c v ~b v ~c v ~b], 2000, count(3)).
tests(small_testcase193, validity, [~c v b v ~a, ~c v c v c v ~a, ~b v c v c, c v ~b, c v c v ~c], 2000, count(5)).
tests(small_testcase194, validity, [~c v a v c v b, ~b, a, a v a, a v c v ~b], 2000, count(2)).
tests(small_testcase195, validity, [~c v a v b v a, ~b v a v ~c, ~a v ~b v ~b, ~a v ~a v a v ~a, a v ~b v ~b], 2000, count(3)).
tests(small_testcase196, validity, [~a v ~b v b, a, a v ~c, c, c v ~b], 2000, count(2)).
tests(small_testcase197, validity, [~c v ~b, ~c v c v ~a, b, b v ~c, c v c], 2000, count(0)).
tests(small_testcase198, validity, [~c, ~c v ~c v a v c, ~c v c v b v ~b, b v a v ~b], 2000, count(4)).
tests(small_testcase199, validity, [~a, ~a v ~c, ~a v a v ~c v ~a, a v ~c, c v ~b v b], 2000, count(2)).
tests(small_testcase200, validity, [~c v a v c v ~b, ~b v ~b, a, a v ~a, c], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase201, validity, [~c v ~b, ~c v ~a v c, ~c v c v ~c, c, c v ~b v ~c v ~a], 2000, count(2)).
tests(small_testcase202, validity, [~b v ~b v b, a, a v b, a v c v b, c], 2000, count(2)).
tests(small_testcase203, validity, [~c, ~a v b v ~a, a, a v b v ~a v ~a, b v ~a], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase204, validity, [~c v c v ~b, ~a v ~b v ~a, a, c, c v ~b v b], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase205, validity, [~a v ~b v ~a, a v a, b v ~c v b v ~a, b v a, b v c], 2000, count(0)).
tests(small_testcase206, validity, [~c v ~a v ~a, ~b, b v a v c, b v c, c v c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase207, validity, [~b, ~a v ~b, b v ~c v b v b, b v a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase208, validity, [~c v b v b, ~b v ~b v ~b, ~b v b v ~b, b, b v a], 2000, count(0)).
tests(small_testcase209, validity, [~a, a v ~b, b, b v ~c v ~a v a, c v ~c v a v ~b], 2000, count(0)).
tests(small_testcase210, validity, [~b v ~c v c v ~b, a v ~c v c, b v a, c v ~c, c v ~c v b v a], 2000, count(6)).
tests(small_testcase211, validity, [~c v ~b, ~b v a v a v b, ~b v c v ~b v a, ~a v b v a, c v a v a v ~a], 2000, count(5)).
tests(small_testcase212, validity, [~a, a v b v ~a, b v a v a, b v b, c v ~c v ~c v b], 2000, count(2)).
tests(small_testcase213, validity, [~c v ~c, ~a v a v ~a v c, a, b, c], 2000, count(0)).
tests(small_testcase214, validity, [~c v ~c v b v ~b, ~b v a, ~a v ~b, a v ~b, b], 2000, count(0)).
tests(small_testcase215, validity, [~c, ~a v ~a v b v b, a, b v ~b, c v ~b v b v ~b], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase216, validity, [~b, a v b v a, b, c v ~a, c v c v c v ~a], 2000, count(0)).
tests(small_testcase217, validity, [~b, ~b v ~c v ~b, ~a v ~c, a v b v ~c, b v b v b], 2000, count(0)).
tests(small_testcase218, validity, [~c v a v a v ~c, ~c v c v ~a, ~b v b v c v c, ~a v ~b v ~b, b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase219, validity, [~a, a, a v b v ~c, b v a v a, c v ~a v ~c v ~b], 2000, count(0)).
tests(small_testcase220, validity, [~b, ~b v b v b v ~a, c, c v ~c v a v c, c v c v ~a], 2000, count(2)).
tests(small_testcase221, validity, [~c, a, b v ~b v a, b v b, c v c v b], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase222, validity, [~c v ~a v a v c, ~b v ~c, a v c v c, b], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase223, validity, [~b v c v c v ~c, ~a v a v ~b v ~b, ~a v c, a, b v a], 2000, count(2)).
tests(small_testcase224, validity, [~c v ~b v b, ~b v a v ~c, a, a v b v a v c], 2000, count(4)).
tests(small_testcase225, validity, [~c v b v ~b v a, ~b v b v ~b v ~a, ~a v ~a v ~c, a v ~c v b v b, c v ~a v ~a], 2000, count(3)).
tests(small_testcase226, validity, [~c v ~c v c v ~c, ~b v ~c v b, ~b v a v b v ~c, a v ~b, a v c v ~c], 2000, count(6)).
tests(small_testcase227, validity, [~c, ~b, ~b v c v b v ~b, b, c v ~a], 2000, count(0)).
tests(small_testcase228, validity, [~b v b v b, ~a v a v ~b v ~a, a, b, c v b v ~a], 2000, count(2)).
tests(small_testcase229, validity, [~b v ~a v c, ~b v c, ~a v a v ~a, a, a v c v c], 2000, count(3)).
tests(small_testcase230, validity, [~a v a v ~a, b v c v b v c, c v a, c v c v ~b, c v c v b v ~a], 2000, count(4)).
tests(small_testcase231, validity, [~c, ~c v a v ~b v c, ~b v ~c v ~b, b v ~c v a, c], 2000, count(0)).
tests(small_testcase232, validity, [~c v b, a, a v b v ~b, c v ~a v ~c], 2000, count(3)).
tests(small_testcase233, validity, [~c v a v a v c, ~b, ~b v ~c v ~c v ~b, a v ~c v ~c, a v a v ~b v c], 2000, count(3)).
tests(small_testcase234, validity, [~c v ~a v ~a v a, ~a, a v c v b, b v b, c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase235, validity, [~c v a v ~a, ~a, ~a v c, a v ~a, b v ~b v ~c v b], 2000, count(4)).
tests(small_testcase236, validity, [~b v ~c v a, ~b v ~b v ~b v c, ~a v a, ~a v c, c v b v ~a], 2000, count(4)).
tests(small_testcase237, validity, [~b v ~b v c, ~a v ~c v ~a, b v ~c, b v a v ~c v ~b, c v ~a v ~c], 2000, count(3)).
tests(small_testcase238, validity, [~b v ~a v ~a v ~b, ~b v b v ~b, ~b v b v ~a, ~a v c, b v a v c v c], 2000, count(4)).
tests(small_testcase239, validity, [~b, a v a, b v ~b v b v c, b v b, c v a v c v c], 2000, count(0)).
tests(small_testcase240, validity, [~c v c v c v ~b, ~b v b, ~b v c v b, b, c v ~c], 2000, count(2)).
tests(small_testcase241, validity, [~c v ~c, ~c v ~c v ~c v ~b, ~c v b, ~b v ~a, c], 2000, count(0)).
tests(small_testcase242, validity, [~c v c v c, ~a v ~a, a, b v ~a v ~c, c v ~b v ~c], 2000, count(0)).
tests(small_testcase243, validity, [~b v ~c v ~a, ~b v a, ~b v a v c, a v ~c, c v c v b], 2000, count(2)).
tests(small_testcase244, validity, [a v ~a v ~c v ~c, a v b v c, b, b v ~b v a v ~b, b v a v ~c], 2000, count(4)).
tests(small_testcase245, validity, [a, b, b v a v ~c v ~c, c v ~b v ~b], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase246, validity, [~c v ~b, a v c, b, c v ~c v ~b v ~a], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase247, validity, [~b v ~b v a v b, ~b v a v ~a v c, ~a v a v ~b v ~b, a v ~a v ~a, c v ~b], 2000, count(6)).
tests(small_testcase248, validity, [~b v a, ~b v b v ~a, ~a v ~a, c v ~a v ~b, c v ~a v a], 2000, count(2)).
tests(small_testcase249, validity, [~b v ~c v c v b, ~a v ~c, ~a v a v ~b, b v ~c v ~b, c v ~a v b], 2000, count(5)).
tests(small_testcase250, validity, [~c v a, ~b v ~c, b v ~b], 2000, count(5)).
tests(small_testcase251, validity, [~c v ~b v ~c, ~b v ~a v ~c, b, b v a v ~b, c], 2000, count(0)).
tests(small_testcase252, validity, [~b, ~b v a v ~b, ~b v a v ~b v a, ~a, a v b v c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase253, validity, [~c v c v b, ~b v ~c v c, a v ~c, a v ~a v ~c, c v ~c v c], 2000, count(6)).
tests(small_testcase254, validity, [~b v b, ~a v b v a, ~a v c v c, b v b v a v a], 2000, count(4)).
tests(small_testcase255, validity, [~c v ~b, ~c v ~a v a v ~a, ~c v c, ~a v b v ~b, c v ~c v ~b], 2000, count(6)).
tests(small_testcase256, validity, [~c v b, ~b, ~b v ~c v a, a v c v a, c v ~c v ~c], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase257, validity, [~c, ~c v c v ~a, ~b, a v a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase258, validity, [~b, ~b v ~c v a v ~a, ~b v ~b, ~a v ~b v c v ~b, b v b], 2000, count(0)).
tests(small_testcase259, validity, [~c v ~a v c v a, ~b v a, ~a, a v ~a, b v ~b v b v a], 2000, count(2)).
tests(small_testcase260, validity, [~c v b v a, ~b v a v b, c, c v b, c v b v ~a v b], 2000, count(3)).
tests(small_testcase261, validity, [~c, ~b v ~b v ~a v a, ~b v ~a v b v a, a v a v ~b v b, b v ~a], 2000, count(3)).
tests(small_testcase262, validity, [~c v ~c v b, ~c v ~a v ~c, ~a v b, b, c v ~a v b], 2000, count(3)).
tests(small_testcase263, validity, [~b v c v b, ~a, b, b v c v c v b], 2000, count(2)).
tests(small_testcase264, validity, [~c v b, ~a v ~a, a, a v a v ~b, b v ~c], 2000, count(0)).
tests(small_testcase265, validity, [~a v ~b, ~a v ~b v ~b v ~b, ~a v ~a, b v c, c v ~a], 2000, count(3)).
tests(small_testcase266, validity, [~c, ~b, ~b v b v ~a, ~b v c, ~a v c], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase267, validity, [~b v ~a v c, ~a v a, b, b v ~c v ~a, c v ~a], 2000, count(3)).
tests(small_testcase268, validity, [~b, ~b v c, ~a v ~a v ~c v ~a, a, b v ~b v b], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase269, validity, [~c v ~c v a v ~b, ~c v a v ~a, ~a v c, a, b v ~c v ~b], 2000, count(2)).
tests(small_testcase270, validity, [~c, ~b, ~a, a v ~a, b v a v ~c v ~c], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase271, validity, [~c, ~b v a, ~a, c v ~a, c v a v ~c], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase272, validity, [~c v a v b v b, a v a v ~c, b v ~b, c, c v c v ~b], 2000, count(2)).
tests(small_testcase273, validity, [~c v b v ~b, ~a v ~b v c, a, c, c v ~a v ~a v ~b], 2000, count(2)).
tests(small_testcase274, validity, [~c, ~b v ~b, a v ~c v a, b v a v c v b, c v b v ~c], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase275, validity, [~a v ~b, ~a v a, a v ~a, a v a v b, c v ~a v ~c], 2000, count(4)).
tests(small_testcase276, validity, [~c v ~b, ~c v c v a, ~b v ~c, c, c v ~c v b v ~c], 2000, count(2)).
tests(small_testcase277, validity, [a v b v ~b v a, b v ~a v ~b, c v ~c, c v ~c v c v c, c v c v b v ~a], 2000, count(7)).
tests(small_testcase278, validity, [~a, ~a v ~b, b, c v ~b, c v ~a], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase279, validity, [~c v ~c, ~b v a, ~a, a v a, c v c v ~b v a], 2000, count(0)).
tests(small_testcase280, validity, [~b v ~b v c, ~b v c v c, c, c v ~c, c v b v a], 2000, count(4)).
tests(small_testcase281, validity, [~c v ~c v b, ~c v ~a v ~c v ~a, ~b, a v ~a], 2000, count(2)).
tests(small_testcase282, validity, [~c v a v c v ~a, ~b v ~b v ~b, ~b v ~a v ~c, ~a v a, a v b v ~b], 2000, count(4)).
tests(small_testcase283, validity, [~b v ~c, ~a v ~c v c v a, a v ~a v b, b v c, c v b], 2000, count(4)).
tests(small_testcase284, validity, [~c, ~b, ~a, b v a v b], 2000, count(0)).
tests(small_testcase285, validity, [~b v c v ~c v a, ~a v b v ~b v b, a v b, b v c v ~c, c v b v b], 2000, count(5)).
tests(small_testcase286, validity, [~c v ~b v b v b, ~c v a v ~b v b, ~a v b v ~a v ~a, a, a v b v ~b v c], 2000, count(2)).
tests(small_testcase287, validity, [~b v ~a, ~a v b, a, a v ~a, b v ~b v ~a v c], 2000, count(0)).
tests(small_testcase288, validity, [~c v a, ~b v ~b v ~c v b, ~b v ~a, ~b v b v ~c, c v a v ~b], 2000, count(3)).
tests(small_testcase289, validity, [~c, ~a v ~b, b v c, b v c v ~c, c], 2000, count(0)).
tests(small_testcase290, validity, [~c v ~c v c v ~b, ~c v ~b v b, ~c v ~a, b v ~a v c v ~a, b v a v a], 2000, count(3)).
tests(small_testcase291, validity, [~c v ~c, ~a v ~a v ~a, ~a v c v a v b, a, c v ~c v ~b v c], 2000, count(0)).
tests(small_testcase292, validity, [~a v ~c v c, a, a v ~b, a v ~b v b v ~c, b v ~c], 2000, count(3)).
tests(small_testcase293, validity, [~c, ~c v a, ~b v ~a v b, c, c v b], 2000, count(0)).
tests(small_testcase294, validity, [~b v ~b v a, ~b v b, ~a v c v ~b v ~b, a v ~c v ~a v ~a, a v ~b v ~c v ~c], 2000, count(5)).
tests(small_testcase295, validity, [~c, ~b v ~a v ~b, ~b v ~a v c, b v ~a v ~b, c v ~b v c v ~b], 2000, count(2)).
tests(small_testcase296, validity, [~c v b, ~b v ~c v ~a v ~c, ~a v ~b v ~b v c, a v c v a v ~c, c v ~b v a], 2000, count(3)).
tests(small_testcase297, validity, [~c, ~a, ~a v ~b v c v ~c], 2000, count(2)).
tests(small_testcase298, validity, [~c v c v ~c v ~c, ~a, c v ~c, c v ~b v ~a, c v b v ~b v c], 2000, count(4)).
tests(small_testcase299, validity, [~c v ~b, ~a v c v ~b v ~a, ~a v c v ~a v b, a v c v a, c v b v c], 2000, count(2)).
tests(small_testcase300, validity, [~c v ~b v ~a v ~c, ~b v ~b, ~a v ~c, a, b v a v ~a v ~a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase301, validity, [~c v ~c, a, a v ~a v a, c], 2000, count(0)).
tests(small_testcase302, validity, [~c v ~a v c, b v ~b v c, b v b v c, c v ~c v a v b, c v ~a v ~a], 2000, count(5)).
tests(small_testcase303, validity, [~c v b v ~b, ~b, a v b v ~a v b, c, c v c v ~b], 2000, count(2)).
tests(small_testcase304, validity, [~c v ~b v a v a, ~a v c v ~c, a v b v ~c v a, b v ~a v a v a, c], 2000, count(2)).
tests(small_testcase305, validity, [~c v b, ~a v ~b, ~a v ~b v c v b, a, a v ~c v b v a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase306, validity, [~c, ~c v ~b, ~b v ~b v b v c, b, c], 2000, count(0)).
tests(small_testcase307, validity, [~a v ~b v ~b v ~c, a v b v a v b, c, c v c v a v b], 2000, count(2)).
tests(small_testcase308, validity, [~a v ~c, a v ~b v a, a v a v ~c v ~b, b v ~c v c v ~c, c v ~c], 2000, count(4)).
tests(small_testcase309, validity, [~c, ~a v c v b, a v ~b v ~a, a v a v b, c], 2000, count(0)).
tests(small_testcase310, validity, [~b v b v ~b v a, ~a v a, a v b v ~c, a v b v ~b, c], 2000, count(3)).
tests(small_testcase311, validity, [~c v ~a v c v b, a v a v b v ~c, a v b, a v c, b], 2000, count(3)).
tests(small_testcase312, validity, [~c v ~a v ~c v ~c, ~c v a v ~a, ~a v ~c v ~c v a, ~a v ~c v a, a v ~a v ~c v ~b], 2000, count(6)).
tests(small_testcase313, validity, [~c, ~b v b, ~a v a v a, b v b v ~a v a, c v ~c v c v b], 2000, count(4)).
tests(small_testcase314, validity, [~c v c, ~a v b v ~c, ~a v b v ~c v ~b, a v ~b, a v b], 2000, count(3)).
tests(small_testcase315, validity, [~b v ~c v b, ~b v a v c v ~a, ~a v a v ~a, ~a v b v c v c, c v ~c], 2000, count(7)).
tests(small_testcase316, validity, [~c v c, ~a v ~c, a, c, c v ~a v ~b v ~a], 2000, count(0)).
tests(small_testcase317, validity, [~b v c v b, a, b v b v ~b, c v b v b v ~c, c v c], 2000, count(2)).
tests(small_testcase318, validity, [~c v a v ~b v a, ~b v a v ~c v b, b v ~b v ~b, c, c v c v ~a], 2000, count(3)).
tests(small_testcase319, validity, [~b, ~a, a v b v b v ~c, b, b v ~a], 2000, count(0)).
tests(small_testcase320, validity, [~a v ~c v a v ~c, a v ~b, b v ~b, b v b v c v ~c, c v ~b v c v ~b], 2000, count(5)).
tests(small_testcase321, validity, [~c v ~a, ~b v c v a v ~a, ~a v a, ~a v a v a, c v c], 2000, count(2)).
tests(small_testcase322, validity, [~c v ~b v b v a, ~a, b v ~a v ~c, c v b], 2000, count(3)).
tests(small_testcase323, validity, [~c v b, ~c v c, a v ~b v ~b, c, c v a], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase324, validity, [~c, ~a v c v ~a v ~b, a v ~b v ~a, b v ~c, c v c], 2000, count(0)).
tests(small_testcase325, validity, [~a v ~c v a v a, ~a v b v ~b, a v c v a v ~a, b v ~c, c v a], 2000, count(4)).
tests(small_testcase326, validity, [~b v b, a v ~c, a v ~c v b v ~b, a v ~b v a v ~b, c], 2000, count(2)).
tests(small_testcase327, validity, [~c v ~a, ~b, ~b v a v b v ~a, ~a, c v ~c v ~c v c], 2000, count(2)).
tests(small_testcase328, validity, [~c v c v ~c v ~c, ~a v ~c, a v a v ~a, a v b v b, b v a v c], 2000, count(4)).
tests(small_testcase329, validity, [~c, a v c v c v ~b, b, b v ~a v b v ~b, c v b v ~a v c], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase330, validity, [~c v ~a, ~c v a v ~b v ~c, ~b v ~a, ~b v ~a v a, a v ~a v c], 2000, count(4)).
tests(small_testcase331, validity, [~c v ~c, ~b, ~b v ~c v ~a v c, ~a, c v ~b v b], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase332, validity, [~b v b, ~a v ~b v ~c, a v ~b v ~c, c, c v a v c], 2000, count(2)).
tests(small_testcase333, validity, [~c, ~b v ~b v ~b v ~c, ~a v a, a v ~a, c v a], 2000, count(2)).
tests(small_testcase334, validity, [~c v ~b v ~b, ~a, ~a v ~b v ~c v b, ~a v b, b v b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase335, validity, [~c v ~c v a, ~a v c, b, c v ~b, c v ~b v ~c], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase336, validity, [~c v b, a v a v b, c v a, c v b v ~c, c v c v b v ~a], 2000, count(3)).
tests(small_testcase337, validity, [~c, ~b v ~b v c, ~a, a v ~c v ~a v ~b, c v c v b v c], 2000, count(0)).
tests(small_testcase338, validity, [~a v c v ~b v ~c, a v ~c v ~c, a v ~b v c, b, c], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase339, validity, [~c v ~a v ~b, ~a v ~b, c, c v ~c v ~a, c v b v ~a], 2000, count(3)).
tests(small_testcase340, validity, [~b v c v b, ~a v ~c v c, ~a v ~b, c v ~a v ~b, c v ~a v ~b v b], 2000, count(6)).
tests(small_testcase341, validity, [~b v ~b v ~c, ~a v b v ~c v b, c v ~b v b, c v a v a, c v a v c], 2000, count(3)).
tests(small_testcase342, validity, [~c v ~b, ~b v ~b v a v ~c, ~a v b v ~a, a v ~c, a v ~a], 2000, count(3)).
tests(small_testcase343, validity, [~b, ~a, b v a v b, c v a v a, c v b v c], 2000, count(0)).
tests(small_testcase344, validity, [~c v a v b v a, ~b v ~c v ~a v ~a, ~a v ~a v a v b, a v ~b v a v ~b, b v c v b v ~b], 2000, count(4)).
tests(small_testcase345, validity, [~c v c v ~b v ~c, ~a v b v a v ~c, a v a v ~c v ~a, a v a v b, c v ~a v ~b], 2000, count(5)).
tests(small_testcase346, validity, [~c v b v b v ~a, ~a, ~a v a v a, a, c], 2000, count(0)).
tests(small_testcase347, validity, [~c, ~c v a, ~a v ~c v c v a, ~a v a, a v c], 2000, solution([(a, t) ,(c, f)])).
tests(small_testcase348, validity, [~c v c v ~c, ~b v a v ~c v ~c, ~b v a v ~a v ~c, a v ~c v ~c v b, c v a v ~a v a], 2000, count(6)).
tests(small_testcase349, validity, [~c v ~b v b, ~c v ~b v c v ~a, ~c v a, ~b v ~c v c v c, ~b v a v b v ~a], 2000, count(6)).
tests(small_testcase350, validity, [~b v a, a v a, a v c, b v b v c, c v ~a], 2000, count(2)).
tests(small_testcase351, validity, [~c v ~c v ~a v b, ~b v b, ~b v c v ~a, ~a v b v b, ~a v c v a], 2000, count(5)).
tests(small_testcase352, validity, [~b, ~b v a, ~b v a v c v b, ~a v c, a v c], 2000, count(2)).
tests(small_testcase353, validity, [~c v ~b v ~c, ~a, a v ~b, a v c v c, b v ~a v c v c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase354, validity, [~b v ~c v ~c, ~b v a v c v ~a, ~b v b v ~b, ~a v ~c, b v a], 2000, count(3)).
tests(small_testcase355, validity, [b v c v ~c, c, c v a v b v a], 2000, count(4)).
tests(small_testcase356, validity, [~a, b, b v a, c, c v ~a], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase357, validity, [~c v b v ~a v a, ~b v ~b v b v ~c, ~a v b v ~a v ~a, a v c v ~a v b, c], 2000, count(3)).
tests(small_testcase358, validity, [~b v a v ~b v a, a v ~c, a v a, b, b v c v ~b], 2000, count(2)).
tests(small_testcase359, validity, [~c v ~a v ~a, ~b v ~b v b v a, ~a v ~b, c], 2000, count(2)).
tests(small_testcase360, validity, [~c, ~c v a, ~a, a v ~c, b v ~b v ~b], 2000, count(2)).
tests(small_testcase361, validity, [~b v c v a, a v ~a, b, b v ~c v ~c v a, c], 2000, count(2)).
tests(small_testcase362, validity, [~c v c v ~b v ~c, ~b, ~b v ~c v ~c v ~c, ~b v ~c v ~b, a v a v a], 2000, count(2)).
tests(small_testcase363, validity, [~c v b v ~c v a, ~a v c, a v c, b, b v ~b v ~b], 2000, count(2)).
tests(small_testcase364, validity, [~c v a, ~b, ~b v ~b v ~b v b, ~b v ~b v a, ~b v b], 2000, count(3)).
tests(small_testcase365, validity, [~c v ~c v ~a, ~c v a v ~a, ~b, ~b v ~c v c v a, a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase366, validity, [a v b v b v c, c v ~c v ~c, c v ~c v ~a, c v b, c v c], 2000, count(4)).
tests(small_testcase367, validity, [~b v a v b v ~c, ~a v ~c v ~a v c, a v ~b v b v b, a v a v c, c], 2000, count(4)).
tests(small_testcase368, validity, [~c, ~b v c v ~a v c, a v ~a v ~a, a v a, b], 2000, count(0)).
tests(small_testcase369, validity, [~b v c v ~b v ~a, ~a v a v ~c v c, ~a v b v b v ~b, b v ~b, c v c], 2000, count(4)).
tests(small_testcase370, validity, [~b v ~b v ~b v a, ~b v c v ~b v ~b, ~a v a, c v ~c v c v a, c v ~a v ~b v b], 2000, count(5)).
tests(small_testcase371, validity, [~b v b, a v ~a, a v c v b v ~b, b v ~a v ~a], 2000, count(6)).
tests(small_testcase372, validity, [~c v ~b v c v ~c, ~a v a v ~b, ~a v a v a v ~b, a, b], 2000, count(2)).
tests(small_testcase373, validity, [~c v ~c v c v ~b, ~b v b v b v b, a v ~c, a v a v c v ~a, b v ~c v b v c], 2000, count(6)).
tests(small_testcase374, validity, [~c v ~c v ~b, ~c v a v c, ~b v ~c, ~a v a v a v c, a v a], 2000, count(3)).
tests(small_testcase375, validity, [~b v a v ~b, a v ~a, a v ~a v c v ~c, b v ~b v c v ~b, c v b v a v ~c], 2000, count(6)).
tests(small_testcase376, validity, [~b v ~c v a, ~a v c, a v ~c, a v b], 2000, count(3)).
tests(small_testcase377, validity, [~c v ~a v ~a v c, ~b, ~a v ~c, a v ~b v ~a v b, c v ~a v b], 2000, count(2)).
tests(small_testcase378, validity, [~b v ~a v b, ~a, ~a v ~b v c v a, c, c v ~c v c v b], 2000, count(2)).
tests(small_testcase379, validity, [~b v ~c v ~c, a v a v b v ~a, b, b v b v c, c], 2000, count(0)).
tests(small_testcase380, validity, [~b v ~b v a v ~b, ~a, a, c, c v ~b], 2000, count(0)).
tests(small_testcase381, validity, [~c, a v b v ~c, b v ~c v a, b v b v c v a, c v ~b v ~c v a], 2000, count(3)).
tests(small_testcase382, validity, [~c, ~c v ~b v b v b, ~c v c, ~a, b v ~b v b v a], 2000, count(2)).
tests(small_testcase383, validity, [~b v ~b v ~a v ~c, a, a v ~a, a v b], 2000, count(3)).
tests(small_testcase384, validity, [~a v ~b v ~b, a v b v ~b, b v ~b v ~a v ~a, b v b v c, c v ~b], 2000, count(3)).
tests(small_testcase385, validity, [~c v ~c, ~c v b v a v ~c, ~b, b, b v c v ~c v b], 2000, count(0)).
tests(small_testcase386, validity, [~b v ~a v ~b, ~a v ~b v ~c, ~a v a, a v c v ~c v a, c v ~c v a v b], 2000, count(6)).
tests(small_testcase387, validity, [~c, ~b v ~a, ~a v ~b v a, a v ~c v b, c], 2000, count(0)).
tests(small_testcase388, validity, [~c v b v b, ~b v ~b v c v ~b, ~a v ~a, a, a v c v b], 2000, count(0)).
tests(small_testcase389, validity, [~c v ~c v ~b v a, ~c v b v a, ~b, a, b v ~b v ~b], 2000, count(2)).
tests(small_testcase390, validity, [~c, ~c v ~b, ~c v a v c v ~a, ~a v ~b v ~b v b, c v a v ~c], 2000, count(4)).
tests(small_testcase391, validity, [~c v b, ~b, ~a, a v b v c v ~b, c v b v ~c], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase392, validity, [~b v ~a, ~b v ~a v ~a v ~a, ~a v a, a, b v ~a v a v a], 2000, solution([(a, t) ,(b, f)])).
tests(small_testcase393, validity, [~b v a v b, ~b v b v b v b, ~a, ~a v b, b], 2000, solution([(a, f) ,(b, t)])).
tests(small_testcase394, validity, [~c v ~c v ~a, ~a, ~a v c, b, b v ~a], 2000, count(2)).
tests(small_testcase395, validity, [~b v ~a v ~c, a v a v a, a v b v ~a v ~a, a v c v a, c], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase396, validity, [~a v ~c, c, c v ~c v ~a, c v b v c, c v c], 2000, count(2)).
tests(small_testcase397, validity, [~b v b, ~a v c v ~b v b, a v ~c v c, a v a, b v ~a v a v ~c], 2000, count(4)).
tests(small_testcase398, validity, [~b v b v c, ~b v c v ~a, ~a v c v ~c v ~b, a, b v ~b v ~c v b], 2000, count(3)).
tests(small_testcase399, validity, [~c v ~b v ~c, ~c v b v a v c, ~b v a v ~a, c v a v ~c, c v b v b v ~c], 2000, count(6)).
tests(small_testcase400, validity, [~c v a v a v ~b, ~b v ~b, a v ~c v ~a, b v ~a, c v c v ~b], 2000, count(2)).
tests(small_testcase401, validity, [a, b v c, b v c v ~c, c, c v a v a], 2000, count(2)).
tests(small_testcase402, validity, [~c v ~c v c, ~c v c v c, ~a v ~c v ~c v ~a, a v ~c v ~c, b v ~c], 2000, count(4)).
tests(small_testcase403, validity, [~c v c v c v ~c, ~b, ~a, a v b, c v ~a v a v c], 2000, count(0)).
tests(small_testcase404, validity, [~c v ~b, ~a, ~a v b v c v c, a v a v c, b], 2000, count(0)).
tests(small_testcase405, validity, [~b v ~c v ~a v ~a, ~a v b, ~a v b v c, b v ~c v b v b, c v b], 2000, count(3)).
tests(small_testcase406, validity, [~c v ~a v c, ~b v b v ~c v c, a v ~a, a v b, c v ~a v ~a], 2000, count(4)).
tests(small_testcase407, validity, [~c v b, ~b v b v ~c v a, a v ~b, a v ~a v ~b, b v ~c v b], 2000, count(4)).
tests(small_testcase408, validity, [~c v a v ~c, ~a v ~c v ~a v c, a, a v ~c, a v c v b], 2000, count(4)).
tests(small_testcase409, validity, [~c v ~c v ~b v c, ~b v ~c, ~b v a v ~b, b v ~a, c v a], 2000, count(2)).
tests(small_testcase410, validity, [~c v a v ~a, ~b, ~b v c v c v ~a, a v ~b v c, a v ~a], 2000, count(4)).
tests(small_testcase411, validity, [~c, ~c v b v a v ~c, ~c v c v ~b v ~a, ~a v a v b, b v b v ~b v ~a], 2000, count(4)).
tests(small_testcase412, validity, [~c, ~a v ~c, b v ~c, b v c, c v a v ~a v a], 2000, count(2)).
tests(small_testcase413, validity, [~c v ~a, ~a v a v ~b v ~a, b v b, b v c v a v a, c v b v ~a], 2000, count(3)).
tests(small_testcase414, validity, [~c v ~a, ~b v ~a v a v b, a v b, c, c v b v c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase415, validity, [~c v ~c v b, ~c v ~a v c, ~b v a, a v ~a v c v b, c v b v ~a v ~c], 2000, count(4)).
tests(small_testcase416, validity, [~c v c v b, ~b v c v ~a v ~a, ~a v ~a v a, a v ~b v b v ~c, b], 2000, count(3)).
tests(small_testcase417, validity, [a, a v ~b v c v ~a, a v a v a v ~c, c, c v ~c v ~b v ~a], 2000, count(2)).
tests(small_testcase418, validity, [~b v ~b v a, ~a, ~a v a v ~c, b, c v ~b v ~a v c], 2000, count(0)).
tests(small_testcase419, validity, [~c v a v a v a, ~a v a, a v a, c, c v c v c], 2000, solution([(a, t) ,(c, t)])).
tests(small_testcase420, validity, [~a v a v ~b, ~a v b, a v b v ~b, c v ~c v c, c v ~c v c v b], 2000, count(6)).
tests(small_testcase421, validity, [~a v a v ~c v b, b v ~b, b v b v ~a v ~a, c], 2000, count(3)).
tests(small_testcase422, validity, [~b, ~a v c, b v ~c v ~a, b v a, c v ~c], 2000, count(0)).
tests(small_testcase423, validity, [~c v ~a v ~c, ~b v ~c v ~a v a, a, b, c v a v ~a], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase424, validity, [~b, ~a v ~c v ~b, ~a v ~b, ~a v ~b v ~c v ~a, a], 2000, count(2)).
tests(small_testcase425, validity, [~c v c, ~b v ~a v c v ~c, ~b v a, ~a v b, c v ~a v b v ~a], 2000, count(4)).
tests(small_testcase426, validity, [~b, ~a, a, c, c v ~c], 2000, count(0)).
tests(small_testcase427, validity, [~c v ~a v ~a, ~b, ~a v ~c v a v ~c, a v ~a v ~b v ~a, c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase428, validity, [~b v ~a v b, ~a v ~b v ~c, ~a v ~b v b v ~b, b v a, c v ~c], 2000, count(5)).
tests(small_testcase429, validity, [~a v ~c v ~b v b, ~a v ~a, a v ~a v a v a, b], 2000, count(2)).
tests(small_testcase430, validity, [~b, ~a v ~c v a, ~a v ~b v ~a v b, ~a v ~b v c v ~a, ~a v ~a v ~b], 2000, count(4)).
tests(small_testcase431, validity, [~b v ~b v b, ~b v a v ~c, a, a v ~b v c v b, b v ~b v c], 2000, count(4)).
tests(small_testcase432, validity, [~b, ~a v b, a v a v ~c, a v b, b v a v ~c], 2000, count(0)).
tests(small_testcase433, validity, [a v ~a v b v ~c, a v b v c, b, b v ~a v b, c v c], 2000, count(2)).
tests(small_testcase434, validity, [~a v ~b, a v ~b v a, c v ~b v b, c v b v a v a, c v c v b v ~c], 2000, count(3)).
tests(small_testcase435, validity, [~c, ~a, a, b v c], 2000, count(0)).
tests(small_testcase436, validity, [~c v ~a v ~c v c, ~b v ~a v ~b, ~a v ~b v a v ~c, b v c v b v ~c, c], 2000, count(3)).
tests(small_testcase437, validity, [~c v b v ~a v ~b, ~a v a v c, a v b v b, b v ~b v c, c v ~c v ~c v a], 2000, count(6)).
tests(small_testcase438, validity, [~c v ~c v b, ~b v b v ~a, ~b v c v c, ~b v c v c v ~c, a v ~a], 2000, count(4)).
tests(small_testcase439, validity, [~c v a v ~b, ~b, a v c v b v a, b, c v ~a], 2000, count(0)).
tests(small_testcase440, validity, [~c, ~b, ~a v ~c, b, b v ~b v b], 2000, count(0)).
tests(small_testcase441, validity, [~b v a, ~b v b v c v ~a, ~a, a v ~c, a v c v ~b], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase442, validity, [~c, ~c v b, ~b v c, a v c v ~b v c, b v ~c v ~c v c], 2000, count(2)).
tests(small_testcase443, validity, [~a v ~c v c v b, b v ~c, b v ~b v ~b, b v ~a v ~a v ~a, b v ~a v a v c], 2000, count(5)).
tests(small_testcase444, validity, [~b v ~c v c, ~b v c v ~a, ~a v ~c, b v ~a v ~b, b v ~a v ~a], 2000, count(4)).
tests(small_testcase445, validity, [~c v c, ~b v ~c v b, ~b v a, b v a v b v a, c], 2000, count(2)).
tests(small_testcase446, validity, [~b v ~a v ~c v ~b, ~b v c v a, a, a v ~a, b v ~c], 2000, count(2)).
tests(small_testcase447, validity, [~c v ~c, ~a v ~c, a v a v ~c, c, c v ~c], 2000, count(0)).
tests(small_testcase448, validity, [~b, ~b v ~a v ~a v ~c, ~b v b, a v ~c v b v c, b v ~b v ~c], 2000, count(4)).
tests(small_testcase449, validity, [~b v ~c, ~a v b, a, b, b v ~c v c v ~c], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase450, validity, [~c v a, ~b v ~b, ~b v ~a v ~a, ~b v b v ~b v ~c, a v ~b v ~b v ~a], 2000, count(3)).
tests(small_testcase451, validity, [~b v b v c v c, ~a v a, ~a v b, a v ~c v c v b, a v a], 2000, count(2)).
tests(small_testcase452, validity, [~a v ~a, ~a v b v c, b v ~b, c, c v ~b], 2000, count(2)).
tests(small_testcase453, validity, [a v ~c v a v b, a v a v b, b v ~c v a v b, b v b v ~b v ~a, c v ~c v c v c], 2000, count(6)).
tests(small_testcase454, validity, [~c v c v c v ~a, ~a v b v a, ~a v c, b v ~c, b v ~a v c], 2000, count(4)).
tests(small_testcase455, validity, [~c, ~c v b, ~b v ~c v ~b v ~c, ~a v ~a v ~c, a], 2000, count(2)).
tests(small_testcase456, validity, [~b v b, ~a v ~a, a, a v ~c v ~c, b], 2000, count(0)).
tests(small_testcase457, validity, [~a v ~a, ~a v c v ~c, b, b v ~c, c v ~b v b], 2000, count(2)).
tests(small_testcase458, validity, [~b, ~a, a v ~a v c, c, c v c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase459, validity, [~b, ~a v ~b, a, c], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase460, validity, [~b v c v a, ~a, ~a v a v ~a v ~a], 2000, count(3)).
tests(small_testcase461, validity, [~b, ~b v ~a v ~b v a, b v b, b v c v a, c v c v ~a], 2000, count(0)).
tests(small_testcase462, validity, [~c, ~c v ~a, ~a v a v ~a v a, ~a v b v b v b, c v c], 2000, count(0)).
tests(small_testcase463, validity, [~b v b v ~b v ~b, ~b v c, a, b v ~c v a, c v ~c v ~b v b], 2000, count(3)).
tests(small_testcase464, validity, [~c v ~c v ~b, ~c v ~b v a, ~b, ~a v c, c v c v c v b], 2000, count(2)).
tests(small_testcase465, validity, [~b v b v ~c, ~a v b, b, b v ~b, c v b v c v ~a], 2000, count(4)).
tests(small_testcase466, validity, [~c, a, b, c, c v c v b v ~a], 2000, count(0)).
tests(small_testcase467, validity, [~c v ~b v a, ~b, ~b v b, ~b v b v ~c, ~a v ~a], 2000, count(2)).
tests(small_testcase468, validity, [~c, ~b v ~c v a v ~c, ~a, ~a v b v ~a, a v ~a], 2000, count(2)).
tests(small_testcase469, validity, [~c v ~b, ~c v c, b, c v ~b v c v ~a], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase470, validity, [~c v a v c v ~c, ~b v c v c v c, a v a, b v ~c v c, c v ~b v b], 2000, count(3)).
tests(small_testcase471, validity, [a, a v ~c, b v a v ~c, b v b, c], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase472, validity, [a v ~a v c v b, b, c v ~b v ~c v a, c v ~b v b v b, c v ~a], 2000, count(3)).
tests(small_testcase473, validity, [~b v ~c v c v c, ~b v c, ~a v ~b, a, b], 2000, count(0)).
tests(small_testcase474, validity, [~c v c, ~a v ~b v a v ~a, a v ~c v ~a, b v a v a, b v b], 2000, count(4)).
tests(small_testcase475, validity, [~c, ~a, a, a v c v b v ~b, c v c v a], 2000, count(0)).
tests(small_testcase476, validity, [~c, ~b, ~b v c, ~a v ~a v ~b], 2000, count(2)).
tests(small_testcase477, validity, [~c v ~c v ~a v ~a, ~a v ~b v b v c, b, c, c v ~c v a v ~b], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase478, validity, [~c v b, ~b, ~a v ~c v b v b, b v b, c], 2000, count(0)).
tests(small_testcase479, validity, [~b, ~a v ~a v b, b v b v b, c v ~b, c v c v ~a v ~b], 2000, count(0)).
tests(small_testcase480, validity, [~c v ~a v ~c v ~b, ~a v ~c, a v b, a v b v ~c, b v ~a v ~b v a], 2000, count(4)).
tests(small_testcase481, validity, [~b v ~b v ~b, ~b v ~a v c v c, ~a v a v ~a v ~c, b v c v ~c v a, c v ~b v a v b], 2000, count(4)).
tests(small_testcase482, validity, [~b, ~b v ~c, a v a, a v c v b, c v ~a v a v a], 2000, count(2)).
tests(small_testcase483, validity, [~c v ~a v ~c v ~c, ~b, ~b v ~b v b v ~a, ~a v ~b v b, b v ~a], 2000, count(2)).
tests(small_testcase484, validity, [~c v ~a, ~a, a, b v a v a, c v b v a v c], 2000, count(0)).
tests(small_testcase485, validity, [~c, ~b v c v b v a, ~a v ~c v ~c, ~a v a v c, a], 2000, count(2)).
tests(small_testcase486, validity, [~c v ~a, ~b v ~a, ~b v b, ~a v a, b v ~b v c], 2000, count(5)).
tests(small_testcase487, validity, [~c v ~a v ~c, ~a v ~b, a, b, c], 2000, count(0)).
tests(small_testcase488, validity, [~c v c v ~b, ~a, ~a v ~a v ~c, a v ~a v a, c], 2000, count(2)).
tests(small_testcase489, validity, [~a v ~c v ~b, ~a v a, ~a v c v ~a v ~a, b v b, c v a v ~b], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase490, validity, [~a v a, a v ~c v b, a v ~b, b v a v a v a, c v a v a v ~c], 2000, count(4)).
tests(small_testcase491, validity, [~b v ~a v c v c, a v ~a v ~a v ~c, b v ~c v c, c v ~c, c v ~a v ~a], 2000, count(6)).
tests(small_testcase492, validity, [~b v a, ~a, a v ~c, a v ~c v b, c v ~a v ~b], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase493, validity, [~a v b v ~b v c, b v a v ~b, b v a v a v ~b, c, c v ~c v a v ~b], 2000, count(4)).
tests(small_testcase494, validity, [~c, ~a, ~a v ~a v c v ~a, a v c, b v b], 2000, count(0)).
tests(small_testcase495, validity, [~c v ~a v ~b v ~b, a, b, c v ~c v c v ~b, c v ~b], 2000, count(0)).
tests(small_testcase496, validity, [~c, ~b v ~a v ~b v ~a, ~b v a v ~a v c, a, a v ~c v ~a v c], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase497, validity, [~b v ~c v ~c v ~c, ~a, a v ~b v a, b v ~c, c v c v ~b v ~a], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase498, validity, [~c v a v b v ~c, ~b, ~b v a, b v ~b v b v ~c, c v a], 2000, count(2)).
tests(small_testcase499, validity, [~b v b, a v c v ~c v ~a, b v ~c v ~c, c, c v ~b v ~a v ~a], 2000, count(2)).
tests(small_testcase500, validity, [a v b v ~a, b v c v a, c, c v ~a v ~b v a, c v c v ~c v c], 2000, count(4)).
tests(small_testcase501, validity, [~b v a, ~a v ~a v ~c v ~c, ~a v c, b, b v ~c], 2000, count(0)).
tests(small_testcase502, validity, [~b v c v a v a, ~a v ~b, ~a v c, a v a, b v a], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase503, validity, [~b v ~b, ~a v ~b v b, ~a v b v b, a, c v ~c v b], 2000, count(0)).
tests(small_testcase504, validity, [~c v ~b, ~a v ~a v c v ~b, b, c v a v ~a, c v b v c], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase505, validity, [~b v ~b v ~b, ~b v c v ~b v b, ~a v ~c v ~b, ~a v ~b v ~c v c, a v ~c v ~c], 2000, count(3)).
tests(small_testcase506, validity, [~c, ~c v ~c v ~c v ~b, ~c v ~a v a, ~b v ~a v b, c], 2000, count(0)).
tests(small_testcase507, validity, [~c v ~c v a v ~b, ~a, ~a v c v ~b v ~c, a, a v b v a v ~a], 2000, count(0)).
tests(small_testcase508, validity, [~b v b v a, ~a, ~a v b v ~b v a, a v ~b, c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase509, validity, [~b v c v b, ~a, a v ~c v ~a v ~b, b v ~c v a v c, c v ~c v ~c v c], 2000, count(4)).
tests(small_testcase510, validity, [~b, ~b v ~c v b, ~a, b v ~b v a, c v ~b], 2000, count(2)).
tests(small_testcase511, validity, [~b v ~a v ~a, a v a v a, b v c v b, c, c v c v ~c], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase512, validity, [~b, ~b v c, b v ~c, c v b], 2000, count(0)).
tests(small_testcase513, validity, [~c v ~c, ~b, ~b v c, ~a, ~a v b], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase514, validity, [~b v b v ~a v b, ~a, ~a v a v ~b v ~a, b, c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase515, validity, [~c v ~b v c v b, ~c v a v ~c, ~c v a v b v ~c, a v a, c], 2000, count(2)).
tests(small_testcase516, validity, [~c v ~c, ~a v a v c v ~c, b, b v ~c v ~c, c v ~a v ~a v b], 2000, count(2)).
tests(small_testcase517, validity, [~c, ~c v ~a, a v ~b v b, b, c v ~c v ~c v b], 2000, count(2)).
tests(small_testcase518, validity, [~a, ~a v ~a, ~a v b v ~b, b v c, c v ~b v ~c v b], 2000, count(3)).
tests(small_testcase519, validity, [a v ~c v ~c v ~a, a v b v a v ~c, a v b v b v ~a, a v c v b, c], 2000, count(3)).
tests(small_testcase520, validity, [~c v c, ~b v c v ~b, c v ~c v ~b, c v ~a, c v a v c v ~c], 2000, count(5)).
tests(small_testcase521, validity, [a, a v a, a v c v ~c, b, c v a], 2000, count(2)).
tests(small_testcase522, validity, [~a, ~a v c v b, b, b v b], 2000, count(2)).
tests(small_testcase523, validity, [~c, ~c v ~a, ~b, ~a v ~a v b, b v a v a v a], 2000, count(0)).
tests(small_testcase524, validity, [~b, ~b v ~c v c v ~a, ~b v ~a, ~b v c v ~c, c v c v ~a], 2000, count(3)).
tests(small_testcase525, validity, [~b v ~a v a v b, ~a v b, b, c, c v ~c], 2000, count(2)).
tests(small_testcase526, validity, [~c, ~c v ~c v b, ~c v ~b, ~a v c, b v a], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase527, validity, [a v ~c v ~a, b v b v c v c, c, c v ~c, c v ~c v ~a v c], 2000, count(4)).
tests(small_testcase528, validity, [~b v ~c v ~a, ~b v ~c v c v a, b, c v a v ~b], 2000, count(2)).
tests(small_testcase529, validity, [~c v a, ~b v a v a, a v c v ~a v ~c, b, c v ~c v ~c], 2000, count(2)).
tests(small_testcase530, validity, [~c v ~b v b v b, ~a v a, b, b v a v a v ~c, c v a], 2000, count(3)).
tests(small_testcase531, validity, [~c v c, ~b, ~b v c v ~b v a, ~b v c v c v ~a, a v ~c], 2000, count(3)).
tests(small_testcase532, validity, [~c v ~c v ~b, ~a v ~b v ~b, ~a v c, c v ~b v ~c, c v ~a v a], 2000, count(4)).
tests(small_testcase533, validity, [~a v ~b, ~a v ~a v b, a v a v b, b v ~b, b v ~a], 2000, solution([(a, f) ,(b, t)])).
tests(small_testcase534, validity, [~b, ~b v ~c v ~c v c, ~b v c v b, ~a v ~a, a v a], 2000, count(0)).
tests(small_testcase535, validity, [~c v ~c, ~a, ~a v ~a, b v ~c v ~c v a, c], 2000, count(0)).
tests(small_testcase536, validity, [~a v ~b, a, b v b v ~c v c, c v a v b v a, c v b v c v ~c], 2000, count(2)).
tests(small_testcase537, validity, [~b, ~a v c, a, a v ~c v c, c v a v a v ~a], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase538, validity, [~b, a v ~c v ~b, c v ~b, c v ~b v c, c v b v b], 2000, count(2)).
tests(small_testcase539, validity, [~c v a, ~b v ~b, ~b v ~b v ~a v ~b, ~b v c, a v a v ~a v ~b], 2000, count(3)).
tests(small_testcase540, validity, [~c v ~c v ~b v c, ~c v ~c v c v ~b, ~a v ~c, ~a v a, a v a v ~b], 2000, count(4)).
tests(small_testcase541, validity, [~c v ~c v ~c v c, ~c v ~c v ~b v ~a, ~c v b v ~a v ~a, ~b, ~b v a v ~a], 2000, count(3)).
tests(small_testcase542, validity, [~b v ~c v ~c, ~b v ~b v ~c v a, ~b v b, ~a v ~c v ~a v ~b, ~a v ~b], 2000, count(5)).
tests(small_testcase543, validity, [~b v ~a, ~b v ~a v a v ~a, a v ~b, b, c v ~b v a v a], 2000, count(0)).
tests(small_testcase544, validity, [~a, ~a v b v a v c, a v ~b, a v ~b v ~c, c v c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase545, validity, [~c v ~a v b, ~c v a v ~c v c, ~a v a v c, ~a v b v ~b, a], 2000, count(3)).
tests(small_testcase546, validity, [~c, ~a v c v ~b v ~a, b v b v c, c v ~b v b v c, c v b v c v b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase547, validity, [~c v ~a, ~b v a v ~c, ~b v c v a v b, a v ~a v b, b v c], 2000, count(3)).
tests(small_testcase548, validity, [~c v b, c, c v ~c], 2000, solution([(b, t) ,(c, t)])).
tests(small_testcase549, validity, [~a v b v ~b, a v ~a v ~a, b v a v b v b, b v b v b v a, c v ~c v b], 2000, count(6)).
tests(small_testcase550, validity, [~c v b v a, ~b v ~b v b v c, ~a v c, a v a, b v a], 2000, count(2)).
tests(small_testcase551, validity, [~c v c, ~b v a v b, ~a v ~a v b, a, c v c v ~a v c], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase552, validity, [~b v ~c, a v ~c v a v ~c, a v ~b v ~a, c v ~a, c v a v ~a], 2000, count(3)).
tests(small_testcase553, validity, [~c v a v b, ~b v ~b, ~b v ~b v ~a, ~a v ~a, b], 2000, count(0)).
tests(small_testcase554, validity, [~c, ~a v ~c v ~b, a v b v ~a v ~c, b v c v c, c v b v ~b], 2000, count(2)).
tests(small_testcase555, validity, [~c v b v a v ~b, ~a v a, c v ~c v b, c v ~b, c v ~a v ~a], 2000, count(5)).
tests(small_testcase556, validity, [~c v a v ~b v ~a, ~c v a v b v c, ~a v ~c v ~a v ~b, a v ~c v ~a v a, c v b v ~a], 2000, count(6)).
tests(small_testcase557, validity, [~c v a v ~b v a, a v ~a v b, a v a, b, b v ~c v ~a], 2000, count(2)).
tests(small_testcase558, validity, [~b v ~c v ~c v b, ~b v c, ~a v ~c, c v ~c v a v c, c v c v a], 2000, count(3)).
tests(small_testcase559, validity, [~c, ~c v b v ~c v ~b, ~b, ~b v ~b v ~a, c v a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase560, validity, [~c v c, ~b, ~b v ~a v ~b v ~b, ~a v ~b v b v a, c v b], 2000, count(2)).
tests(small_testcase561, validity, [~a v b v ~b v ~a, a v b v c, b, b v ~b v ~c v c, c v ~a v a], 2000, count(4)).
tests(small_testcase562, validity, [~c v ~a v ~b v ~a, b, b v ~c, b v c v ~a v ~a, c v a], 2000, count(2)).
tests(small_testcase563, validity, [~c, ~a v ~a v ~c, ~a v b v ~a v c, b v ~b v a v ~b, c v ~a v ~c], 2000, count(3)).
tests(small_testcase564, validity, [~b v c v c v ~a, a, a v ~c v ~c v c, a v ~b v a v ~b, a v a v a], 2000, count(3)).
tests(small_testcase565, validity, [~c v b, ~a, a, b v c v a, c], 2000, count(0)).
tests(small_testcase566, validity, [~b v c, ~a v a v b v b, a v ~b v a, a v a v b, b v a v ~a], 2000, count(3)).
tests(small_testcase567, validity, [~c v b, ~b, ~a v ~c v b v ~b, b v c, c v ~b], 2000, count(0)).
tests(small_testcase568, validity, [~c, ~c v ~b v ~b v b, ~c v b v ~a, ~a v c v ~b v b, b v ~a v ~c], 2000, count(4)).
tests(small_testcase569, validity, [~c v ~c v b v a, ~c v ~c v c, ~c v a v ~c v ~b, ~b, c], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase570, validity, [~b v ~c v ~a v ~b, ~a, b, c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase571, validity, [~c v a v ~c, ~b v b, ~a v c v b v b, c v ~b, c v c v a v b], 2000, count(2)).
tests(small_testcase572, validity, [~c v ~c, ~a v ~b, ~a v c v c, b v ~b, b v ~a v ~c v ~b], 2000, count(2)).
tests(small_testcase573, validity, [~c, ~c v a v ~b, ~b v c v ~c, c v ~a v b v ~a, c v ~a v c], 2000, count(2)).
tests(small_testcase574, validity, [~c v ~b v b, ~c v ~b v b v c, ~b v b, a], 2000, count(4)).
tests(small_testcase575, validity, [~c v a v ~b, ~b v b, b, b v ~b, b v ~a v a], 2000, count(3)).
tests(small_testcase576, validity, [~c, ~c v ~c v ~b v a, ~a, ~a v b v ~b v ~b, b v ~b], 2000, count(2)).
tests(small_testcase577, validity, [~c v ~b v b, ~b, c, c v a], 2000, count(2)).
tests(small_testcase578, validity, [~c, ~a, a v c, b v a v ~a v ~b, c v ~a], 2000, count(0)).
tests(small_testcase579, validity, [~a v ~c v ~b v ~b, ~a v c v c, a, b, b v ~b], 2000, count(0)).
tests(small_testcase580, validity, [~b v ~c, ~b v a, ~a, a, c v b v a], 2000, count(0)).
tests(small_testcase581, validity, [~b v ~c, a v ~c v ~b, c, c v b v ~c v a, c v b v b], 2000, count(2)).
tests(small_testcase582, validity, [~a, ~a v a, a v ~b v c, b v ~b, b v ~a v ~a], 2000, count(3)).
tests(small_testcase583, validity, [a, a v c v a, b v ~a v c, b v a, b v a v c v ~a], 2000, count(3)).
tests(small_testcase584, validity, [~b v ~c v b, ~b v ~b, ~b v ~b v ~c, ~b v a, b v a v a v ~b], 2000, count(4)).
tests(small_testcase585, validity, [~a v ~c v a v c, ~a v a, a, b v ~a, c], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase586, validity, [~c v c v ~b, ~b, ~a v b, a v b, b v b v b v ~c], 2000, count(0)).
tests(small_testcase587, validity, [~c v ~b v a, ~a v ~a v ~a v c, ~a v c v b v a, a v ~b, b v ~a], 2000, count(3)).
tests(small_testcase588, validity, [~c v ~b v ~c v ~c, ~c v a v a, b v ~b v ~a v c, c, c v ~b], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase589, validity, [~c v ~b v c, ~b v ~b, a v a v b v b, a v b, c v b], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase590, validity, [~a v ~a v ~b, a v ~b v c v c, a v ~a v ~c v ~a, c v ~c, c v b], 2000, count(3)).
tests(small_testcase591, validity, [~c v ~a, ~c v b, ~b v ~a v b v ~c, ~a v ~b v ~a v b, c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase592, validity, [~c v c, ~a v b, a v a v ~b v b, b, c v ~b], 2000, count(2)).
tests(small_testcase593, validity, [~c, ~b v a v c, ~a v ~b, ~a v b v ~c v b, b v b], 2000, count(0)).
tests(small_testcase594, validity, [~b v ~c v b v ~a, ~b v ~c v c v c, ~a, ~a v ~c v ~c v b], 2000, count(4)).
tests(small_testcase595, validity, [~b v a v ~c, ~b v b, a v ~a v ~b, c v ~a v ~c v c, c v c v b v c], 2000, count(5)).
tests(small_testcase596, validity, [~a, a, b v a v ~b], 2000, count(0)).
tests(small_testcase597, validity, [~c v a v b v b, ~b, ~b v c, ~a v ~c v c, b v ~b v ~c], 2000, count(3)).
tests(small_testcase598, validity, [~b v ~c v ~b, ~b v ~a, a v ~b v a v ~c, a v c v c v c, b v b v c v ~c], 2000, count(3)).
tests(small_testcase599, validity, [~a v ~c v b, ~a v ~b v b, a, c, c v b v ~c], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase600, validity, [~b v a, a v ~c v ~a, a v ~a, b, c v ~b v a], 2000, count(2)).
tests(small_testcase601, validity, [~c v ~a v ~a, ~b v ~a v ~c, ~b v b, a v b, c v b v ~b], 2000, count(4)).
tests(small_testcase602, validity, [~c, ~c v ~b v b, ~b, ~b v a v ~c, c v a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase603, validity, [~c, ~b v ~c v ~c v a, ~a v c v ~a, a v b v ~c, b v ~a], 2000, count(2)).
tests(small_testcase604, validity, [a, a v ~b v b v ~a, a v a, c v ~c v b v ~a, c v ~a v ~b v a], 2000, count(4)).
tests(small_testcase605, validity, [~c v ~a v ~a, ~b v a v ~c, ~a v ~b v b, a v ~b v b, c v ~a], 2000, count(3)).
tests(small_testcase606, validity, [~c v a v c v ~c, ~b v ~b v a, b v ~b, c, c v b], 2000, count(3)).
tests(small_testcase607, validity, [~c v a v a v c, ~c v b v a v c, ~a v b v ~c, c v ~a, c v ~a v b], 2000, count(5)).
tests(small_testcase608, validity, [~c v a v c v b, ~b v b v ~a v ~c, ~a v a v ~c v c, b v c, b v c v c v ~c], 2000, count(6)).
tests(small_testcase609, validity, [~c v b v ~a, ~b v b v c, ~a v a, b, c v ~a], 2000, count(3)).
tests(small_testcase610, validity, [~c v ~a v ~a, ~b v ~a v ~c v ~c, ~a v b, a v ~c, b v ~b v c v a], 2000, count(3)).
tests(small_testcase611, validity, [~c, ~a v a v ~b v ~a, ~a v c v ~a v b, b, c v a], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase612, validity, [~c, ~b v c v c v ~c, ~a v ~c, a v ~b v ~c, b v b], 2000, count(2)).
tests(small_testcase613, validity, [~b, a v ~a v ~c, a v ~a v a v ~a, b, c], 2000, count(0)).
tests(small_testcase614, validity, [~c, ~b v ~c v c, a v ~b, c, c v b], 2000, count(0)).
tests(small_testcase615, validity, [~c v b v ~c, ~a v ~c v ~a v ~b, a, b, b v ~b v a], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase616, validity, [~c v c, a, b, b v c, c v ~a v ~a], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase617, validity, [~b v b v c v ~a, a, b v a, c v a v c v b, c v c v a], 2000, count(4)).
tests(small_testcase618, validity, [a v c, b, c, c v b], 2000, count(2)).
tests(small_testcase619, validity, [~c v ~c v ~a, ~c v b v ~b v ~c, ~b v ~b, ~a v ~b v a, a v ~b v ~c v ~c], 2000, count(3)).
tests(small_testcase620, validity, [~c v ~b, ~b v ~a v ~c, ~a, ~a v a v ~b v a, a], 2000, count(0)).
tests(small_testcase621, validity, [~c v ~b v ~c v ~b, ~b v b, ~a v ~a, c v ~c, c v a v a], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase622, validity, [~b v ~b v ~b, ~b v ~b v b, ~b v c, b v ~b v ~c, c], 2000, solution([(b, f) ,(c, t)])).
tests(small_testcase623, validity, [~b v a v b, ~a v ~b, b v b v b v c, c v a, c v a v a v ~c], 2000, count(3)).
tests(small_testcase624, validity, [~b, a v ~c, a v a, b v ~c v b v ~a, c v ~a], 2000, count(0)).
tests(small_testcase625, validity, [~c, ~a, a v a v ~a, a v c, c v ~a v b v c], 2000, count(0)).
tests(small_testcase626, validity, [~c v ~c, ~a v ~b, a, a v ~c v a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase627, validity, [~c, ~b, ~b v ~a v ~c v ~c, ~a, b v c v ~a], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase628, validity, [~b v ~a v ~a v ~c, ~a v ~a, a v ~c v a, c v ~c v a, c v ~a v b], 2000, count(2)).
tests(small_testcase629, validity, [~c v c v a, a v b, b v a v c v ~c, c v a v c, c v c v b], 2000, count(4)).
tests(small_testcase630, validity, [~c v ~c v a, ~c v c v ~c, ~a v a v ~a v ~c, a v ~c, a v ~a v c], 2000, count(3)).
tests(small_testcase631, validity, [~a, ~a v ~c v ~c, ~a v ~b v ~b v a, ~a v c v ~b v c, a], 2000, count(0)).
tests(small_testcase632, validity, [~b v b v ~a v c, ~a v ~b, ~a v ~b v ~b, a v a, b v ~b v c], 2000, count(2)).
tests(small_testcase633, validity, [~c v ~b v ~c v b, ~b, ~b v c v ~c v ~c, ~a v ~b v ~c, b v a v b v a], 2000, count(2)).
tests(small_testcase634, validity, [~c v ~c v a v a, a v a v ~c v c, b v c v ~a, c, c v ~b], 2000, count(2)).
tests(small_testcase635, validity, [~c, ~c v b v ~c, ~a v c v ~c v ~c, a v c v a v ~c, b v b v ~c v a], 2000, count(4)).
tests(small_testcase636, validity, [~b v c, ~a, ~a v ~a v a v ~a, ~a v b v b, a v ~a], 2000, count(3)).
tests(small_testcase637, validity, [~b, ~b v ~b v ~c v ~a, ~a v ~c, a v ~a v ~a, c v a v b v ~b], 2000, count(3)).
tests(small_testcase638, validity, [~b v ~a v ~c v b, ~a v b v b v a, c, c v ~b, c v ~a v b], 2000, count(4)).
tests(small_testcase639, validity, [~c, a, c, c v c v ~a], 2000, count(0)).
tests(small_testcase640, validity, [~b, ~b v ~a v ~c, a v ~b, a v ~b v ~a, c], 2000, count(2)).
tests(small_testcase641, validity, [~b v ~c, ~b v b v c v c, ~b v c v b v c, ~a v ~c v ~c, c v a v ~c v ~c], 2000, count(5)).
tests(small_testcase642, validity, [~c, ~b v ~b, ~b v b v ~b v ~c, ~a v b, c v ~b v b], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase643, validity, [~c v a v a v c, ~a v b v ~c v a, b v ~b, c], 2000, count(4)).
tests(small_testcase644, validity, [~c, ~c v a v a, ~b, a v c v ~b v a, b], 2000, count(0)).
tests(small_testcase645, validity, [~c, ~c v a v ~a, ~a v c v ~c v ~a, c, c v ~b v b], 2000, count(0)).
tests(small_testcase646, validity, [~b v a, ~a, b v a v ~c v c, c v ~c, c v c v b], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase647, validity, [~c v b, ~b, ~a v c v ~c v c, b v ~a v ~c, c], 2000, count(0)).
tests(small_testcase648, validity, [~c v ~a v a, a v c v ~b, b v ~c v a v b, b v b v ~b v c, b v c v ~a], 2000, count(5)).
tests(small_testcase649, validity, [~b, b, b v ~c, b v a v ~b v ~c, b v b v ~b v ~c], 2000, count(0)).
tests(small_testcase650, validity, [~b v b v b v ~c, ~a, ~a v ~a v ~b v a, ~a v b v c v ~c, c v c v ~c], 2000, count(4)).
tests(small_testcase651, validity, [~c v ~c v ~c, ~c v ~a v ~c v b, ~b, ~b v ~c, a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase652, validity, [~c v ~a v ~a, ~a v ~c, ~a v c v ~a v ~a, a v ~a v ~b, c], 2000, count(2)).
tests(small_testcase653, validity, [~c, ~c v b v ~c v c, a, b v a v ~c, c v a v ~b], 2000, count(2)).
tests(small_testcase654, validity, [~b v ~c, ~a, c v ~c v b], 2000, count(3)).
tests(small_testcase655, validity, [~c, a v ~c v a, b, b v a, c v ~c v a], 2000, count(2)).
tests(small_testcase656, validity, [~a v ~a v ~c, ~a v a v a, a v a, b, b v ~a], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase657, validity, [~c v b v c, ~a, ~a v ~c, c v ~c v b v ~c, c v ~a], 2000, count(4)).
tests(small_testcase658, validity, [~c, ~b v ~a v a, a v ~a v b, a v a, c], 2000, count(0)).
tests(small_testcase659, validity, [~c v c v ~a, ~a, ~a v ~c v c v ~a, ~a v ~b v b v ~b, c v ~c v b], 2000, count(4)).
tests(small_testcase660, validity, [~c v c v a v ~a, ~b v b, c, c v ~c v b, c v a v ~c v a], 2000, count(4)).
tests(small_testcase661, validity, [~c v ~c, ~c v ~b, ~c v b v ~c, b, c v ~a v ~a v ~c], 2000, count(2)).
tests(small_testcase662, validity, [~c v c, ~a v ~c v ~a v ~a, b v ~a, b v b, c v a v ~b], 2000, count(2)).
tests(small_testcase663, validity, [~a v ~c v ~c v c, ~a v c v ~a v ~c, a v a v b, b, b v a v ~a v a], 2000, count(4)).
tests(small_testcase664, validity, [~b v ~a v ~b v ~b, ~a, ~a v b v ~a v a, a], 2000, count(0)).
tests(small_testcase665, validity, [~b, ~b v a v b v ~b, ~a v a, b, c v ~a], 2000, count(0)).
tests(small_testcase666, validity, [~b v ~c v ~c v ~c, a v ~c, a v ~c v b v ~b, a v c v ~b v ~c, b], 2000, count(2)).
tests(small_testcase667, validity, [~c v ~c, ~c v a v ~c, ~b v a, ~a v b v a, b v c v ~a v b], 2000, count(2)).
tests(small_testcase668, validity, [~c, ~a v ~b v ~c v b, ~a v ~a, a, c v b v c], 2000, count(0)).
tests(small_testcase669, validity, [~a v ~a v a, ~a v c v ~b, b v c v ~b v c, c, c v ~c], 2000, count(4)).
tests(small_testcase670, validity, [~a v c v c, a, b v ~c, c v a, c v b], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase671, validity, [~b, ~a v b v c v c, a, a v b, c], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase672, validity, [~c, ~c v ~a v a, ~b v c, c v b v a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase673, validity, [b v a v ~a, b v b v ~a v a, b v c v a v b, c v ~a v ~b v a, c v c v ~a], 2000, count(5)).
tests(small_testcase674, validity, [~c, ~c v c, ~b, ~a v ~b v ~a, c v c v ~b v ~a], 2000, count(2)).
tests(small_testcase675, validity, [~c, ~c v ~c v ~b, ~b v ~a, ~b v b v a, a v b], 2000, count(2)).
tests(small_testcase676, validity, [~b, ~a v a v b, a, a v ~a, c v ~a v c], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase677, validity, [~a v ~a v c v c, ~a v a v ~c v ~c, a v a v c v ~a, b v b v b v ~b, c v ~b v ~a], 2000, count(6)).
tests(small_testcase678, validity, [~c v b v ~c v ~c, ~a v ~a, b v c v c v ~b, c v a, c v c v ~b v c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase679, validity, [~c, ~c v c, ~a v c v c, a v ~c v b, a v ~c v b v ~a], 2000, count(2)).
tests(small_testcase680, validity, [~a v a, a v ~a v ~a v ~b, a v b, b, c v b v ~c], 2000, count(4)).
tests(small_testcase681, validity, [~b, a, a v ~a v a v ~a, a v c v ~b v ~c], 2000, count(2)).
tests(small_testcase682, validity, [~c v ~a, a, a v b v ~c, b], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase683, validity, [~c v ~c v ~c, ~c v b v b v a, ~b v c, ~a v ~b v ~a, c v a v ~b], 2000, count(2)).
tests(small_testcase684, validity, [~a v ~c v ~a, a v ~b v ~a v ~c, b v ~c v a v a, b v a, c v a], 2000, count(3)).
tests(small_testcase685, validity, [~c, ~c v ~b v c, ~a, ~a v ~a v a v ~a, c v c v ~b v a], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase686, validity, [a, a v a, b, b v b v b], 2000, solution([(a, t) ,(b, t)])).
tests(small_testcase687, validity, [~c v ~c, ~b v b, a, b v ~c v b], 2000, count(2)).
tests(small_testcase688, validity, [~a v ~b, a v ~c v ~a, c v ~b, c v b, c v c], 2000, count(3)).
tests(small_testcase689, validity, [~b, ~a v ~b v a v c, b v a, c v ~c v ~b v ~a, c v ~c v c v c], 2000, count(2)).
tests(small_testcase690, validity, [~c, ~c v c, ~b, a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase691, validity, [~b, ~b v ~c, ~b v b v ~c v b, a v ~c v ~a v b, c v a], 2000, count(3)).
tests(small_testcase692, validity, [~c v ~a v ~b v c, ~a v ~c v ~b v ~c, b, b v a v ~c v b, c v ~c], 2000, count(3)).
tests(small_testcase693, validity, [~a v a v b, ~a v b v b v ~a, b v ~c v b v c, b v a v ~c, b v c v a], 2000, count(4)).
tests(small_testcase694, validity, [~c, ~c v a, ~a v ~a, a v ~b v c, c], 2000, count(0)).
tests(small_testcase695, validity, [~c v ~b v c, ~b v ~c v a v c, ~b v c, ~a v a v c, a v ~a v ~a], 2000, count(6)).
tests(small_testcase696, validity, [~c v ~c v c, ~c v ~a, ~a, ~a v ~c v a, ~a v ~b v c v ~b], 2000, count(4)).
tests(small_testcase697, validity, [~a, a v a, a v b, b v a v a, c v a v a v a], 2000, count(0)).
tests(small_testcase698, validity, [~c v ~b v b v a, ~b v c v ~c v a, ~a, b v ~a v ~b, c v b v a], 2000, count(3)).
tests(small_testcase699, validity, [~c v ~a v ~b v c, ~b, ~b v ~b, a, a v c v ~a v c], 2000, count(2)).
tests(small_testcase700, validity, [~c v ~b, ~b v ~b v ~b v a, a v ~a, b v ~c, c v b v ~a v ~b], 2000, count(3)).
tests(small_testcase701, validity, [~c v c v ~c v ~b, ~a, a v ~c v c, b v ~a v b v c, c v ~c], 2000, count(4)).
tests(small_testcase702, validity, [~c v b v a v a, ~b v ~a v c v ~a, ~a v ~b v ~b, c, c v a v b v ~a], 2000, count(2)).
tests(small_testcase703, validity, [~b v c v ~c v a, ~a, a v ~c v a v a, a v b v b, c v ~c], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase704, validity, [~c v b v ~c v ~c, ~a v ~a v ~b, a v ~c v c v ~b, b, b v a], 2000, count(2)).
tests(small_testcase705, validity, [~b v ~b, ~a, a v b v a v ~b, b, b v c], 2000, count(0)).
tests(small_testcase706, validity, [~c v ~c, ~c v b v ~c v ~b, ~a, ~a v b v ~a, b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase707, validity, [~c v ~b v a v ~b, ~c v a v ~b, ~a v b v a v b, a v ~c, c v a v ~a v b], 2000, count(6)).
tests(small_testcase708, validity, [~c, ~c v ~b v b v ~b, ~b v ~c v ~c v a, ~a, b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase709, validity, [~a v ~c, a v ~c v ~c v ~c, b v ~c v ~c, b v ~a, b v a v a v ~b], 2000, count(3)).
tests(small_testcase710, validity, [~a, a, a v ~c v ~a v b, b, b v c v ~c], 2000, count(0)).
tests(small_testcase711, validity, [~b, ~b v ~b, ~b v ~a v ~a, ~a v ~b v ~b v ~a, ~a v c], 2000, count(3)).
tests(small_testcase712, validity, [~c, ~b v a, b, c v b v ~a v c], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase713, validity, [~c, ~c v ~c v ~a v ~a, ~b v ~b, a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase714, validity, [~c, ~c v a, a v b, b v c, b v c v ~b v c], 2000, count(2)).
tests(small_testcase715, validity, [~c v ~a v ~c, b, c v ~b, c v a, c v c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase716, validity, [~c v ~b v ~c v a, ~b v ~c v c, ~a, c v a v a], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase717, validity, [~c v ~c v ~a, ~a, ~a v ~a, c, c v c v a v ~c], 2000, solution([(a, f) ,(c, t)])).
tests(small_testcase718, validity, [~c, ~b v ~a v ~b, ~b v c v ~a v a, ~a v b v ~b, b v a v ~c], 2000, count(3)).
tests(small_testcase719, validity, [~b v ~c v b v ~b, ~a, a v ~a v a, a v b v b, c v ~a], 2000, count(2)).
tests(small_testcase720, validity, [~c v c, a v c v ~a v ~a, b v ~a v ~a, b v b v ~b, b v b v b], 2000, count(4)).
tests(small_testcase721, validity, [~c v c v a v ~a, ~b v c v c, a v a v b v c, b, b v ~b v ~b], 2000, count(2)).
tests(small_testcase722, validity, [~c, ~a v c, a v ~a v ~c, a v a, c v ~c v b], 2000, count(0)).
tests(small_testcase723, validity, [~b v a v c v c, ~a, ~a v ~c v ~a v a, a v ~c, c v ~b v ~b v c], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase724, validity, [~b, ~a, a, a v b v a, c v c v ~a], 2000, count(0)).
tests(small_testcase725, validity, [~c, ~a v ~c v ~b v ~c, c, c v c v b], 2000, count(0)).
tests(small_testcase726, validity, [~c, ~c v ~b v ~b, ~b v ~a v c, ~a v ~c v ~b, c v ~c v ~b v ~b], 2000, count(3)).
tests(small_testcase727, validity, [~c v ~a v b v a, ~b v ~c v ~a, ~b v ~b v ~a v c, ~a v a v ~b, c v b], 2000, count(4)).
tests(small_testcase728, validity, [~c v ~c, ~c v b v ~c, ~b, ~a v c v ~b v b], 2000, count(2)).
tests(small_testcase729, validity, [~b v ~c, ~b v ~c v c v ~a, ~b v c v ~c v c, ~a, a v ~b v b v c], 2000, count(3)).
tests(small_testcase730, validity, [~c v ~b, ~b v ~a v c, ~b v a v ~a v ~a, b v b v ~a, c v c v a], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase731, validity, [~c v ~a v b v ~b, ~c v b, a, a v ~c v b, b], 2000, count(2)).
tests(small_testcase732, validity, [~c v c v ~a v ~a, ~a, b v ~c, c, c v ~a v ~b v ~a], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase733, validity, [~b v a v c v ~b, ~a, a v ~c v a, a v b v c v ~a, c v b v a v a], 2000, count(0)).
tests(small_testcase734, validity, [~c v ~c, ~c v ~c v a, ~a, a v ~a, c v ~a], 2000, solution([(a, f) ,(c, f)])).
tests(small_testcase735, validity, [~c, ~c v ~b v ~c v ~c, ~c v c v b v b, ~b v b v a, b v b v ~c], 2000, count(4)).
tests(small_testcase736, validity, [~b v ~c v ~a v ~a, ~a, b v ~b v b v ~c, b v a v ~b v ~a, c], 2000, count(2)).
tests(small_testcase737, validity, [~c v a v c, ~b v a v b, ~b v c, ~a v ~a, c v a], 2000, count(2)).
tests(small_testcase738, validity, [~c, ~b v ~b v ~b, a, c, c v b v c], 2000, count(0)).
tests(small_testcase739, validity, [~b, ~a v a, a v b v c v b, b v ~c v ~c, c v ~a v a v ~b], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase740, validity, [~c, ~b v b v c v ~b, ~a, ~a v b, c v c v ~a], 2000, count(2)).
tests(small_testcase741, validity, [~c, ~b v c v b, ~a v a, b v b, c v a v ~a v b], 2000, count(2)).
tests(small_testcase742, validity, [~b v ~a, ~a v ~b, a, a v ~c, b v ~a v ~b], 2000, count(2)).
tests(small_testcase743, validity, [~c v c v ~c v ~a, a v a, a v a v a v ~b, b v ~c v ~c v a, b v ~b v ~a], 2000, count(4)).
tests(small_testcase744, validity, [~b v ~b v ~a v b, ~a v a v ~c, b v a v ~b v c, c, c v ~c v c], 2000, count(4)).
tests(small_testcase745, validity, [~b v a v a v c, ~a, a v c v ~b v c, b v ~b, c v c], 2000, count(2)).
tests(small_testcase746, validity, [~c v ~c, ~b, ~b v ~a v ~c v ~b, c v ~b, c v ~b v ~c], 2000, count(2)).
tests(small_testcase747, validity, [~b v c v b v ~b, ~a, a, a v b v ~c, c], 2000, count(0)).
tests(small_testcase748, validity, [~c v ~c v b v c, ~c v c v b v c, ~a v ~b v a v a, ~a v ~b v c, a v ~b v a], 2000, count(5)).
tests(small_testcase749, validity, [~c v a, ~b v ~b v ~a, a, a v a v c, c], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase750, validity, [~b, ~b v a v ~c v a, ~a v b v c v ~b, a v a v b, b], 2000, count(0)).
tests(small_testcase751, validity, [~b, ~a, a, b v ~a v ~c, c v a], 2000, count(0)).
tests(small_testcase752, validity, [~a v ~a v ~c v ~b, a, b v ~a v a v ~c, b v b v a v a, c], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase753, validity, [~b v ~c v b, ~b v ~b v ~c v c, a, c v ~c v ~a v ~a, c v ~b v ~a], 2000, count(3)).
tests(small_testcase754, validity, [~a, ~a v ~c v a v ~a, ~a v ~b, ~a v b v ~c v a, b], 2000, count(2)).
tests(small_testcase755, validity, [a v ~b, a v ~a v ~b, c, c v a v a, c v b v a], 2000, count(3)).
tests(small_testcase756, validity, [~a v b v ~c, ~a v c v c, a v ~c v a, b v ~c v c, b v b], 2000, count(2)).
tests(small_testcase757, validity, [~a v c v c, a v ~c v c, a v ~c v c v b, b v c v a v ~c, c], 2000, count(4)).
tests(small_testcase758, validity, [~a, ~a v ~c, a v ~a v c, b v ~a, b v b], 2000, count(2)).
tests(small_testcase759, validity, [~c v c v ~b v ~c, ~b v c, ~a v a v ~c, b v ~a, c v c v ~c v ~c], 2000, count(4)).
tests(small_testcase760, validity, [~b v ~c, a, b, b v a v ~c v a], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase761, validity, [~c, ~b v ~a, b v ~a v b v ~a, c v ~c, c v b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase762, validity, [~b v b v ~a v ~b, ~a v a, a, b v b v ~a, c v b v c], 2000, count(2)).
tests(small_testcase763, validity, [~c v ~b v b v b, ~c v c, ~a, b v c v ~b v b, c v c], 2000, count(2)).
tests(small_testcase764, validity, [~a v ~c v c, ~a v b, ~a v c v a v ~b, a v a, c v ~c v c], 2000, count(2)).
tests(small_testcase765, validity, [~c, a v ~a v a v ~b, b v ~b v ~a, c, c v ~b v c v b], 2000, count(0)).
tests(small_testcase766, validity, [~c, ~b v c v ~c, a v c, b v a v c v ~c, c v ~a], 2000, count(0)).
tests(small_testcase767, validity, [~c v ~a v ~b, ~a, ~a v a, a v ~a, c v ~b v ~a v ~c], 2000, count(4)).
tests(small_testcase768, validity, [~c v ~a v ~b v ~c, ~b v ~b v ~b v ~c, a v b, b, b v b v b], 2000, count(2)).
tests(small_testcase769, validity, [~a v ~b, ~a v b v ~a v b, b, b v a], 2000, solution([(a, f) ,(b, t)])).
tests(small_testcase770, validity, [~c, ~c v ~a v a, ~c v b v ~b, ~c v b v c v c, ~a v ~c v ~b], 2000, count(4)).
tests(small_testcase771, validity, [~b v c v ~c v ~c, ~a, a v ~c v ~a, b v ~a, b v c v ~b], 2000, count(4)).
tests(small_testcase772, validity, [~c v ~a, ~b v a v a, ~a v ~c v ~b v b, ~a v c v ~a v ~a, c v a], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase773, validity, [~c v a v ~b v c, a, b, b v ~a v c v a, c v b v b], 2000, count(2)).
tests(small_testcase774, validity, [~c v c v b v b, a, c v a v a, c v b v c v ~a, c v c v b v ~c], 2000, count(3)).
tests(small_testcase775, validity, [~b, ~b v ~c v ~c, ~b v a, b v a v ~b v ~b, c v b v ~a v a], 2000, count(4)).
tests(small_testcase776, validity, [~b v c v b, a v ~a, a v a v ~b v a, a v c v c, c], 2000, count(3)).
tests(small_testcase777, validity, [~c v ~a, ~c v ~a v c, b v a v ~c, c v ~a v a, c v a v c], 2000, count(3)).
tests(small_testcase778, validity, [~c v b, ~b v a v a, ~a, b v ~a v ~a, c v c v ~c v ~b], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase779, validity, [~c v ~b v c v ~c, ~b v b v b, ~a v ~a v b v a, b v b v c v ~b, c v b], 2000, count(6)).
tests(small_testcase780, validity, [~c v b v ~a v ~b, ~a, b, b v a v ~c v ~a, c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase781, validity, [~c v ~c v ~c v ~c, ~c v ~c v ~b, ~a v ~a, b v c v c, c], 2000, count(0)).
tests(small_testcase782, validity, [~c v b v c, ~a v ~a v ~b, a v c v ~a v ~a, b, c v c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase783, validity, [~b v ~b, ~b v a v ~a v ~a, b, b v ~a, c v c v ~c v c], 2000, count(0)).
tests(small_testcase784, validity, [~c v ~b v b v c, ~b, a v ~b, b, b v b], 2000, count(0)).
tests(small_testcase785, validity, [~a, a v a v ~a, c v ~b v ~c v ~b, c v ~a v a, c v b v c], 2000, count(3)).
tests(small_testcase786, validity, [~c, a v c, b v a v ~a, b v a v c v a, c v a v a], 2000, count(2)).
tests(small_testcase787, validity, [~c, ~c v ~b, ~a v b v c v a, a v ~c, b v ~b], 2000, count(4)).
tests(small_testcase788, validity, [~c v c v ~c, ~b v ~b v b v ~c, ~a, ~a v b v ~b, ~a v b v ~a v ~a], 2000, count(4)).
tests(small_testcase789, validity, [~b v ~c, ~b v ~a v ~c v b, a v ~c, a v ~b v ~b, a v b v ~b], 2000, count(4)).
tests(small_testcase790, validity, [~c v a v b v b, ~b v a v ~c, b v a, c v ~b v ~b v ~b, c v b v a v ~a], 2000, count(3)).
tests(small_testcase791, validity, [~c, ~c v ~a v c v a, ~a v ~b v ~b v b, a, a v ~b v ~a v ~b], 2000, count(2)).
tests(small_testcase792, validity, [~c, ~c v c v a, ~b v ~c v ~c v b, ~a v ~a v c, c v ~b v b v ~b], 2000, count(2)).
tests(small_testcase793, validity, [~c, ~c v ~c v ~a v b, ~c v b, ~b v b, ~a], 2000, count(2)).
tests(small_testcase794, validity, [~c v ~c v ~c, ~c v c v ~a v ~c, ~b, b v c, c v ~a], 2000, count(0)).
tests(small_testcase795, validity, [~b v ~b, a v ~c, b, c v ~c, c v c v a], 2000, count(0)).
tests(small_testcase796, validity, [~b v ~b v b, ~a v ~c, a, a v c v a v c, b v a], 2000, count(2)).
tests(small_testcase797, validity, [~c, ~b, a v ~c v c v c, a v a, b v a v ~a v b], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase798, validity, [~c v b, ~b v ~c, c v ~c v a v a, c v a v a, c v b v b v b], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase799, validity, [~c, ~b, b v ~a v b, c v ~b v ~c v b, c v a v b v b], 2000, count(0)).
tests(small_testcase800, validity, [~c, ~c v b, ~b v c, b v ~b v ~c v a, c], 2000, count(0)).
tests(small_testcase801, validity, [~c v ~b v ~c v c, ~c v c v c, ~b v c v ~c v ~a, a, a v ~a], 2000, count(4)).
tests(small_testcase802, validity, [~c v a v c, ~c v b v ~b v b, ~a v a, b, c v ~c v c], 2000, count(4)).
tests(small_testcase803, validity, [~c v a v ~b v ~a, ~a v c, a v c v a, c], 2000, count(4)).
tests(small_testcase804, validity, [~c v ~a v c, ~b v a v ~c, ~a v ~a, b v a v c, c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase805, validity, [~b, ~b v c v ~b v ~a, ~a v ~a, b v ~a v b v ~c, c v b v ~a v ~a], 2000, count(2)).
tests(small_testcase806, validity, [~c v ~b v ~a v ~c, ~c v a v b v ~c, ~b, ~b v ~b v ~b, c v ~a v ~c], 2000, count(3)).
tests(small_testcase807, validity, [~c v c, ~b, ~a, b v ~c], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase808, validity, [~b v ~b v c, ~a v ~b v b v c, a, c v ~b, c v ~a v ~c v a], 2000, count(3)).
tests(small_testcase809, validity, [~c, a v ~b v b v ~c, b v a v a, b v c, c v b v c v c], 2000, count(2)).
tests(small_testcase810, validity, [~c v ~c v ~b v ~c, ~c v ~b v ~a, ~b v ~b v ~c v ~a, ~b v ~a, ~b v b v c v a], 2000, count(5)).
tests(small_testcase811, validity, [a v b v ~b v b, a v b v c v c, b v ~a v ~b v a, b v b v ~a v b, c], 2000, count(3)).
tests(small_testcase812, validity, [~b v ~b v c v c, ~b v a v c v ~a, ~a v ~b, b v c v ~b v b, c v a], 2000, count(4)).
tests(small_testcase813, validity, [~c, ~c v ~a v ~c v b, ~b v ~c v ~c v b, ~b v ~b, b v a v a v ~b], 2000, count(2)).
tests(small_testcase814, validity, [~b, ~b v ~c v ~c v c, ~b v c, a v ~a v ~a v ~a, b], 2000, count(0)).
tests(small_testcase815, validity, [~a v ~b v ~a v b, a v ~a v ~c, b v c v a v ~c, c v ~c v ~b, c v c v c], 2000, count(4)).
tests(small_testcase816, validity, [~c, ~b v a, ~a, b v ~c, b v ~c v c v ~b], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase817, validity, [~b, ~a v c v b v c, a, b v b v ~b v ~b, c v b], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase818, validity, [~c v ~b v c, ~c v ~a v a v c, ~a, ~a v ~c v b, a v a], 2000, count(0)).
tests(small_testcase819, validity, [~c v ~a, ~b v c, a v ~b, b, c v a], 2000, count(0)).
tests(small_testcase820, validity, [~b, ~a, a v b v a v ~a, b v a v c, c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase821, validity, [~b v ~a, ~a v b v ~c, ~a v c v a, a, c v ~b v b v b], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase822, validity, [~c, ~a v ~c v b v c, ~a v ~b v ~b, b v ~a, b v b v ~a], 2000, count(2)).
tests(small_testcase823, validity, [~b v ~c, ~a v a v a v b, a, a v ~c v ~b, c v a], 2000, count(3)).
tests(small_testcase824, validity, [~b, ~a, ~a v c, a v ~a], 2000, count(2)).
tests(small_testcase825, validity, [~b, ~a, ~a v ~a v b v b, a v ~c v c, a v ~a v a v c], 2000, count(2)).
tests(small_testcase826, validity, [~c v ~b, ~b, ~a v b v c v ~c, c v c v ~c], 2000, count(4)).
tests(small_testcase827, validity, [~b v b v ~b v ~b, ~a v a, ~a v a v a v c, a v ~c v c v ~b, c v a v c], 2000, count(6)).
tests(small_testcase828, validity, [~a v ~b v c v b, b v ~c, b v b, c v ~b v ~c, c v a], 2000, count(3)).
tests(small_testcase829, validity, [~c v ~b v ~b v ~a, ~b v b v ~c, ~a v ~c, ~a v ~b v c, a v ~c], 2000, count(3)).
tests(small_testcase830, validity, [~c v a v ~a v c, ~b, a, b, c v a v a v a], 2000, count(0)).
tests(small_testcase831, validity, [~c v c v c, ~b v b v ~c v ~c, ~a, ~a v b, c v a v ~c v a], 2000, count(4)).
tests(small_testcase832, validity, [~c, ~b, ~a v b v a, a v b, a v c v a v c], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase833, validity, [~c v a v ~a, ~a v ~a, a v b, a v b v ~b v ~b, c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase834, validity, [~c, ~c v a v c v a, a v c v c, b v ~b, c], 2000, count(0)).
tests(small_testcase835, validity, [~b v b, a v a, a v c v ~a, b v ~a, c v ~a], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase836, validity, [~c, ~a, a v b v a v a, b v c v ~a, c v b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase837, validity, [~a v ~c v ~a v ~c, a, b v b v ~c, b v c, c], 2000, count(0)).
tests(small_testcase838, validity, [~c, ~a, a, a v c v a v ~b, b v b], 2000, count(0)).
tests(small_testcase839, validity, [~c v ~b v c v ~b, ~b v a v a, ~a v c v ~c v ~c, b, b v ~a v ~b], 2000, count(2)).
tests(small_testcase840, validity, [~a v c v b v c, a v b, b v b v ~c, c v ~b v ~a, c v ~b v ~a v ~b], 2000, count(3)).
tests(small_testcase841, validity, [a v b v ~c, b v ~a v ~a, b v ~a v b, b v b v ~a, c], 2000, count(2)).
tests(small_testcase842, validity, [~c v ~b v ~c, ~b v b, ~a, a v a v ~b v b, b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase843, validity, [~c v ~b v a, ~c v c, ~a, b v ~b v c, b v c v ~b v ~b], 2000, count(3)).
tests(small_testcase844, validity, [~b v a v c, ~a v ~c v ~c v ~a, a v ~a, c, c v c], 2000, count(2)).
tests(small_testcase845, validity, [~b v a v a, ~b v c v a v ~a, ~a v ~b v ~c, a v c, b v ~b v a], 2000, count(4)).
tests(small_testcase846, validity, [~c, ~b v a v b, ~a v b, b, c], 2000, count(0)).
tests(small_testcase847, validity, [~a v a v ~a, a, b, c v ~c, c v ~b v a v b], 2000, count(2)).
tests(small_testcase848, validity, [~a v ~c v b v a, b v ~c, b v ~b v b, b v a v b, c v a v ~c], 2000, count(5)).
tests(small_testcase849, validity, [~c v ~b v b v ~c, ~c v b, ~b, a, a v ~c v b v ~c], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase850, validity, [~c v ~b v a v b, ~b v b, ~a v ~a v ~b, c v ~a, c v a v c v ~c], 2000, count(5)).
tests(small_testcase851, validity, [~a v ~b v a v c, a, a v a v ~c, b, c v a v c], 2000, count(2)).
tests(small_testcase852, validity, [~b, ~b v ~c v ~a, ~b v a v b, ~b v c, ~a], 2000, count(2)).
tests(small_testcase853, validity, [~c v ~a, ~b, a v a, c, c v ~c v ~a], 2000, count(0)).
tests(small_testcase854, validity, [~c v ~a v b, ~b v ~a v a v ~b, ~a, a v a, b v a v ~b], 2000, count(0)).
tests(small_testcase855, validity, [~b v ~a v c v a, ~b v c v b, b, c v ~a, c v b v a], 2000, count(3)).
tests(small_testcase856, validity, [~c, a v ~c v a v c, b v a v ~c v ~a, c v b, c v b v c], 2000, count(2)).
tests(small_testcase857, validity, [~b v b v ~c v ~c, ~a v ~c v a v b, ~a v b v c v a, a v ~b, c v ~c], 2000, count(6)).
tests(small_testcase858, validity, [~c v a v c v ~b, ~b v b v ~c v ~b, a, a v ~a v c v ~c, a v c v ~c v c], 2000, count(4)).
tests(small_testcase859, validity, [~a v ~c v b v ~b, ~a v ~b v a v c, ~a v a v ~b v ~a, b v ~b, c v ~b v ~c v ~c], 2000, count(8)).
tests(small_testcase860, validity, [~c, ~c v ~c v a, ~a v ~a v ~b, a v ~c, b v ~b v ~a v ~b], 2000, count(3)).
tests(small_testcase861, validity, [~c, ~c v a, a, b v ~b, c], 2000, count(0)).
tests(small_testcase862, validity, [~c v ~a v a, ~b, a v ~c, b, c v ~c v b v ~c], 2000, count(0)).
tests(small_testcase863, validity, [~c v ~c v ~b, ~b v ~a, a, b, b v ~a v a v ~a], 2000, count(0)).
tests(small_testcase864, validity, [~c v b v ~b v c, a v a v ~b v a, b, c v ~a], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase865, validity, [~c v ~b v ~b, ~a, a, b v ~b v ~a, c v ~c], 2000, count(0)).
tests(small_testcase866, validity, [~c, ~c v c v c v c, ~a v a v ~c v c, ~a v b v ~a, b v ~c v ~c v ~b], 2000, count(3)).
tests(small_testcase867, validity, [~c, ~b v c, a v ~b, b, c v ~b], 2000, count(0)).
tests(small_testcase868, validity, [~c v b, ~b, ~a v ~b, ~a v ~b v ~c, b v ~a v c], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase869, validity, [~a, ~a v c v ~b v b, b v ~b v ~b v ~a, b v b v ~a v b, c v a v ~c], 2000, count(4)).
tests(small_testcase870, validity, [~c v ~c, ~c v b v a v ~b, ~b v ~b v ~b, a v ~a v ~a, b v ~a], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase871, validity, [~c v ~a, ~c v b, ~b v ~a, ~b v ~a v ~a v ~b, c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase872, validity, [~c v ~c v ~b v c, ~c v ~b v ~c v ~c, ~c v ~a v a, a, b v ~c v ~c v ~b], 2000, count(3)).
tests(small_testcase873, validity, [a v ~b v ~a, c, c v ~c v ~c, c v a, c v c], 2000, count(4)).
tests(small_testcase874, validity, [~a, ~a v c v ~b, b], 2000, count(2)).
tests(small_testcase875, validity, [~c v ~c v ~b, ~b v ~a v c, a v ~b, b v ~b v ~c, c v c], 2000, count(2)).
tests(small_testcase876, validity, [~c v ~c v ~c, ~a v ~c v b v a, ~a v ~b v b, ~a v c v a, a v c v ~a], 2000, count(4)).
tests(small_testcase877, validity, [~c v a v ~a v c, ~b v ~a v ~a v ~a, ~a v c v a, a v c v ~a v a, c v c v ~c v c], 2000, count(6)).
tests(small_testcase878, validity, [~c v a v b v b, ~c v b v c v b, b v ~a v b v ~c, b v c v ~b, c v c v a], 2000, count(4)).
tests(small_testcase879, validity, [~b v ~b v a v b, ~b v b v a, ~a, b v ~c v b, c v a v b v ~c], 2000, count(3)).
tests(small_testcase880, validity, [~c v ~a v a, ~a v b, b, b v ~a], 2000, count(4)).
tests(small_testcase881, validity, [~c v ~a v b v ~b, ~b v a, ~a v b, a v ~c, c v ~b], 2000, count(2)).
tests(small_testcase882, validity, [~b v ~a, ~b v b v c v ~a, a v a v ~b v ~a, c], 2000, count(3)).
tests(small_testcase883, validity, [~c v ~c v b, ~c v a v a, ~a v ~a, ~a v b v ~a v ~b, c v c], 2000, count(0)).
tests(small_testcase884, validity, [~c, ~c v ~a v ~b v a, ~c v a v ~b, a v a v a v b, b v ~a], 2000, count(2)).
tests(small_testcase885, validity, [~b v ~c, ~b v b v c v a, ~a, b v ~b v b v ~a, b v c v ~c v ~b], 2000, count(3)).
tests(small_testcase886, validity, [~c, ~b, ~b v a v ~c v c, ~a v ~a v ~a, c v a v ~c v a], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase887, validity, [~b, ~b v ~b v b v a, a v a v ~a v ~c, b, b v ~b v a], 2000, count(0)).
tests(small_testcase888, validity, [~c v c, ~b v b v ~a v ~a, a, a v c v b, c v c v b v c], 2000, count(3)).
tests(small_testcase889, validity, [~a, ~a v ~a v ~a v ~c, a v ~c v a v b, a v ~a v ~b v c, c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase890, validity, [~c v ~a v ~a, ~b v ~c, ~a v ~c v ~b, a, a v ~b v ~c v b], 2000, count(2)).
tests(small_testcase891, validity, [~c v ~b v ~b v c, a v ~a v c, b v a v b v b, b v b v ~b v a, c v ~a v b v c], 2000, count(5)).
tests(small_testcase892, validity, [~b v a v ~c v ~c, a v ~a v ~a v ~c, a v ~a v c v a, c v ~b, c v b], 2000, count(3)).
tests(small_testcase893, validity, [~c v ~a v ~a, ~b v ~a v ~a, ~a v a, a, a v b v ~c], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase894, validity, [~c v a v ~a v a, ~b, ~a v c v a, b, b v c v ~b v ~a], 2000, count(0)).
tests(small_testcase895, validity, [~b, a v ~b, c, c v ~b v a v b], 2000, count(2)).
tests(small_testcase896, validity, [~c v ~b v a v ~c, ~b, ~a v b v ~a, b v b v a v ~b, b v c v a v a], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase897, validity, [~c, ~c v b, ~b v c v b v a, ~a v c, c v ~a v ~b], 2000, count(2)).
tests(small_testcase898, validity, [~c v ~a, ~a, b, b v b], 2000, count(2)).
tests(small_testcase899, validity, [~b v ~c v ~a, ~a, a v b v b v ~a, c v ~c v ~c v a, c v b], 2000, count(3)).
tests(small_testcase900, validity, [~c v ~a v ~c v ~b, a v ~c v a v ~c, b v ~c, b v ~c v a, c v ~c], 2000, count(4)).
tests(small_testcase901, validity, [~c, a v ~c v b, a v ~b v ~b v c, b v a v c v ~b, c v a v ~b], 2000, count(3)).
tests(small_testcase902, validity, [~c v c, ~a v a v ~c v ~b, a v ~c v a v a, b v a, b v c v b], 2000, count(4)).
tests(small_testcase903, validity, [~c v ~b v a v c, ~a v c v ~b, b, b v ~b, b v a], 2000, count(3)).
tests(small_testcase904, validity, [~c v ~c v b v ~c, ~b v ~a, ~a v b v ~a v ~b, c v a, c v b v ~c], 2000, count(2)).
tests(small_testcase905, validity, [~c v b v ~c v ~b, ~c v b v ~a, b, b v ~b v a, b v a], 2000, count(4)).
tests(small_testcase906, validity, [~b v c v ~c, a, c, c v ~b v ~c v ~c, c v b v ~a], 2000, count(2)).
tests(small_testcase907, validity, [~c, ~a v ~b v ~c v ~a, ~a v a, a v ~b, c v ~a], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase908, validity, [~b v b v c, ~a v ~c v b v c, ~a v a, a v a v b, b v c v ~b], 2000, count(6)).
tests(small_testcase909, validity, [~c v a v b v ~b, ~b, a v a v b v c, a v c v a v b, b v a v b], 2000, count(2)).
tests(small_testcase910, validity, [~b v a v c v ~a, a v ~b v ~c, b, b v ~a, b v a v ~b], 2000, count(3)).
tests(small_testcase911, validity, [~b, ~b v b v a v a, ~b v c v c, b v b v c, c v ~c v b v ~a], 2000, count(2)).
tests(small_testcase912, validity, [~b v c v ~c v ~a, b v a v ~a, b v c, c, c v c], 2000, count(4)).
tests(small_testcase913, validity, [~c v ~a v c v b, ~b v ~b, ~a, a v c v c, b v ~c v ~a v a], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase914, validity, [~c v ~c v c v b, ~b, a, b v ~a v a, c v ~b v ~a], 2000, count(2)).
tests(small_testcase915, validity, [~b v b, a v ~b, a v ~a v ~c, b, c], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase916, validity, [~c v c, ~b, a v ~c v ~c, b v b v c], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase917, validity, [~c, ~c v c v ~c v a, ~a v ~c, ~a v ~b v ~a v ~c, a v ~a], 2000, count(4)).
tests(small_testcase918, validity, [a v ~a v ~a, b v ~b v ~b v ~c, c, c v ~c, c v c v ~c], 2000, count(4)).
tests(small_testcase919, validity, [~b v c v ~a v b, ~a v ~a, a v ~b v c v ~c, c v ~b v ~c v ~c, c v a], 2000, count(2)).
tests(small_testcase920, validity, [~b v ~b v ~c v ~c, ~b v ~a v ~b, a v c, c v ~a v ~c, c v a], 2000, count(3)).
tests(small_testcase921, validity, [~c v b v a, ~a v a v ~c v ~c, b, b v ~a v b v ~c, c], 2000, count(2)).
tests(small_testcase922, validity, [~a v ~a v b, a, b, b v ~a, c], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase923, validity, [~b v ~b v c v ~c, a v ~b v c v ~a, a v c v b, b, c], 2000, count(2)).
tests(small_testcase924, validity, [~c, ~c v c, ~a v ~a, ~a v c, b v ~b v ~b v b], 2000, count(2)).
tests(small_testcase925, validity, [~c v ~b v b, ~b v ~b, ~b v a v ~a, a, b], 2000, count(0)).
tests(small_testcase926, validity, [~c v ~b, ~a v ~b v ~b v ~a, a, b v ~c v ~b v a, b v c v a], 2000, count(2)).
tests(small_testcase927, validity, [~c v ~a v ~b, ~c v ~a v c, ~a v ~a, a v ~b, a v c v a], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase928, validity, [~a v a v ~c, b, c, c v ~c, c v ~c v a v b], 2000, count(2)).
tests(small_testcase929, validity, [~c v ~c v ~a, ~a v a v ~b, ~a v a v c, ~a v c v ~c, ~a v c v c v c], 2000, count(4)).
tests(small_testcase930, validity, [~c v ~c v a v b, ~c v ~b, ~c v c v b v ~b, ~a v a v a, b v ~a], 2000, count(3)).
tests(small_testcase931, validity, [~b v ~b v ~c v a, b v ~a, b v ~a v ~b v b, c v ~c], 2000, count(5)).
tests(small_testcase932, validity, [~a v ~c v a v c, ~a v ~b v ~b, b v c v ~b v ~c, c v ~a], 2000, count(5)).
tests(small_testcase933, validity, [~b, ~b v ~b, b, b v ~c v ~c v ~b, c v ~a v ~c v a], 2000, count(0)).
tests(small_testcase934, validity, [~b v ~b v ~c v c, a, b v ~b v ~a, c v ~a], 2000, count(2)).
tests(small_testcase935, validity, [~c v a v ~a, ~b v a, b, b v b, c v ~c], 2000, count(2)).
tests(small_testcase936, validity, [~b, a v a, b v ~b v b, c v ~c, c v a v ~c v ~b], 2000, count(2)).
tests(small_testcase937, validity, [~a, ~a v b v ~b v c, b v ~a v ~a, c, c v a v ~b], 2000, count(2)).
tests(small_testcase938, validity, [~c v ~c v a v ~a, ~c v b v b v b, ~a v ~b, a v ~a, b v b], 2000, count(2)).
tests(small_testcase939, validity, [~b, ~b v a, ~a v ~a, ~a v b v ~a, a], 2000, count(0)).
tests(small_testcase940, validity, [~c v a v ~c v c, ~a v b, a v b v ~a v a, b], 2000, count(4)).
tests(small_testcase941, validity, [~c v ~a, ~c v b, ~a v ~b v ~b v ~a, b v ~b, c v c v ~b], 2000, count(3)).
tests(small_testcase942, validity, [~c v ~c, ~c v ~b v ~b v ~a, ~a v ~b v c v c, a v ~c v a v ~b, c v ~b v ~a v b], 2000, count(3)).
tests(small_testcase943, validity, [~c, ~b v a v a, ~a v b v ~b, b, b v ~a v ~b], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase944, validity, [~b v a, ~b v b, ~a, c, c v ~c v ~b], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase945, validity, [~c, ~b, ~a v c v ~c, a, a v ~b], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase946, validity, [~b v ~c, ~a, a v a v ~a, b v ~a v ~c, b v c], 2000, count(2)).
tests(small_testcase947, validity, [~b v c v ~c v ~a, b, b v b v b v c, c, c v ~c], 2000, count(2)).
tests(small_testcase948, validity, [~c v b v ~a, ~a v ~a, a, b, b v c], 2000, count(0)).
tests(small_testcase949, validity, [~c v a, ~b, ~b v c, ~a v a v b, c], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase950, validity, [~b v b v b, ~a v ~c, ~a v c v b, b v c, c v a], 2000, count(3)).
tests(small_testcase951, validity, [~b v a, ~b v a v a, ~a, ~a v b v a, a v a v a], 2000, count(0)).
tests(small_testcase952, validity, [~c, ~b v ~c, ~b v c v ~b, b v a v b v ~c, b v c v ~a], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase953, validity, [~c v ~c v ~b, ~a, b v ~c v b v b, b v c, c v c v ~c], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase954, validity, [~b v ~c v a v b, ~b v ~b, ~a, a, a v ~c v ~a v ~a], 2000, count(0)).
tests(small_testcase955, validity, [~c v b v ~b v c, ~c v b v ~a, ~c v c v a v a, b v ~b, c v a v a], 2000, count(5)).
tests(small_testcase956, validity, [~c v ~a v ~b v a, ~b v ~a v ~a, ~a v ~a v ~a v b, b v b v a v ~a, c v b v a], 2000, count(3)).
tests(small_testcase957, validity, [~c v a v a, ~a v ~b v c, a v ~a v ~a, b v ~a v c, c v ~c v ~a], 2000, count(4)).
tests(small_testcase958, validity, [~b, ~b v ~a v b, ~a, b v a v ~b v b, c v ~b v a v ~b], 2000, count(2)).
tests(small_testcase959, validity, [~c, ~c v c v b, ~a v a v b v c, b, c v ~b v ~a v ~a], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase960, validity, [~c, ~c v ~a v c, b, b v ~a v b, c v ~b], 2000, count(0)).
tests(small_testcase961, validity, [~c v a v ~a, ~c v b, ~b v ~a v c v a, a v c, c v a v ~c], 2000, count(4)).
tests(small_testcase962, validity, [~b v ~c v b, ~a v c v ~a v a, a v ~c v b, a v ~a v ~b v ~c, b v a v ~b], 2000, count(7)).
tests(small_testcase963, validity, [~a v b v b, a v ~c, b], 2000, count(3)).
tests(small_testcase964, validity, [~b v ~b, ~b v ~a v ~b v ~c, ~b v c v a v ~c, ~a, ~a v ~b v ~b], 2000, count(2)).
tests(small_testcase965, validity, [~c v ~c v b, ~b v ~a v ~b v ~b, ~b v c, ~a v ~c v ~b, c v ~c], 2000, count(3)).
tests(small_testcase966, validity, [~b, ~a v ~c, ~a v b v c, a v b v ~c, c v c], 2000, count(0)).
tests(small_testcase967, validity, [~a, ~a v ~b v b v ~b, a v c v ~a v c, b v b, c v ~c v ~c], 2000, count(2)).
tests(small_testcase968, validity, [~c v ~a, ~b v ~c v ~c, b, b v ~c v c, b v a v a v b], 2000, count(2)).
tests(small_testcase969, validity, [~c, ~b v ~b v b, ~b v ~a v c v a, ~b v b v ~a, ~a], 2000, count(2)).
tests(small_testcase970, validity, [~c v a, ~a, b, b v ~a], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase971, validity, [~c v b, a v ~b v ~b v ~c, a v a, a v a v b, b], 2000, count(2)).
tests(small_testcase972, validity, [~b v ~a, ~b v b v ~b, a, a v ~b v a v c, a v a], 2000, count(2)).
tests(small_testcase973, validity, [~c v a v b v a, ~b v c, a v a, b v ~c, c v ~c v ~b v b], 2000, count(2)).
tests(small_testcase974, validity, [~c v c v c v ~a, ~a v a, a v ~a v a, b v ~c, c v ~b v c v b], 2000, count(6)).
tests(small_testcase975, validity, [~c v c, ~a v ~c v a, ~a v ~b, b, c v ~c], 2000, count(2)).
tests(small_testcase976, validity, [~c v ~a v a v ~b, ~a v ~a v ~b v ~b, ~a v ~a v ~a v ~a, ~a v a v b v ~c, a v ~a], 2000, count(4)).
tests(small_testcase977, validity, [~b v ~a v a v b, a, a v ~c v ~c, a v a v c, c v a v ~a], 2000, count(4)).
tests(small_testcase978, validity, [~c v b, ~a v ~a, a v ~c, b, b v ~a v ~b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase979, validity, [~b, ~b v ~a v ~b v ~b, ~a v ~c v b v ~c, c, c v c v ~a v c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase980, validity, [~b v ~c, ~a, ~a v ~c v a v c, ~a v b, b v b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase981, validity, [~c, ~c v a v ~a v ~b, ~b, b], 2000, count(0)).
tests(small_testcase982, validity, [~c v b v b, ~b, ~b v a v ~b v a, b v ~a v ~a, c], 2000, count(0)).
tests(small_testcase983, validity, [~c v b v ~a, ~a v c v a, a, a v ~a, b], 2000, count(2)).
tests(small_testcase984, validity, [~c v b, ~c v b v ~c v ~c, a v ~b, b, c v a], 2000, count(2)).
tests(small_testcase985, validity, [~c, a, a v a, c], 2000, count(0)).
tests(small_testcase986, validity, [~a, a, b, c v ~c], 2000, count(0)).
tests(small_testcase987, validity, [~c v a, ~b v ~c v ~a, ~a v ~b, a v ~c v b v ~b, a v c v ~a], 2000, count(4)).
tests(small_testcase988, validity, [~b v b v b, ~a v ~a v ~c v ~a, c, c v c v ~c], 2000, count(2)).
tests(small_testcase989, validity, [~c v ~b v a, ~c v c v ~c, c v ~c, c v ~b v b, c v a v c], 2000, count(5)).
tests(small_testcase990, validity, [~a, ~a v ~b v ~b, ~a v a v ~c, c v b, c v c], 2000, count(2)).
tests(small_testcase991, validity, [~c, ~c v ~c v ~a, a, a v ~c v c v ~c, b v c v ~c v b], 2000, count(2)).
tests(small_testcase992, validity, [~b v ~b v b, ~a v b v a v ~a, b v ~a v ~b v c, b v b, c v ~a v ~a v ~c], 2000, count(4)).
tests(small_testcase993, validity, [~c, ~a, ~a v c v c, a v a], 2000, count(0)).
tests(small_testcase994, validity, [~b v a v c v ~a, a v b, a v c, c, c v ~c v a], 2000, count(3)).
tests(small_testcase995, validity, [~b, ~b v ~a v a, a v ~b v c, b v ~a v ~a, b v c v ~a v ~c], 2000, count(2)).
tests(small_testcase996, validity, [~b v ~c, ~a v a v c, a v ~c v a v ~a, c v ~c v ~a, c v c v ~b], 2000, count(4)).
tests(small_testcase997, validity, [~c, ~b, ~b v ~a, a v c v ~c v c, c v ~c v ~b v ~b], 2000, count(2)).
tests(small_testcase998, validity, [~b, ~b v ~a v ~c, ~b v b, a v b v ~b, c v ~b v a v ~b], 2000, count(4)).
tests(small_testcase999, validity, [~c, ~b v c v c v ~c, ~a, a v a v c], 2000, count(0)).
tests(small_testcase1000, validity, [~c, ~c v ~c, ~c v c v b v ~b, ~b, ~b v ~b v ~a], 2000, count(2)).
tests(small_testcase1001, validity, [~c, ~c v c v a, ~b v c v b v ~b, b v c v ~c v b, c v c v a], 2000, count(2)).
tests(small_testcase1002, validity, [~c v ~c v a, ~a v ~c v ~a v c, a, a v b v ~b, b v ~b v b], 2000, count(4)).
tests(small_testcase1003, validity, [~c v c v ~a, ~b, ~a v c, ~a v c v a, c v ~b v ~a], 2000, count(3)).
tests(small_testcase1004, validity, [~c v ~a, ~a v ~b v b, b], 2000, count(3)).
tests(small_testcase1005, validity, [~c, ~c v ~a, ~b v ~c v ~c, ~a v ~c v ~c, c], 2000, count(0)).
tests(small_testcase1006, validity, [~b v ~c, ~a v ~b v ~a v b, a, b, b v a v ~c v a], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase1007, validity, [~c v b, a v ~c v c v ~a, b, b v a, b v c v a v c], 2000, count(4)).
tests(small_testcase1008, validity, [~c, ~a v ~a, a v ~a v ~a, a v c v ~b, b], 2000, count(0)).
tests(small_testcase1009, validity, [~a v a v ~a v a, ~a v b, a v ~b v ~c, b v ~a, c v ~a v c v ~c], 2000, count(5)).
tests(small_testcase1010, validity, [~b v ~a v ~a v ~a, ~a v c v c v b, a v ~b, a v b v b, b v ~a v ~a], 2000, count(0)).
tests(small_testcase1011, validity, [~a v ~b, ~a v a v ~a, a v a v a v a, a v b v ~c, c v b v c v ~a], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase1012, validity, [~c v ~b v ~a, ~b v ~a v b, a, b v a, b v b], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase1013, validity, [~a v ~a v b v ~b, ~a v a, ~a v c, ~a v c v c, b v b], 2000, count(3)).
tests(small_testcase1014, validity, [~c v ~a, ~b v ~a, a v ~c, b v a v c v a, b v c v ~b v ~b], 2000, count(2)).
tests(small_testcase1015, validity, [~a v ~b, ~a v a, ~a v c v c v ~a, b, b v a], 2000, count(2)).
tests(small_testcase1016, validity, [~c v a, ~b, ~b v ~b, ~a v ~b v b v a, c v a v ~a v ~a], 2000, count(3)).
tests(small_testcase1017, validity, [~c v ~b v c, ~c v c, ~a v a v ~b v a, a v ~c, a v b v ~a v ~b], 2000, count(6)).
tests(small_testcase1018, validity, [~c, ~c v b, ~a v a, ~a v c], 2000, count(2)).
tests(small_testcase1019, validity, [~c, ~b, b, b v ~b v ~c v b, b v ~b v c], 2000, count(0)).
tests(small_testcase1020, validity, [~b v b, a v c, b, b v ~c v a, c v b v ~b v ~c], 2000, count(3)).
tests(small_testcase1021, validity, [~c v a v ~a, a v c v ~a v ~c, b v ~c v ~b v ~c, b v ~c v b, b v a v ~c v a], 2000, count(6)).
tests(small_testcase1022, validity, [~b, ~b v c v ~b v ~b, ~a v ~b, ~a v a v ~c v ~a, ~a v c v ~b v ~b], 2000, count(4)).
tests(small_testcase1023, validity, [~b v b v a v c, b v ~c v b, c, c v ~a v ~a, c v a v ~c], 2000, count(2)).
tests(small_testcase1024, validity, [~b, a v ~a, a v a v c v ~b, b v b v ~a v c, c v b v ~a v c], 2000, count(3)).
tests(small_testcase1025, validity, [~c v ~a, ~b v ~b v ~a v b, ~b v b, a, b v ~a], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase1026, validity, [~c v c, ~b v b, ~a, ~a v ~c v b, a], 2000, count(0)).
tests(small_testcase1027, validity, [~c, ~c v c v ~c, b, c v ~a v ~a v ~a, c v a v b v b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase1028, validity, [~c v ~b, ~c v b, ~c v c, ~b v ~c, ~a v c v b], 2000, count(3)).
tests(small_testcase1029, validity, [~b v ~c v ~c v ~b, ~b v ~b, ~b v ~a, ~b v a, b v ~a v ~b v c], 2000, count(4)).
tests(small_testcase1030, validity, [a v a, c, c v ~a, c v b], 2000, count(2)).
tests(small_testcase1031, validity, [~c v a v ~b, ~b v c v b v ~c, a v c, b v a, c v ~b v ~c v c], 2000, count(4)).
tests(small_testcase1032, validity, [~b, ~b v a v c v b, ~a v ~b v ~c v b, ~a v b v c, b], 2000, count(0)).
tests(small_testcase1033, validity, [~c v a v ~a v ~a, a v ~b v ~c, a v ~a, c, c v c v c v ~b], 2000, count(3)).
tests(small_testcase1034, validity, [~c v ~b, ~c v c v ~c v ~c, a v ~a v ~a, b v ~c v a, b v b v ~b v ~c], 2000, count(5)).
tests(small_testcase1035, validity, [~b, ~a v b, b, b v ~a], 2000, count(0)).
tests(small_testcase1036, validity, [~c v ~a v c, a, b, b v ~c, c v ~a v ~b], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase1037, validity, [~b v ~c, ~a v ~c, a, a v ~c, b v ~b v ~b], 2000, count(2)).
tests(small_testcase1038, validity, [~c, a v b v ~c v ~c, a v c v ~a, b v a v c, c], 2000, count(0)).
tests(small_testcase1039, validity, [a v ~c v ~b, a v c, b v ~c, b v ~a], 2000, count(2)).
tests(small_testcase1040, validity, [~b v ~a, ~a v ~a v ~a, ~a v c, a, a v c], 2000, count(0)).
tests(small_testcase1041, validity, [~c v ~c v ~a, ~b v ~a v b v ~c, ~a v a, b v a v b v b, c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase1042, validity, [~b v ~b v ~b v c, ~b v a v b, a, b], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase1043, validity, [~c, ~b v b, a, b v ~c v a v ~a, c v c v c v a], 2000, count(2)).
tests(small_testcase1044, validity, [~b v ~c, ~b v a v b v a, ~a, a v ~b, a v a v a], 2000, count(0)).
tests(small_testcase1045, validity, [~b v ~b v ~b v ~b, b, b v ~b, c v ~c, c v ~a], 2000, count(0)).
tests(small_testcase1046, validity, [~c v a v b v c, ~b, ~b v ~a, ~a, ~a v c v c], 2000, count(2)).
tests(small_testcase1047, validity, [~c v ~c v a v b, ~b, ~a, b, c v ~b v a v ~a], 2000, count(0)).
tests(small_testcase1048, validity, [~b v ~c v b v ~a, a, b v ~a, c v ~c, c v c v ~c v c], 2000, count(2)).
tests(small_testcase1049, validity, [~c v ~a v c, ~b v ~c v c, ~b v c v ~c v b, ~a, c], 2000, count(2)).
tests(small_testcase1050, validity, [~a v ~a, ~a v b v ~b v ~c, c v ~c v ~a, c v ~b v ~a v b, c v ~b v b v a], 2000, count(4)).
tests(small_testcase1051, validity, [~b v b v b, ~b v c, a v ~b, a v a, b], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase1052, validity, [~a, a v b v c v b, b v ~b v ~a v ~b, c v ~a v ~a v ~b], 2000, count(3)).
tests(small_testcase1053, validity, [~c v c v ~a, b, b v ~a v ~b, c v ~a, c v b v ~a v ~a], 2000, count(3)).
tests(small_testcase1054, validity, [~b v c v c, ~a v a v ~b v ~b, ~a v b v c, a v c v b v c, c], 2000, count(4)).
tests(small_testcase1055, validity, [~c v ~b, ~b v c, ~a v a, ~a v c v b v ~c, b], 2000, count(0)).
tests(small_testcase1056, validity, [~c, ~c v ~b v ~c, ~a v b, b v ~b v ~c v ~a, c v b], 2000, count(2)).
tests(small_testcase1057, validity, [~c, b, c v ~c, c v ~a, c v c v c v ~a], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase1058, validity, [~c v ~c, ~c v ~a v c, ~c v c v c, ~b, a v ~b v b], 2000, count(2)).
tests(small_testcase1059, validity, [~c v c v ~c v a, a v ~b v a, a v c v b, a v c v c v ~b, c], 2000, count(3)).
tests(small_testcase1060, validity, [~a v ~c v ~a v c, ~a v ~a v a, a, a v c, b v a v a v ~b], 2000, count(4)).
tests(small_testcase1061, validity, [~a v ~a v a v c, a, a v ~b, b v c, c v c v ~a], 2000, count(2)).
tests(small_testcase1062, validity, [~c, ~b, b, c v b, c v b v c], 2000, count(0)).
tests(small_testcase1063, validity, [~c, ~b v ~b v a v ~b, ~b v a v ~c, a v ~b, c], 2000, count(0)).
tests(small_testcase1064, validity, [~c v a v b v a, ~a v c, a, b, b v b v b v b], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase1065, validity, [~c, ~c v b v ~c, ~c v c, a v ~c v a v b, b], 2000, count(2)).
tests(small_testcase1066, validity, [~b, ~b v b v ~a, ~a, ~a v a v ~c v a, c v a v a], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase1067, validity, [~c v a, a v b, b, c], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase1068, validity, [~c, ~c v ~c v ~a, ~c v a v a, ~a v b v ~a v a, c v b], 2000, count(2)).
tests(small_testcase1069, validity, [a v a v ~a, b, c v ~c, c v b], 2000, count(4)).
tests(small_testcase1070, validity, [~a v ~b v ~c v b, b v ~c v a v c, b v a v ~b v ~b, b v a v ~a v b, c v ~a v ~a v c], 2000, count(6)).
tests(small_testcase1071, validity, [~c v b v ~b v ~b, ~c v b v b, ~b v ~b, ~b v a, c v c], 2000, count(0)).
tests(small_testcase1072, validity, [~c, ~c v a v ~c v a, ~a v b v c, a v ~a, c v ~c], 2000, count(3)).
tests(small_testcase1073, validity, [~c v ~c, ~b v ~b v a, a v ~a, b v ~a v b v ~b, c v ~c], 2000, count(3)).
tests(small_testcase1074, validity, [~c v b, ~a, ~a v c v ~c, a, c v c v ~c], 2000, count(0)).
tests(small_testcase1075, validity, [~c v ~a, ~b v ~b v b, b v ~c, c v b v a v b, c v c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase1076, validity, [~c, ~b v ~a v a v a, c v ~c v ~b, c v b, c v b v ~c v ~a], 2000, count(2)).
tests(small_testcase1077, validity, [~a v b v ~c v b, a, a v a v a v ~a, b v ~c v ~c, c v c], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase1078, validity, [~c, ~c v ~a v b v c, ~b, a, c v ~c v ~a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase1079, validity, [~b v a, ~b v b v a, ~a v ~a v ~a v c, a v a v b v ~b, a v b v ~c v c], 2000, count(4)).
tests(small_testcase1080, validity, [~c v c v a, ~b, a v c v ~b v ~c, b, b v ~b v ~c], 2000, count(0)).
tests(small_testcase1081, validity, [~c v ~b, ~a v ~c v b v ~c, a, b, c v ~a v ~c], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase1082, validity, [~b v ~c, ~b v a, b v ~b v b, c, c v ~b v c v ~a], 2000, count(2)).
tests(small_testcase1083, validity, [~c v ~c, ~b, c], 2000, count(0)).
tests(small_testcase1084, validity, [~b v ~a, ~b v a, ~a, b, c v c v b v c], 2000, count(0)).
tests(small_testcase1085, validity, [~c, ~b v ~c v ~a, ~a v ~b v ~a, a, a v ~b v a v ~b], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase1086, validity, [~c v ~a v ~a, ~c v b v ~b, ~a v ~b v c v a, a v ~b v c, a v c], 2000, count(4)).
tests(small_testcase1087, validity, [~c v ~b v b v ~b, ~b v a v ~b, ~a, ~a v ~c v ~c, b v ~c v ~c v a], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase1088, validity, [~c v b v ~a, ~b, ~a v ~c v a v ~b, ~a v a v b v ~a, c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase1089, validity, [~c v a v ~b v ~a, ~a v ~c v b, ~a v a v ~a v b, a v ~b v ~b v b, b], 2000, count(4)).
tests(small_testcase1090, validity, [~c, ~c v ~c v c v ~b, ~c v a v a, a v c v c v b, b v c v c], 2000, count(2)).
tests(small_testcase1091, validity, [~c v ~b, ~c v ~b v ~c, ~a v b v ~c v ~c, ~a v c v ~c v ~a, b v ~a v ~a], 2000, count(4)).
tests(small_testcase1092, validity, [~b v ~b, ~a v c, a v b v ~b, b v ~b v a v ~a, c v c v ~b v ~a], 2000, count(3)).
tests(small_testcase1093, validity, [~b v ~c v a, ~a v c v ~c, a, a v c, c], 2000, count(2)).
tests(small_testcase1094, validity, [~b v ~a, ~a v a v ~c, a, b], 2000, count(0)).
tests(small_testcase1095, validity, [a, b, b v b v ~a v a, c, c v ~a v ~c v c], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase1096, validity, [~c v ~c, ~b v ~b, ~b v ~b v ~a, b, b v ~a v c], 2000, count(0)).
tests(small_testcase1097, validity, [~c, ~c v ~c v b, ~c v c, ~b v ~a v a v ~b, c v ~a], 2000, count(2)).
tests(small_testcase1098, validity, [~c, ~a v ~a, c v ~b, c v ~b v ~a v ~a], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase1099, validity, [~c v b, ~a v a v c, ~a v b v ~b v b, b v ~a, c], 2000, count(2)).
tests(small_testcase1100, validity, [~b v ~b v ~c v ~c, ~a v ~b v ~b, ~a v ~a v a, a v c v ~a v ~b, c v ~b], 2000, count(4)).
tests(small_testcase1101, validity, [~b v c, ~a v ~a, ~a v b, b v b v b v ~c], 2000, count(2)).
tests(small_testcase1102, validity, [~b, ~b v c v ~a, ~a v ~b v c, a v ~b, b v ~b], 2000, count(4)).
tests(small_testcase1103, validity, [~b, ~b v ~a, ~b v c v ~a v a, ~a v ~a v c, c v b v c], 2000, count(2)).
tests(small_testcase1104, validity, [~c v ~c v b, ~a v ~b v a, ~a v a v c v ~a, a, b v ~a v ~b], 2000, count(3)).
tests(small_testcase1105, validity, [~c v ~a, ~c v b, ~b, a v ~b, b v b v ~b], 2000, count(2)).
tests(small_testcase1106, validity, [~c v ~c, ~b v ~c v c, ~b v a v c, a v ~a v ~c v b, c v ~a], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase1107, validity, [~b v ~b, ~a v b, a, b, b v ~a v ~c], 2000, count(0)).
tests(small_testcase1108, validity, [~c v c v ~c v a, a, b v c v ~b v c, c v ~c v a, c v ~a v b v c], 2000, count(3)).
tests(small_testcase1109, validity, [~c, ~c v a v c v ~c, ~a v a v b, c v ~b v c v c], 2000, count(2)).
tests(small_testcase1110, validity, [~c v ~c v ~b v c, ~b v ~c v ~b v c, ~b v ~b v ~c, ~b v a v ~b, c v a v c v ~c], 2000, count(5)).
tests(small_testcase1111, validity, [~c v ~c v ~b v c, ~b v ~b v ~a, ~b v b, a, b v ~b v ~b v ~b], 2000, count(2)).
tests(small_testcase1112, validity, [~b v ~b, ~a, ~a v c v ~a v b, a, c v a v ~a], 2000, count(0)).
tests(small_testcase1113, validity, [~b, ~b v b v ~c, ~b v c v b, b, b v ~c v ~a], 2000, count(0)).
tests(small_testcase1114, validity, [~c v ~b, ~a v c v c v c, a, b v ~a v ~a, c], 2000, count(0)).
tests(small_testcase1115, validity, [~c v b v ~b, ~c v c v ~b, ~a v a v a v ~c, ~a v c, a v ~a v a v ~c], 2000, count(6)).
tests(small_testcase1116, validity, [~c v ~a, ~a, ~a v ~b v a v ~b, ~a v b v ~c, b v a v b v c], 2000, count(3)).
tests(small_testcase1117, validity, [~a v a v ~b, ~a v c, a, a v c v ~b v a, c v ~b v a v ~b], 2000, count(2)).
tests(small_testcase1118, validity, [~b v ~b, ~a v ~b v c v b, a, a v b v c, a v c], 2000, count(2)).
tests(small_testcase1119, validity, [a v ~a v c, a v b v ~a v ~b, b v ~b, b v a], 2000, count(6)).
tests(small_testcase1120, validity, [~a v ~c v a v ~a, ~a v c, a, c v ~c v a v b, c v ~a v c], 2000, count(2)).
tests(small_testcase1121, validity, [~c v c, ~a v ~b v c v ~b, b, b v c v ~b, c v ~b v a], 2000, count(2)).
tests(small_testcase1122, validity, [~c, ~c v a, ~b v a, ~a v ~c v a v ~c, c v ~c v ~b v c], 2000, count(3)).
tests(small_testcase1123, validity, [~c v ~b v ~c, ~b v a v a v a, c v a, c v b], 2000, count(3)).
tests(small_testcase1124, validity, [~c v ~b v b, ~a, a, a v c v c, c], 2000, count(0)).
tests(small_testcase1125, validity, [~c, ~c v ~b v b, ~a v a, ~a v b, b v ~a v ~b v ~b], 2000, count(3)).
tests(small_testcase1126, validity, [~b v c v b, ~a v b, a, b v ~a v c v ~a], 2000, count(2)).
tests(small_testcase1127, validity, [~c v ~a, ~b v c v a, ~a v ~c v b, b v a, c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase1128, validity, [b, b v ~a v ~b, b v ~a v c, b v b, c], 2000, count(2)).
tests(small_testcase1129, validity, [~b v ~a, ~b v a v ~c, b, b v ~b v ~b v ~b, c], 2000, count(0)).
tests(small_testcase1130, validity, [~a v a v c, a v a v ~b, a v a v b v b, b v ~c, c v b], 2000, count(2)).
tests(small_testcase1131, validity, [~c v b v ~c, ~a v ~b, a v a v ~a v ~a, b, c v ~a v ~a v ~b], 2000, count(2)).
tests(small_testcase1132, validity, [~c, ~a, a v ~c, b, c], 2000, count(0)).
tests(small_testcase1133, validity, [~c v a v c v ~a, ~b v ~c, ~a v ~c v b, ~a v c v b v ~a, b], 2000, count(2)).
tests(small_testcase1134, validity, [~b, ~b v ~a v ~c, a v ~c v ~a, a v ~a v ~c, b], 2000, count(0)).
tests(small_testcase1135, validity, [a v ~a v b v ~a, b v ~c, b v ~b, b v b, b v b v a], 2000, count(4)).
tests(small_testcase1136, validity, [~c v b v ~b v ~c, ~a v a, a, b v ~b v ~b v c, b v c v b v ~b], 2000, count(4)).
tests(small_testcase1137, validity, [~c v ~c v ~c v b, ~c v ~c v ~a v b, ~b v a v a v a, ~b v b v c v ~a, b v b], 2000, count(2)).
tests(small_testcase1138, validity, [~a v b v ~c v c, ~a v b v ~a, ~a v c v ~c, a, b v b], 2000, count(2)).
tests(small_testcase1139, validity, [~c, ~c v b v a, ~a v ~a, a v ~c v ~b v c, c v a v ~c v ~c], 2000, count(2)).
tests(small_testcase1140, validity, [~c v ~b v ~a v b, ~c v ~a, ~a v ~b v ~b, a v ~c, c v c v ~a], 2000, count(2)).
tests(small_testcase1141, validity, [~b v ~b v a v ~c, ~a v ~a, b v a v ~a v b, b v c, c v c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase1142, validity, [~b, ~a, a, c v ~c], 2000, count(0)).
tests(small_testcase1143, validity, [~c, ~a, a v ~b, b v c, c v b v ~c v ~b], 2000, count(0)).
tests(small_testcase1144, validity, [~c, ~b, ~b v a v ~a v a, ~a, b v ~c v b v c], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase1145, validity, [~b, a, a v a v b, c, c v ~c v ~b], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase1146, validity, [~a v ~c v ~a, ~a v ~a, a v ~c v a, a v ~b v b v a, c v ~c v ~a], 2000, count(2)).
tests(small_testcase1147, validity, [~c v ~c v b, ~c v ~b v ~c, ~c v c, ~b v a v b v a, a v b v ~b v ~a], 2000, count(4)).
tests(small_testcase1148, validity, [~a v ~c, a, a v b v c, c v ~a, c v c], 2000, count(0)).
tests(small_testcase1149, validity, [~c v b v ~b v b, ~a v c v ~c v ~b, ~a v c v b v ~b, a v ~b v ~a v ~c, c v b v ~a v c], 2000, count(7)).
tests(small_testcase1150, validity, [~c v ~b v a v ~c, ~c v ~b v c v ~c, a v ~a, b v a v a, c v ~b v ~a v ~a], 2000, count(4)).
tests(small_testcase1151, validity, [~c v b v c v a, ~b, ~a v ~c v a v ~a, ~a v ~a v c v ~a, ~a v b v ~b], 2000, count(3)).
tests(small_testcase1152, validity, [~b, a, b v ~a, b v b v c, c], 2000, count(0)).
tests(small_testcase1153, validity, [~b v ~a, ~b v b, b, c, c v ~b v ~c v a], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase1154, validity, [~b, a, a v ~b, a v b, c v ~a v ~b], 2000, count(2)).
tests(small_testcase1155, validity, [~c v ~a v a, ~a, ~a v ~a v a v ~b, b v ~b v ~b, c v ~c v b], 2000, count(4)).
tests(small_testcase1156, validity, [~b, a v ~b, b, c v ~b], 2000, count(0)).
tests(small_testcase1157, validity, [~c v ~a v c v ~c, ~b v ~c v ~c, ~a v c, c v ~c v a v ~a, c v ~b v a v b], 2000, count(4)).
tests(small_testcase1158, validity, [~c, ~c v c, ~a v b, b v ~a, c], 2000, count(0)).
tests(small_testcase1159, validity, [~b, a, a v ~b v ~a, b v c v ~b, c v ~c v a v b], 2000, count(2)).
tests(small_testcase1160, validity, [~c v ~b v ~b v ~c, a v ~c v c v b, a v a, b v a v ~b v ~c, c v ~b v ~b], 2000, count(2)).
tests(small_testcase1161, validity, [~c v ~a v ~a, ~c v b v c, ~a v ~a v ~c, a v c, b v c v ~a v a], 2000, count(4)).
tests(small_testcase1162, validity, [~b, b, b v a, c v ~c v ~b], 2000, count(0)).
tests(small_testcase1163, validity, [~c v c v ~c v b, ~b v ~c v ~a v a, ~b v ~c v c, ~a v ~c, ~a v ~c v a v ~b], 2000, count(6)).
tests(small_testcase1164, validity, [~c v ~a v ~c v ~a, ~a v b, a v b v a, b v ~b v ~c v ~c, c v ~c v c v ~b], 2000, count(3)).
tests(small_testcase1165, validity, [~c v c, a, b v ~b v ~c, c, c v c], 2000, count(2)).
tests(small_testcase1166, validity, [~c v b, ~c v b v ~b, ~b v a v ~a v b, b v ~c v ~c, c v c], 2000, count(2)).
tests(small_testcase1167, validity, [~c v ~c v ~a, ~a v ~c, a v a v c v c, c], 2000, solution([(a, f) ,(c, t)])).
tests(small_testcase1168, validity, [~a v a v ~a, a, a v c v b v b, b v ~b v ~c, c v ~a], 2000, count(2)).
tests(small_testcase1169, validity, [~b, ~b v ~a, ~b v c v ~b, ~a, a], 2000, count(0)).
tests(small_testcase1170, validity, [~c v ~c, ~c v ~a v ~a v c, ~b v c, ~a v ~b v b, a v ~c v b v c], 2000, count(2)).
tests(small_testcase1171, validity, [a, a v ~a v a, b, b v c v ~c, c], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase1172, validity, [~c v ~b v ~c, ~b, b v ~b v ~c v ~b, b v ~b v ~b, c], 2000, solution([(b, f) ,(c, t)])).
tests(small_testcase1173, validity, [~c v ~b v ~c v a, ~b, a, b v a v b v ~b, b v c v ~c v b], 2000, count(2)).
tests(small_testcase1174, validity, [~b, ~a v ~c v b, a v c v c v a, b], 2000, count(0)).
tests(small_testcase1175, validity, [~b v b v ~a v b, a v a v c, a v c v ~b v ~a, b, c], 2000, count(2)).
tests(small_testcase1176, validity, [~c v a v b, ~b, a v a v a v a, c v ~b v b v a, c v ~a], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase1177, validity, [~b v ~c, ~a v a v ~a, a, b v ~b v ~b v ~c, b v c v ~c], 2000, count(3)).
tests(small_testcase1178, validity, [~c, ~c v ~b v a, ~b v b v ~b, ~a v a, a v ~b v ~c], 2000, count(4)).
tests(small_testcase1179, validity, [~c, ~c v ~a v a v b, ~c v a v ~a v c, b v ~b, c], 2000, count(0)).
tests(small_testcase1180, validity, [~b v a v ~b v c, ~a v ~b, a v c v ~c v c, b v c v ~b, c], 2000, count(3)).
tests(small_testcase1181, validity, [~c, ~b v c v ~b, ~a v ~c v ~c v ~c, ~a v ~c v ~c v a, c v ~c v ~a], 2000, count(2)).
tests(small_testcase1182, validity, [~c, ~c v ~b v b v c, ~c v ~a, a, b v a], 2000, count(2)).
tests(small_testcase1183, validity, [~b, ~b v ~a, a v ~a v ~c v ~b, c v ~a v ~c, c v c v c v c], 2000, count(2)).
tests(small_testcase1184, validity, [~c v a, ~a v c v c v ~b, a, a v ~a v b, c v ~a], 2000, count(2)).
tests(small_testcase1185, validity, [~c, ~c v a, a, b v ~a v c v ~c, c v ~b], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase1186, validity, [~c, ~c v ~b, b, b v ~c v a v c], 2000, count(2)).
tests(small_testcase1187, validity, [~c v c, ~b v ~b v c v c, ~a v c, a v b v ~c, a v b v a v ~c], 2000, count(4)).
tests(small_testcase1188, validity, [~c, ~b v ~c v ~c, ~a v ~a v a v c, a v a v ~c, a v c v b], 2000, count(3)).
tests(small_testcase1189, validity, [~a v ~a v c v c, a v a v ~a v c, a v a v c, a v c v c, b v a v c], 2000, count(4)).
tests(small_testcase1190, validity, [~c, ~c v ~c v ~c v ~b, ~c v ~c v c v ~c, ~c v c v ~c, c v b v a], 2000, count(3)).
tests(small_testcase1191, validity, [~a v c, a v ~a v ~a, b v ~c v a, b v a v c v a, c v ~a], 2000, count(4)).
tests(small_testcase1192, validity, [~c, ~b v ~a v ~a v ~a, ~a v ~a v ~a, a, c v b], 2000, count(0)).
tests(small_testcase1193, validity, [~b v ~c v c, ~a v ~c v ~c v c, ~a v ~a v ~c, ~a v c v ~c, b v a v ~c v b], 2000, count(5)).
tests(small_testcase1194, validity, [~c v a, ~b v ~b v b, ~b v c, a v a v ~c, c v b v a v ~b], 2000, count(4)).
tests(small_testcase1195, validity, [~c, ~b v c v b v c, ~a, a v c v a v b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase1196, validity, [~c v b v b v ~c, ~b v a v ~c v ~a, ~a, ~a v b v a, a], 2000, count(0)).
tests(small_testcase1197, validity, [~c v b v b, ~b, ~b v ~a v ~a v ~a, ~b v a, b v ~c v a v ~c], 2000, count(2)).
tests(small_testcase1198, validity, [~a v ~b v ~b, ~a v ~a v b, ~a v b v c v a, a v b, c v ~c v c v b], 2000, count(2)).
tests(small_testcase1199, validity, [~c v a v ~a, ~a, b, b v ~a, c v ~c], 2000, count(2)).
tests(small_testcase1200, validity, [~b v ~c, ~b v ~b v a, ~a v a, ~a v c v ~c v ~c, a v ~c v ~b v c], 2000, count(5)).
tests(small_testcase1201, validity, [~b v ~b, ~a v b v ~b v b, a, b v ~a v c v ~c, b v a v ~b v c], 2000, count(2)).
tests(small_testcase1202, validity, [~b v a v a v b, a v ~a v ~c v b, b v c v b v ~c, c v ~c v c v ~a, c v a v ~b], 2000, count(7)).
tests(small_testcase1203, validity, [~c, ~b v ~c, a v ~c v ~a, a v ~b v a v c, c v a], 2000, count(2)).
tests(small_testcase1204, validity, [~c, ~b v ~a, ~a v ~a, a, a v a v c], 2000, count(0)).
tests(small_testcase1205, validity, [~c v a v ~c, ~b v b v ~b, a v ~b v b, b v ~a v a v b, c v ~a v c], 2000, count(4)).
tests(small_testcase1206, validity, [~c v ~c v b, ~b, b, b v ~b, c], 2000, count(0)).
tests(small_testcase1207, validity, [~c v c v ~b v ~b, ~b v a, ~b v a v b, a, b v ~c], 2000, count(3)).
tests(small_testcase1208, validity, [~c v ~a, ~b, ~a v c, a v ~b v a v ~b, c v b v ~c], 2000, count(2)).
tests(small_testcase1209, validity, [~b v a v a v ~c, b v ~b, b v a v ~a v b, b v c, c], 2000, count(3)).
tests(small_testcase1210, validity, [~b v c v ~a, ~a v ~b, ~a v ~b v ~b, ~a v a, c v a v a], 2000, count(4)).
tests(small_testcase1211, validity, [~b, ~b v a v ~c v ~a, b, b v a v ~b, c], 2000, count(0)).
tests(small_testcase1212, validity, [~b v b v ~b, a, b v ~b v b v ~b, c v ~b v ~b], 2000, count(3)).
tests(small_testcase1213, validity, [~b v ~c v b v a, ~b v b v c, ~a v ~a v c v ~b, a v c v c, b v ~a], 2000, count(3)).
tests(small_testcase1214, validity, [~c v c v ~a v ~a, ~b v b v c, a v ~c v ~c v b, b v ~b v b, c], 2000, count(3)).
tests(small_testcase1215, validity, [~c v ~a, ~c v ~a v a v ~c, ~a v a v a v a, a v ~c v ~a v ~c, b], 2000, count(3)).
tests(small_testcase1216, validity, [b v ~b v c v ~b, b v a v ~c, b v a v ~a, b v c v c v a, c v a v c v ~b], 2000, count(5)).
tests(small_testcase1217, validity, [~b, ~b v ~c v ~b v ~c, ~a v a v ~a, b v ~c, c v ~a], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase1218, validity, [~a, b, b v ~c v b, b v a, b v a v a v ~c], 2000, count(2)).
tests(small_testcase1219, validity, [~c, ~a v ~b, a v ~c v b v b, b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase1220, validity, [~c v a, ~b v ~b v b, ~a v ~a, a v b v ~a, c v b v ~a], 2000, count(2)).
tests(small_testcase1221, validity, [~c, ~b v ~c v b, ~b v ~b, b v ~a v c v c, c v a v ~b v b], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase1222, validity, [~c v a, ~a v ~c, ~a v ~a, a v ~b v ~a v ~c, a v a v ~c v b], 2000, count(2)).
tests(small_testcase1223, validity, [~b, b, c v ~b, c v ~b v ~c, c v ~a], 2000, count(0)).
tests(small_testcase1224, validity, [~c v a v ~a, ~a v ~b v c, b v a v ~c v ~c, b v c v b, c], 2000, count(3)).
tests(small_testcase1225, validity, [~c v b v ~b, ~a v a v ~a, c, c v ~c, c v b v ~c v c], 2000, count(4)).
tests(small_testcase1226, validity, [~c v c v b, ~a v b, a v a, b v ~b v ~c v ~a, b v a], 2000, count(2)).
tests(small_testcase1227, validity, [~a v a, ~a v b v ~a v ~c, b, b v b v a, c v c], 2000, count(2)).
tests(small_testcase1228, validity, [~b v c v b v ~c, a v b v ~a, b, b v c v ~b, c v ~c v ~a v b], 2000, count(4)).
tests(small_testcase1229, validity, [~b, ~a v c v ~c, a, b v ~c, b v a v c], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase1230, validity, [~b v a v ~b v a, ~a v ~b, c, c v ~a v a v ~a, c v c], 2000, count(2)).
tests(small_testcase1231, validity, [~c v b, b v ~b, c], 2000, solution([(b, t) ,(c, t)])).
tests(small_testcase1232, validity, [~c v ~c, ~b, ~b v b v ~a, c v ~a], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase1233, validity, [~c, ~c v ~a v b, a v ~b v c v a, b, c v ~b v ~c v ~a], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase1234, validity, [~b v ~c v a, ~b v ~c v a v ~a, b, c, c v b v ~a], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase1235, validity, [~c v ~c v ~b v ~c, ~b, ~b v a v b v b, ~a v c v a v c, b v ~b v ~c], 2000, count(4)).
tests(small_testcase1236, validity, [~c, ~c v a v ~c v a, ~b v ~b v b v ~b, ~a, b v b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase1237, validity, [~c v ~c, ~c v ~a v b, ~c v a v a, a v a v ~b v ~c], 2000, count(4)).
tests(small_testcase1238, validity, [~c v b v a v a, a, b v ~c, b v ~b v ~c, b v ~a v ~a v ~a], 2000, count(2)).
tests(small_testcase1239, validity, [~c v c v a v a, ~b v ~a v c v c, ~a, b v ~c, b v b v c], 2000, count(2)).
tests(small_testcase1240, validity, [~c v ~a v ~c, ~b v ~c v ~a v b, ~b v ~a v a v b, a v c v a, a v c v a v b], 2000, count(4)).
tests(small_testcase1241, validity, [~b v ~a v ~b, a, b v a v ~c, c, c v a v a], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase1242, validity, [~b v c, ~a v ~b, ~a v c v ~c v c, a v ~b v a v a, b], 2000, count(0)).
tests(small_testcase1243, validity, [~c, ~c v c, ~a, b v ~a, c v ~a v ~b v c], 2000, count(2)).
tests(small_testcase1244, validity, [~b v ~c, ~a v ~a v ~b, a v ~c v ~a, a v a v c, c v c v b v a], 2000, count(3)).
tests(small_testcase1245, validity, [~c v b, ~b v a v ~b v ~c, b, c v ~b v b], 2000, count(3)).
tests(small_testcase1246, validity, [~b v ~a, a, a v a v b, a v b v ~a, c v a v a], 2000, count(2)).
tests(small_testcase1247, validity, [~a v ~b, a v c v c v c, b, b v ~b v ~b, b v ~a], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase1248, validity, [~b v ~c, a v ~c, a v ~b, b v ~c v b, c], 2000, count(0)).
tests(small_testcase1249, validity, [~b v ~c v a, ~b v a v ~c, ~a, b v b, b v c v b v ~b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase1250, validity, [~b v ~b v c v c, ~a v c v ~a, a v a v c v ~b, b v ~a v c v ~a, b v a], 2000, count(3)).
tests(small_testcase1251, validity, [~c v ~b v a v a, ~b, ~a, b v ~c v ~c, c v b], 2000, count(0)).
tests(small_testcase1252, validity, [~c v ~a, ~a v b, a, b, b v ~c v ~c v ~a], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase1253, validity, [~c v a, ~a v a, b v ~c v ~c v b, b v b v ~a, b v b v b], 2000, count(3)).
tests(small_testcase1254, validity, [~b v c v ~b v a, ~a v ~a v ~b, a v c, b v ~b v c, c v ~c], 2000, count(4)).
tests(small_testcase1255, validity, [~c, ~b v ~c v ~c v ~c, ~a v a, a v ~c, b], 2000, count(2)).
tests(small_testcase1256, validity, [~b v c v ~c, ~a, ~a v c, a v c v ~b, c], 2000, count(2)).
tests(small_testcase1257, validity, [~b v ~c v ~a, ~b v ~a, ~a v ~c v b v a, ~a v c v a v a, c v a], 2000, count(4)).
tests(small_testcase1258, validity, [~c v ~c v ~a v ~a, a, a v a v b, b], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase1259, validity, [~b v ~c v ~a, ~a, a v b v b v b, c, c v ~c v b], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase1260, validity, [~a v ~b, ~a v ~a, ~a v ~a v ~b v ~c, a, c v a v c v ~c], 2000, count(0)).
tests(small_testcase1261, validity, [~c v b, ~a, a, a v a], 2000, count(0)).
tests(small_testcase1262, validity, [~b, a, a v ~b, b v ~c, b v c v ~a], 2000, count(0)).
tests(small_testcase1263, validity, [a v ~b v a, b v ~c v c, b v ~a, b v a v ~c v c, c v a v b v a], 2000, count(3)).
tests(small_testcase1264, validity, [~c v b v ~c v a, ~b v ~c, a v ~a v ~c, b v ~b v a v ~c, c v ~b], 2000, count(3)).
tests(small_testcase1265, validity, [~c v ~c, ~a v ~c v c, a, a v c v ~b, b v a], 2000, count(2)).
tests(small_testcase1266, validity, [~b, ~a, ~a v ~c v b, a, b], 2000, count(0)).
tests(small_testcase1267, validity, [~c v ~b v a, ~c v ~a v b, ~c v b v ~c v ~c, ~b v ~b v a v c, ~b v c v c], 2000, count(3)).
tests(small_testcase1268, validity, [~c, ~c v a v ~a, ~b v a v b, a v c v b, b], 2000, count(2)).
tests(small_testcase1269, validity, [~c, ~c v a, ~b v b, a, a v ~b v ~b v c], 2000, count(2)).
tests(small_testcase1270, validity, [~c v ~c, ~a, ~a v b v b, b, c v ~a], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase1271, validity, [~a v a, a v c v a v a, c, c v ~c v ~a v ~b, c v ~a v a v b], 2000, count(4)).
tests(small_testcase1272, validity, [~c v ~a v b v a, ~c v a v a, ~a v a, b v ~b v ~a v ~b, c v ~b], 2000, count(4)).
tests(small_testcase1273, validity, [~b, ~b v ~c, a, b v a, c], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase1274, validity, [~c v b v a v a, ~b v ~c v ~a v ~c, ~b v ~c v ~a v c, a, a v b v ~a v a], 2000, count(3)).
tests(small_testcase1275, validity, [~c v ~a v ~c v b, ~a v a, a, b v ~b v ~c v ~b, b v b], 2000, count(2)).
tests(small_testcase1276, validity, [~c v ~c v a v b, ~c v c v ~b v b, ~b v c v ~c, ~a, a], 2000, count(0)).
tests(small_testcase1277, validity, [~c v ~b v ~c, a v ~a v ~c v b, a v c v ~b, b v a, b v c], 2000, count(2)).
tests(small_testcase1278, validity, [~c v ~b, ~a v a v ~c, a v ~a v a v a, a v b v ~c v ~c, b v ~b v ~c v ~b], 2000, count(5)).
tests(small_testcase1279, validity, [~b v ~a v ~c, ~b v c v ~b, b, b v b v ~a], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase1280, validity, [~a v a v ~c v a, a v ~b v ~c v b, b, b v ~a v ~b, c v b v b v b], 2000, count(4)).
tests(small_testcase1281, validity, [~b v ~a, ~b v ~a v c v ~b, a v ~a v ~b v ~a, c v b, c v c v ~c v ~a], 2000, count(4)).
tests(small_testcase1282, validity, [~b v ~b v ~c v ~c, a v a v a, a v c v b v ~b, b v ~b v a v b, c v ~c v ~a v ~a], 2000, count(3)).
tests(small_testcase1283, validity, [~b, ~a v ~a v ~b v a, a v c v ~b v a, c, c v ~b], 2000, count(2)).
tests(small_testcase1284, validity, [~c v b v b v ~c, ~b v ~a v ~b v ~a, a v b, c v ~b, c v b v b], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase1285, validity, [~b, ~a, b, b v c, c v ~a v c v b], 2000, count(0)).
tests(small_testcase1286, validity, [~c, ~a, a v ~c, b v ~c, b v ~b v ~b v c], 2000, count(2)).
tests(small_testcase1287, validity, [~c, ~c v c v ~b v c, ~b, a v ~b, b v a v b v ~a], 2000, count(2)).
tests(small_testcase1288, validity, [~c v ~c v b, ~b v ~c v ~c v ~c, ~a, ~a v a v c, b v a v ~b v ~b], 2000, count(2)).
tests(small_testcase1289, validity, [~a v ~a v ~a, a, b, b v a, c], 2000, count(0)).
tests(small_testcase1290, validity, [~c, ~b, a v b v ~c v a, b v ~a v ~a, b v b v ~a], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase1291, validity, [~b v ~c v ~b, ~b v ~a v c, ~b v c v ~a v a, b v ~a v c v b, b v c v c], 2000, count(3)).
tests(small_testcase1292, validity, [~b v a v ~b v ~c, ~b v b, ~a, a v a v ~b, c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase1293, validity, [~c, ~c v ~b, a, a v ~a v ~b v b, c], 2000, count(0)).
tests(small_testcase1294, validity, [~c v ~a v ~a, ~c v b v ~b, ~b v b v ~b v c, ~a v b v ~c, c v c v ~c v ~b], 2000, count(6)).
tests(small_testcase1295, validity, [~b v ~c, b, c, c v ~a, c v a], 2000, count(0)).
tests(small_testcase1296, validity, [~c, ~b v ~a, ~a v a, a v c], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase1297, validity, [~c, ~a v c, a, b, b v a], 2000, count(0)).
tests(small_testcase1298, validity, [~c v c v c, b, b v a, b v c], 2000, count(4)).
tests(small_testcase1299, validity, [~c v ~c v ~a, ~c v ~b v ~a v ~a, ~b, ~b v b v ~b, b], 2000, count(0)).
tests(small_testcase1300, validity, [~c v c v b v ~a, a v ~c, b v b v a, b v b v b, c v ~b], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase1301, validity, [~a, ~a v b v b, b v b, b v b v c], 2000, count(2)).
tests(small_testcase1302, validity, [~b v ~b, b, b v ~a v ~b v b, c v ~b v a v a, c v ~b v c], 2000, count(0)).
tests(small_testcase1303, validity, [~b, a, b v ~b v ~a, c, c v c], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase1304, validity, [~b, ~a v ~a, ~a v a, b, b v c v ~c v c], 2000, count(0)).
tests(small_testcase1305, validity, [~a v c v b v ~b, a v c v b v ~b, b v ~c v ~c v b, b v ~c v ~a v a, c v b v c], 2000, count(4)).
tests(small_testcase1306, validity, [~b v b v ~b v a, a, b v a v b v ~c, c v a v ~c], 2000, count(4)).
tests(small_testcase1307, validity, [~c v c v ~a v ~a, a v ~c v ~b, b v ~a v ~c, b v ~a v c v b, c v ~c], 2000, count(5)).
tests(small_testcase1308, validity, [~a v ~a v c, ~a v b v b, b v ~a, c, c v c v ~b], 2000, count(3)).
tests(small_testcase1309, validity, [~c, ~c v ~a v a, ~a v ~a v ~b v b, ~a v a, b], 2000, count(2)).
tests(small_testcase1310, validity, [~b v ~c v ~a v ~a, ~b v a v ~b, ~a, a v b, b], 2000, count(0)).
tests(small_testcase1311, validity, [~a, ~a v ~a v ~b v b, ~a v c v b, a v b v c, a v c v c], 2000, count(2)).
tests(small_testcase1312, validity, [~c, ~b v ~b, ~b v ~a v b, ~b v a, a v ~b v ~b], 2000, count(2)).
tests(small_testcase1313, validity, [~c, ~c v ~c, ~c v c, ~b v ~b v ~a v ~b, ~a], 2000, count(2)).
tests(small_testcase1314, validity, [~b v ~a v ~a, ~a, ~a v ~c, ~a v a, b v c], 2000, count(3)).
tests(small_testcase1315, validity, [~c v c, ~b v ~c, c, c v ~a v ~c v ~b], 2000, count(2)).
tests(small_testcase1316, validity, [~a, a, a v ~b v ~c v ~c, b v ~c, b v ~b v a], 2000, count(0)).
tests(small_testcase1317, validity, [~a v c v ~c v a, a v ~b v b, b v c v ~b v a, c, c v ~b v ~c v b], 2000, count(4)).
tests(small_testcase1318, validity, [~c v b v ~a, ~c v c v b, ~b v ~a v b v a, a v ~a v ~a, c], 2000, count(3)).
tests(small_testcase1319, validity, [~c, ~a, a, b v ~c, b v a], 2000, count(0)).
tests(small_testcase1320, validity, [~b, ~a v ~c v b, a v c, c v c v c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase1321, validity, [~b v ~c v ~c v ~a, ~b v c, a v a v ~b, b v c v c, c v ~a v a], 2000, count(2)).
tests(small_testcase1322, validity, [~c v ~b, ~b v ~b v c, ~a v ~a v ~c v ~b, b v a v a, c], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase1323, validity, [~c v ~c v ~a v ~c, ~b v c v c, ~a v c, a v b v b v b, c v c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase1324, validity, [~b v ~a v c v c, ~a v ~c v ~a v a, a v ~c, b v ~c, b v ~b v ~a], 2000, count(4)).
tests(small_testcase1325, validity, [~a, ~a v ~c v ~b, ~a v a v a v ~a, a, c v c v c v ~a], 2000, count(0)).
tests(small_testcase1326, validity, [~b, ~a v ~a v ~b v a, a, a v ~a, a v c], 2000, count(2)).
tests(small_testcase1327, validity, [~c v b v ~b v c, ~c v c v ~c, ~b v ~b, b, b v b v ~a], 2000, count(0)).
tests(small_testcase1328, validity, [~b v ~c v c v c, ~b v c v c v a, ~a v ~c, a v a v ~c v ~a, c v ~c v c v a], 2000, count(5)).
tests(small_testcase1329, validity, [~b, ~b v c v ~a, a v ~a v ~c, a v b v ~b, b v c], 2000, count(2)).
tests(small_testcase1330, validity, [~c v c v c, ~a v a, b v ~b, b v ~b v c v c, c], 2000, count(4)).
tests(small_testcase1331, validity, [~a v c v a, b v ~c v a v ~c, b v ~b, c v a v ~b, c v c], 2000, count(3)).
tests(small_testcase1332, validity, [~b v a v ~a v ~c, ~a, a v a v ~c v a, b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase1333, validity, [~c v a, ~b, ~a v ~a v ~c, a, b v a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase1334, validity, [~c v c, ~b v a, b, b v ~b v ~b v c, b v b v c], 2000, count(2)).
tests(small_testcase1335, validity, [~c v ~c, ~c v a, ~b v ~b v a, ~b v a v b, ~b v b v ~c v a], 2000, count(3)).
tests(small_testcase1336, validity, [~b v ~b, ~b v b v ~b v ~c, a v b v b v a, c v ~c v ~c v ~a, c v c v c v ~b], 2000, count(2)).
tests(small_testcase1337, validity, [~c v ~a v c v a, ~c v a, ~b v a, ~a v c v ~c, b], 2000, count(2)).
tests(small_testcase1338, validity, [~a v ~a v a v b, ~a v b, ~a v c v b, a v ~c, c v b], 2000, count(3)).
tests(small_testcase1339, validity, [~c v c v ~b, ~b v ~c v b, ~b v c, ~a v a v a, ~a v b v c v ~a], 2000, count(5)).
tests(small_testcase1340, validity, [~c v a v b, ~c v c, ~b, ~b v c v c, ~a v ~b v ~c v ~b], 2000, count(3)).
tests(small_testcase1341, validity, [~b v a, ~b v a v ~b, ~a v ~c, a, c], 2000, count(0)).
tests(small_testcase1342, validity, [~b v ~b v ~a, a v a v c v c, b v a v ~b v a, b v c, c], 2000, count(3)).
tests(small_testcase1343, validity, [~b v ~b v ~c, ~b v c, a v ~a v c, c, c v a], 2000, count(2)).
tests(small_testcase1344, validity, [~c v ~c v ~b v ~c, ~c v a, ~c v c v ~b, ~c v c v b v a, ~b], 2000, count(3)).
tests(small_testcase1345, validity, [~c, ~b v ~b, b v ~b, c, c v a], 2000, count(0)).
tests(small_testcase1346, validity, [~b, a v ~b, a v a v c v ~b, b v b v ~c v c, c], 2000, count(2)).
tests(small_testcase1347, validity, [~c v ~b v ~b v ~a, ~c v ~a, ~c v b v ~a v ~b, ~b v c v ~c v a, c v ~b], 2000, count(4)).
tests(small_testcase1348, validity, [~c v ~c v b, ~c v b, ~a v ~b v a, a v ~a, b], 2000, count(4)).
tests(small_testcase1349, validity, [~b v ~a, ~a v ~c v ~a, b v ~a v ~b, b v b v c v ~a, c v ~a], 2000, count(4)).
tests(small_testcase1350, validity, [~c v b, ~c v b v ~b v c, ~b, c], 2000, count(0)).
tests(small_testcase1351, validity, [~a v ~c v ~a v c, ~a v ~c v b, a v b, c, c v b], 2000, count(2)).
tests(small_testcase1352, validity, [~c v c v b, ~a v ~b v c, a v ~b v ~c v b, a v a, a v c v ~c v ~a], 2000, count(3)).
tests(small_testcase1353, validity, [~c v c, ~c v c v ~c v a, a, c v b v ~b v ~c], 2000, count(4)).
tests(small_testcase1354, validity, [~c v ~b v a, ~b v a, b v a, c v ~b, c v a v ~a], 2000, count(3)).
tests(small_testcase1355, validity, [~c v ~a v ~a v a, a v ~b v ~a v ~a, a v b v ~c v ~b, b v ~b v c, c v c], 2000, count(4)).
tests(small_testcase1356, validity, [~c v ~a, ~a, b v ~c, b v ~b v ~b, c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase1357, validity, [a v b v ~b, b v a, c v ~b v a v ~b, c v ~a, c v ~a v ~c], 2000, count(3)).
tests(small_testcase1358, validity, [~c v ~b, ~c v ~a, ~b v ~c, ~b v a, b v b], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase1359, validity, [~a v a v ~b, b v a v ~a, c, c v ~a v ~c], 2000, count(4)).
tests(small_testcase1360, validity, [a v ~c v ~a, a v ~b v ~c v b, b v c v a, c v a, c v a v b v a], 2000, count(6)).
tests(small_testcase1361, validity, [~c v ~c v ~a v ~b, ~b v a v a v ~b, ~b v c v ~b, b], 2000, count(0)).
tests(small_testcase1362, validity, [~b v a v c, a v ~c, a v a v ~b v a, b, c], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase1363, validity, [~a v ~c v ~c v b, ~a v c v c, b, b v ~b v a v b, b v c], 2000, count(3)).
tests(small_testcase1364, validity, [~a v a v ~b, ~a v b v ~b, a v ~c, b v a v a v a, b v c], 2000, count(4)).
tests(small_testcase1365, validity, [~c v ~a, a v ~b, b, c v a v c v ~a, c v c v ~b v a], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase1366, validity, [~c v ~a, ~b v ~b v ~a, ~b v b v c, ~a, b v c v ~c v ~a], 2000, count(4)).
tests(small_testcase1367, validity, [~c v a v b, ~b, ~a v ~b v c, a v c v a v ~b, c], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase1368, validity, [~c, ~c v ~b v ~c, ~b v ~a, ~b v c v a, ~a], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase1369, validity, [~c, ~b, ~a, ~a v c v c, a v a v b], 2000, count(0)).
tests(small_testcase1370, validity, [~a v ~c v b v ~c, ~a v a, b v a v ~a, c v ~b, c v a], 2000, count(4)).
tests(small_testcase1371, validity, [~a v ~a, a, b v ~c v ~c, b v c v a], 2000, count(0)).
tests(small_testcase1372, validity, [~b v a v b, ~b v b v c v b, c], 2000, count(4)).
tests(small_testcase1373, validity, [b v b, c, c v b, c v c], 2000, solution([(b, t) ,(c, t)])).
tests(small_testcase1374, validity, [~c v ~c v b, ~b v c v a, b v ~b v b v ~b, c v ~c, c v a v b], 2000, count(4)).
tests(small_testcase1375, validity, [~a, ~a v a, ~a v c, b v ~b v a v ~b, c], 2000, count(2)).
tests(small_testcase1376, validity, [~c v b v c, ~b, ~a, a v ~b, b v c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase1377, validity, [~b v b, ~b v c v ~b, a, a v ~a v a, b v c v c v b], 2000, count(2)).
tests(small_testcase1378, validity, [a v ~c v ~b v ~a, b v ~c v a v ~c, b v a v ~a v ~a, c v b, c v c], 2000, count(3)).
tests(small_testcase1379, validity, [~c, ~b, ~b v ~a v ~b v c, a, a v ~a v ~a v a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase1380, validity, [a v ~c, b, b v ~b, b v a, b v b], 2000, count(3)).
tests(small_testcase1381, validity, [~a v ~c v ~c, ~a v b, b v ~b v ~a v ~c, b v ~a, c v ~c v ~b v b], 2000, count(5)).
tests(small_testcase1382, validity, [~b v a v ~a v a, ~b v c v ~c v a, ~a v b v b, a v ~b, c v ~b v c], 2000, count(3)).
tests(small_testcase1383, validity, [~c v ~b v b, ~c v a v c, a v ~c v ~a v ~b, a v b v a, c v b v b v ~b], 2000, count(6)).
tests(small_testcase1384, validity, [~b, ~a, a v ~c v ~b, a v ~c v a, b v ~b v c], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase1385, validity, [~a v ~b v ~c, ~a v c v b v ~a, b v ~a, b v c v a, c v ~a v ~c v ~c], 2000, count(4)).
tests(small_testcase1386, validity, [~c v ~b v ~c, ~c v ~b v ~c v ~c, ~c v c v a, b v ~a, c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase1387, validity, [~c v b v ~b, ~b, ~b v c v ~a, b v ~c v ~b, c], 2000, count(2)).
tests(small_testcase1388, validity, [~b v b, ~a, ~a v c, c v ~c v b], 2000, count(4)).
tests(small_testcase1389, validity, [~b v a v ~b, ~a v ~c v a, b v a, c v ~c v ~c v ~c, c v ~c v b v ~b], 2000, count(4)).
tests(small_testcase1390, validity, [~b v ~b, ~b v a, a, b v c v ~c, c v ~a v c], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase1391, validity, [~b v c v ~c v ~c, a v ~c v b v ~a, a v a v a, b, b v ~c v c], 2000, count(2)).
tests(small_testcase1392, validity, [~b v c, ~a v ~a v b v a, a, c v ~a], 2000, count(2)).
tests(small_testcase1393, validity, [~c, ~c v b, ~b v ~a, a v ~c v b v a, c v ~a v b v ~c], 2000, count(3)).
tests(small_testcase1394, validity, [~c v c, ~a, ~a v ~b, a v ~c], 2000, count(2)).
tests(small_testcase1395, validity, [~b v ~c v c, ~a v c v ~b v ~c, a v a, b, b v a], 2000, count(2)).
tests(small_testcase1396, validity, [~c v a v ~c, ~c v c, ~a v ~c v c, a v ~c v b v a, b v c v c v ~a], 2000, count(5)).
tests(small_testcase1397, validity, [~b v c v ~b, b v ~a v ~c, c v ~c v ~a v c, c v a v b v ~c, c v c v ~c v c], 2000, count(5)).
tests(small_testcase1398, validity, [~b v ~a v ~b v ~c, ~b v a v b, ~a, b, b v c v c v ~b], 2000, count(2)).
tests(small_testcase1399, validity, [~c v ~a v ~c, ~c v a v b, ~a v c v ~b v b, a, c v c v a], 2000, count(2)).
tests(small_testcase1400, validity, [~c, ~c v ~a v ~c, ~c v c v c, c v b v ~c v ~a], 2000, count(4)).
tests(small_testcase1401, validity, [~c, ~b v ~c v c v c, ~a v ~b v a, b v b v ~a v ~c, c v c v b], 2000, count(2)).
tests(small_testcase1402, validity, [~c, ~c v ~a v ~b, ~b, b, b v a v ~c], 2000, count(0)).
tests(small_testcase1403, validity, [~c v ~a v ~b v b, ~b v ~c v ~c, a v ~a, a v a v a v b, c v a v ~b], 2000, count(3)).
tests(small_testcase1404, validity, [~b, ~b v b v ~b v ~a, a, b, c v ~c v c v c], 2000, count(0)).
tests(small_testcase1405, validity, [~c, ~c v b, ~b, ~a v ~a v c, b], 2000, count(0)).
tests(small_testcase1406, validity, [~a, ~a v b, b v ~c v ~c v c, b v b v a v c], 2000, count(3)).
tests(small_testcase1407, validity, [~b, b, b v ~c, b v c, b v c v ~b], 2000, count(0)).
tests(small_testcase1408, validity, [~c v ~c, ~c v a v ~b, ~b v c, ~a v a v b v ~c, b v a v c], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase1409, validity, [~b v ~b v ~b, ~b v b v c, b v ~a v a v ~b, b v a, b v b v ~a v c], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase1410, validity, [~c, ~a v b, b v ~b, c v ~b v ~a, c v ~a], 2000, count(2)).
tests(small_testcase1411, validity, [~c v a v ~a v b, ~c v b v a v a, ~b v b v b, ~a v ~c v ~a, a v ~a], 2000, count(5)).
tests(small_testcase1412, validity, [~c v ~a, a v ~c, a v a v c v ~b, b v a v a, c v c v c v ~b], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase1413, validity, [~c v ~b v b, ~b, ~b v ~c, ~a v ~b v ~a, b v b], 2000, count(0)).
tests(small_testcase1414, validity, [~a v b, a v ~c, a v ~b, a v b v a v ~c, c v ~c v ~b v b], 2000, count(3)).
tests(small_testcase1415, validity, [~b v ~a, ~b v ~a v a v ~c, ~a v ~c, a v ~a v ~c, c v a v a], 2000, count(3)).
tests(small_testcase1416, validity, [~c v c, a v b v b, b v ~b v c v ~b, b v ~a v c v ~a, c], 2000, count(3)).
tests(small_testcase1417, validity, [~c v ~a, ~a v ~b v c v ~c, a v b v ~a v ~a, b v c, c], 2000, count(2)).
tests(small_testcase1418, validity, [~a v a v c, a v c v ~c, b v ~a, b v c v b, c], 2000, count(3)).
tests(small_testcase1419, validity, [~c v ~c v c v ~b, ~b v a, a v b, c], 2000, count(2)).
tests(small_testcase1420, validity, [~b v ~c v ~c v c, ~a v b v ~c, b v ~a v ~c, c v a v ~c v a, c v b v ~c v c], 2000, count(7)).
tests(small_testcase1421, validity, [~c, a, a v c v ~b v c, b], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase1422, validity, [~c v ~a, ~c v a v a, ~a, ~a v a v ~c v a, b v ~c v ~a], 2000, count(2)).
tests(small_testcase1423, validity, [~c v b, ~b v a v b v c, ~b v b v b, ~a v c, b v b v b v b], 2000, count(3)).
tests(small_testcase1424, validity, [~c, ~b v ~c, b v b, c, c v c v a], 2000, count(0)).
tests(small_testcase1425, validity, [~b v a, a v ~b v ~b v c, a v ~a v ~c, b v a v c v ~a, b v b v ~c], 2000, count(4)).
tests(small_testcase1426, validity, [~c, ~c v c v ~c v ~a, ~b v ~b v b, a v b v ~c, c v c v ~a], 2000, count(2)).
tests(small_testcase1427, validity, [~b, ~b v c v ~b v ~a, a v ~c, b v ~a v ~c], 2000, count(2)).
tests(small_testcase1428, validity, [~c v ~a v a v a, ~c v c v a, ~b v a v c, a v c v ~c, b v c v ~c v c], 2000, count(7)).
tests(small_testcase1429, validity, [~c v ~b v b, ~b v b v a v ~c, a, b v ~c v ~c v ~c, b v b], 2000, count(2)).
tests(small_testcase1430, validity, [~c v ~b v ~b v c, ~b, ~a v a, a v ~c v ~a, b], 2000, count(0)).
tests(small_testcase1431, validity, [~b v ~a v a v ~a, ~a v a v ~c, a, b], 2000, count(2)).
tests(small_testcase1432, validity, [~b v ~b v b v a, ~a, a, b v a], 2000, count(0)).
tests(small_testcase1433, validity, [~c, ~b v ~b v a, a, b v ~a, c v ~b v ~a], 2000, count(0)).
tests(small_testcase1434, validity, [~b v ~b v ~c v ~b, ~a v b, c, c v ~c v ~c v ~a, c v ~b v a v ~b], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase1435, validity, [~a, ~a v b v b, ~a v c v b v c, c, c v c v ~a v b], 2000, count(2)).
tests(small_testcase1436, validity, [~c v a, ~b, a, b, c v ~c v a], 2000, count(0)).
tests(small_testcase1437, validity, [~b v ~b v a v c, ~a v b, ~a v c, b, c v ~a v ~a], 2000, count(2)).
tests(small_testcase1438, validity, [~c v a v c v b, ~a v ~c v ~a, ~a v ~c v b, a, b v ~c v ~b v ~b], 2000, count(2)).
tests(small_testcase1439, validity, [~c v a, ~a v ~b, a v ~b, a v a v b v c, b], 2000, count(0)).
tests(small_testcase1440, validity, [~c v ~c, ~c v ~a v c, ~c v a v ~a, ~b v b v ~b v a, b v c v c], 2000, count(2)).
tests(small_testcase1441, validity, [~c v ~b v c v ~b, ~c v a, ~b, a v ~c, b v ~b v ~c v a], 2000, count(3)).
tests(small_testcase1442, validity, [~c v a, ~a v ~c, b v a v a v ~a, b v c v b, c v ~a], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase1443, validity, [~c v ~c v ~c, ~a, ~a v ~b v ~c, c], 2000, count(0)).
tests(small_testcase1444, validity, [~c v ~b v ~b v b, ~a v ~b v ~b v ~c, b v c, c v ~a, c v a v ~b v c], 2000, count(3)).
tests(small_testcase1445, validity, [~b, ~b v a v ~b v ~a, a v a, c v ~a, c v a v ~c v a], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase1446, validity, [~b, ~a, a v a v b, b v ~c v ~b v ~b, b v c v b v b], 2000, count(0)).
tests(small_testcase1447, validity, [~c v ~c v a, ~a v ~a, b, b v ~a, b v c v b v ~b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase1448, validity, [~c v ~c v ~b v b, ~b v c v ~a v b, ~a v c v ~a, b v b v c v ~c, c v a], 2000, count(4)).
tests(small_testcase1449, validity, [~c v b v a, ~b v ~b, ~b v a, ~b v a v ~b v ~a, c v ~b v b], 2000, count(3)).
tests(small_testcase1450, validity, [~a v a v c, a v b v c v ~a, b, b v ~a, c v c v b v c], 2000, count(4)).
tests(small_testcase1451, validity, [~c v c v ~c v c, ~b v c, ~a v ~c v ~a, a, c v ~c], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase1452, validity, [~b v ~a v b, ~b v a v ~b, ~a v ~a v c v c, a v ~c v ~c, a v ~a v ~a], 2000, count(3)).
tests(small_testcase1453, validity, [~c, b v ~a v a v ~b, b v a, b v b v ~b, c v b v ~a], 2000, count(2)).
tests(small_testcase1454, validity, [~c, ~b v a v ~a v ~b, ~a v ~a v ~c v ~a, a v ~a v ~b, b v a], 2000, count(3)).
tests(small_testcase1455, validity, [~c v a, b, b v ~b v c v c, c v a v b, c v b], 2000, count(3)).
tests(small_testcase1456, validity, [~a v ~b v a, ~a v ~a v ~c, a, a v ~c v ~b, b v c v b v ~a], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase1457, validity, [~c v ~c, ~c v ~c v ~a, ~b v ~c v a v c, ~b v c, ~a v ~a], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase1458, validity, [~c v c v b, ~b, ~b v ~a v ~b v ~a, b v a v ~c, c v ~a v ~c], 2000, count(3)).
tests(small_testcase1459, validity, [~c v ~b v b, ~c v a v ~b v ~b, ~b v c v ~a, ~a v ~c v b v a, c v ~b v b], 2000, count(6)).
tests(small_testcase1460, validity, [~c v ~c v c, ~b, ~a v ~c v ~a v c, a v ~c v b v ~a], 2000, count(4)).
tests(small_testcase1461, validity, [~b v ~c v ~a, ~a v ~a, a v b v a, b, c v c v ~a v ~c], 2000, count(2)).
tests(small_testcase1462, validity, [~c v ~b v ~a, ~c v ~a v ~b, ~b v b v ~a, c, c v b v ~a v a], 2000, count(3)).
tests(small_testcase1463, validity, [~c v ~b v a, ~c v ~a v ~a v ~b, a, a v ~c v ~a, a v c], 2000, count(3)).
tests(small_testcase1464, validity, [~b v ~b v c, ~b v b v b, ~a v ~c v ~b v b, ~a v ~c v c, c v b v ~c], 2000, count(6)).
tests(small_testcase1465, validity, [~b v ~c v c, ~b v ~a, a v ~c, a v ~b v c v c, a v ~a v ~c v ~a], 2000, count(3)).
tests(small_testcase1466, validity, [~c v b v ~c v c, ~b, ~a v a v b v ~a, b v ~c v ~c v ~a, b v a v ~b v b], 2000, count(3)).
tests(small_testcase1467, validity, [~c v b, ~b, ~a, b, c v b v ~b v ~b], 2000, count(0)).
tests(small_testcase1468, validity, [~b, ~a v a v ~b, ~a v a v ~a v ~b, b v b, b v b v ~b], 2000, count(0)).
tests(small_testcase1469, validity, [~c v ~b, ~c v ~b v a, ~a v a, c v ~c v c v ~c, c v ~b v b], 2000, count(6)).
tests(small_testcase1470, validity, [~c v c v ~a v c, ~b v ~c, ~a v ~a v b v b, ~a v c v c, c v ~c], 2000, count(3)).
tests(small_testcase1471, validity, [~c, ~a v a v ~c, ~a v b v a v ~c, a v ~a v ~c v ~c, c v ~b], 2000, count(2)).
tests(small_testcase1472, validity, [~b, ~a v a, ~a v c, a, b], 2000, count(0)).
tests(small_testcase1473, validity, [~c v c v ~a v ~c, ~a v b v c, a v ~a, c, c v a v ~b], 2000, count(4)).
tests(small_testcase1474, validity, [~c v c, ~a v ~b v b, ~a v b, ~a v b v ~c, a], 2000, count(2)).
tests(small_testcase1475, validity, [~c, ~c v a v a v a, ~b v ~b v c v a, ~a, c v a], 2000, count(0)).
tests(small_testcase1476, validity, [~c v c, ~b v a v ~b, b v ~c, b v ~b, c v ~a v ~c], 2000, count(4)).
tests(small_testcase1477, validity, [a v ~b, a v ~a v ~b, b v ~a, c v b, c v b v ~b v ~b], 2000, count(3)).
tests(small_testcase1478, validity, [~c v a, ~c v a v b, ~a, ~a v a v a, ~a v c v ~b], 2000, count(2)).
tests(small_testcase1479, validity, [~c v b v c v ~c, ~b v a v ~c, ~b v a v a v a, a v ~a v a v ~a, b v ~b], 2000, count(6)).
tests(small_testcase1480, validity, [~b v ~b v c, ~a v b v ~a v ~c, a v ~b, b v b, c v ~b v c], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase1481, validity, [~b v ~c v ~a, ~a v c v ~b v ~a, a v b v c v ~b, b v b v ~c v ~b, b v c], 2000, count(4)).
tests(small_testcase1482, validity, [~c v ~c v c v a, ~b v ~b, ~a v b v c v c, b, b v a], 2000, count(0)).
tests(small_testcase1483, validity, [~c v ~b v ~b v ~a, ~b, ~b v ~b v ~c v b, ~b v a v c v ~b, b v a], 2000, count(2)).
tests(small_testcase1484, validity, [~c v ~a v ~c, ~a, a v a v a, b v a v ~c v ~a, c v a v c v ~a], 2000, count(0)).
tests(small_testcase1485, validity, [~c, ~b v a v ~b v ~b, ~a v c v ~b v ~c, a v ~b v b v ~b, c], 2000, count(0)).
tests(small_testcase1486, validity, [~c v b v b, ~c v c v b v ~a, ~b, ~a v b, a], 2000, count(0)).
tests(small_testcase1487, validity, [~c v ~b v a v c, ~c v b v ~b v ~c, a v ~c v ~a v ~c, c, c v a v ~b], 2000, count(4)).
tests(small_testcase1488, validity, [~b v ~c v ~b, ~b v ~b, ~b v ~a v c v c, ~a, ~a v a v ~a v ~b], 2000, count(2)).
tests(small_testcase1489, validity, [~c v ~a v b, ~b v ~a, b v ~a, c v ~c, c v b v a], 2000, count(3)).
tests(small_testcase1490, validity, [~c, ~c v ~c, ~b v ~a v ~b v ~b, ~b v a v ~b, a v a v a v a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase1491, validity, [~b v ~c v a, ~a v ~c, a v b v ~a, b v ~b v ~a v a, b v ~b v a], 2000, count(5)).
tests(small_testcase1492, validity, [~a, ~a v ~b v b, ~a v ~b v b v a, ~a v ~a v c v ~b, a v ~b v a], 2000, count(2)).
tests(small_testcase1493, validity, [~c v ~a v ~b v ~b, ~a v ~a v ~a v c, a v ~c v c, b v ~a, c v c v a v ~c], 2000, count(4)).
tests(small_testcase1494, validity, [~b v ~b v ~c v ~c, ~b v ~b v a v a, ~a v a v c, ~a v b v a, b], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase1495, validity, [~c, ~c v ~b v ~a v ~b, ~b v a v ~b, b v c v c, c v ~c v b], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase1496, validity, [~c v c, ~a v c, a v a, a v a v a v ~c, b v ~c v c v a], 2000, count(2)).
tests(small_testcase1497, validity, [~b v c v ~c v ~a, ~a v c, a, a v ~b v b, c], 2000, count(2)).
tests(small_testcase1498, validity, [~c v ~c, ~b v a v ~a v c, ~a v ~b v ~a, ~a v b v b, b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase1499, validity, [~c, ~b v ~b v a, a v b, b v ~b v ~a, c v ~a], 2000, count(0)).
tests(small_testcase1500, validity, [~b v a v c, ~b v c, a, b v c, c v a v b], 2000, count(2)).
tests(small_testcase1501, validity, [~c v b, ~a, b], 2000, count(2)).
tests(small_testcase1502, validity, [~b v b, ~a, ~a v ~c v b, a v a v ~a, c], 2000, count(2)).
tests(small_testcase1503, validity, [a, a v ~c v ~a v a, a v a v a, c v ~c, c v c], 2000, solution([(a, t) ,(c, t)])).
tests(small_testcase1504, validity, [~c v a v b, ~b v a v ~b, a v ~a v ~a, c v c, c v c v ~c v ~b], 2000, count(2)).
tests(small_testcase1505, validity, [~c v ~a, ~c v ~a v ~b, ~b v ~a, ~a v ~c v ~a v ~a, b], 2000, count(2)).
tests(small_testcase1506, validity, [~b v c, ~a v b v b v a, a v ~a v a v ~c, b v ~a v ~c v c, c v ~a v a v a], 2000, count(6)).
tests(small_testcase1507, validity, [~a v c v ~c v a, a, b v b v c, c v ~b v c, c v ~a v ~b], 2000, count(2)).
tests(small_testcase1508, validity, [~c v b, ~b, ~b v ~a, b, b v a], 2000, count(0)).
tests(small_testcase1509, validity, [~b, ~b v ~c, ~a v b v ~a, a, b v ~a], 2000, count(0)).
tests(small_testcase1510, validity, [~c v b v ~b, ~b v ~a v ~b v ~c, ~b v b v ~c v ~c, a v b, b v a], 2000, count(5)).
tests(small_testcase1511, validity, [~c v ~c v ~b, ~b v ~a, b v a v ~b, c v ~b v c v ~a, c v a v ~b v c], 2000, count(4)).
tests(small_testcase1512, validity, [~c v b, a, a v a, b v b v c v b], 2000, count(2)).
tests(small_testcase1513, validity, [~b, ~a v c v ~b v ~b, b, b v ~b v ~b v a, c v ~a v ~c v ~c], 2000, count(0)).
tests(small_testcase1514, validity, [a v a v c v b, a v b, a v c, c v ~c v ~b v a, c v ~c v c v ~a], 2000, count(5)).
tests(small_testcase1515, validity, [~c v ~c v a v ~a, ~b v ~c v ~c, a, a v ~b v c, a v ~a], 2000, count(3)).
tests(small_testcase1516, validity, [~b, ~a v ~a, b v ~c v ~b, c v ~c, c v ~a v ~c v ~b], 2000, count(2)).
tests(small_testcase1517, validity, [~c, ~a, ~a v ~c, ~a v c v ~a], 2000, solution([(a, f) ,(c, f)])).
tests(small_testcase1518, validity, [~c v c, ~b v c, ~a v a v a v ~c, a v ~b v ~b v a, a v ~b v b v c], 2000, count(5)).
tests(small_testcase1519, validity, [~c v ~c, ~b, b, b v c, c v ~c v a v a], 2000, count(0)).
tests(small_testcase1520, validity, [a, a v b v ~c, a v c, b v a, c v c v b], 2000, count(3)).
tests(small_testcase1521, validity, [~a v b v c v ~a, a v a, b v ~a, c, c v ~c v c v ~c], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase1522, validity, [~b v ~c, ~b v ~b v a v b, b, c v a v ~c, c v c v ~c v ~c], 2000, count(2)).
tests(small_testcase1523, validity, [~a v ~b v c v ~a, ~a v a v b v ~c, b v ~b v b v b, b v ~a v ~c v b, c], 2000, count(3)).
tests(small_testcase1524, validity, [~c v b v b v c, ~b v c, ~a v b v ~b v ~c, a, b v ~a], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase1525, validity, [~c v ~c v b, ~b v ~c v b, ~b v ~a, ~a, c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase1526, validity, [~b, b, c v ~c v ~b v ~c, c v c v ~a], 2000, count(0)).
tests(small_testcase1527, validity, [~c v b v b, ~b v ~c, ~a v ~b v ~a v c, ~a v ~a v ~c, a v a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase1528, validity, [~c v ~b, ~c v c, ~a v c, ~a v c v ~a v ~c, b v c v a v ~b], 2000, count(4)).
tests(small_testcase1529, validity, [~b, ~a v b, b v a v ~b v b, b v b v ~a, c v a v b v a], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase1530, validity, [~c, ~b v b, ~a v ~c v b v ~c, a, c v ~c v ~b v c], 2000, count(2)).
tests(small_testcase1531, validity, [~a v ~b, ~a v ~a v ~c v c, ~a v b v ~a v ~a, b v a v a, c v b], 2000, count(2)).
tests(small_testcase1532, validity, [~c v a v ~b v a, ~b v ~b v c, ~a v ~a v ~b, ~a v b, b v ~c v c v ~c], 2000, count(2)).
tests(small_testcase1533, validity, [~c v a v ~c v ~a, ~b, ~a, a, b v ~c v ~b v ~a], 2000, count(0)).
tests(small_testcase1534, validity, [~c v ~a v c, ~c v c, ~b v a, a v ~c v ~b, b v ~c], 2000, count(4)).
tests(small_testcase1535, validity, [~b, ~a v ~b v a v ~a, ~a v b, b v c v c, c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase1536, validity, [~c v b v ~c v ~b, ~b v a, a v ~a v ~c, a v a v b, c], 2000, count(2)).
tests(small_testcase1537, validity, [~c v ~b v ~a, ~a v ~a, ~a v c v b, c, c v a v ~c v b], 2000, count(2)).
tests(small_testcase1538, validity, [~c, ~c v ~c, ~c v ~c v b, ~b v c v ~b, c], 2000, count(0)).
tests(small_testcase1539, validity, [~c v ~c v ~c v ~a, ~c v a, ~b v b v ~b v a, a v a v a, b v ~c v a], 2000, count(2)).
tests(small_testcase1540, validity, [~b v ~b, ~a v ~a v c v ~c, a, b v a v ~b, b v c], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase1541, validity, [~c v ~c v a v ~c, ~c v a v a, ~c v b v a v ~c, ~b v ~a v b v ~a, a v c], 2000, count(4)).
tests(small_testcase1542, validity, [~c v ~c v ~a, ~c v ~c v b v a, ~b v ~b, b v ~c, c], 2000, count(0)).
tests(small_testcase1543, validity, [~c v c v ~b, ~a, ~a v ~c v a, a v ~a v b, b v ~b v ~c], 2000, count(4)).
tests(small_testcase1544, validity, [~c v a v ~c, a v b, a v c v a, b v ~a, b v ~a v ~c v ~c], 2000, count(2)).
tests(small_testcase1545, validity, [~b v ~b v ~a, ~a v ~b v ~c, a v ~c, b, c v ~a v b v a], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase1546, validity, [~c v ~c, ~b, b, b v a v b, c v ~b v ~b], 2000, count(0)).
tests(small_testcase1547, validity, [~b v a, ~b v c, a v b v ~b v ~b, c, c v ~a v ~b v ~a], 2000, count(3)).
tests(small_testcase1548, validity, [~a v ~c v ~a, ~a v ~b v c v c, a, b v b v ~b, c v b v a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase1549, validity, [~c, ~c v ~b v c, ~b v b, a v b v ~c, c v a], 2000, count(2)).
tests(small_testcase1550, validity, [~c v ~b v ~c v ~a, ~b v ~c v ~c v c, ~a v b v ~b v b, ~a v c v b v b, b v a v ~c], 2000, count(5)).
tests(small_testcase1551, validity, [~c, ~b v ~a, a v ~b v c, a v b v a, c v ~c v b v a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase1552, validity, [~c v ~b v ~c, ~c v ~b v ~a v a, ~b v a v c v ~a, ~a v c v ~b, c], 2000, count(2)).
tests(small_testcase1553, validity, [~c v ~a, ~b, ~b v a v a, ~b v b v ~c, a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase1554, validity, [~b, a, b v ~c v c, c v ~a, c v b], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase1555, validity, [~c v ~b v ~c v a, ~c v ~b v a v ~c, ~b v b v ~b v ~b, ~a v c, b v c v ~c], 2000, count(5)).
tests(small_testcase1556, validity, [~c v ~b v c v ~b, ~c v b v b v ~a, ~b, b, c v ~a v ~c], 2000, count(0)).
tests(small_testcase1557, validity, [~c, ~c v a v ~b, ~b v ~b v ~b v c, ~a, c], 2000, count(0)).
tests(small_testcase1558, validity, [~c, ~c v ~a v b, ~b v ~b v c, ~a, b v ~b], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase1559, validity, [~c v ~b, ~a v c v c v ~b, b v a v b, b v b, c v ~b], 2000, count(0)).
tests(small_testcase1560, validity, [~c v ~c v b, ~c v c v c v ~b, ~b v b v c v a, ~a v b v b v ~c, c], 2000, count(2)).
tests(small_testcase1561, validity, [~c, ~c v b, ~b v ~a v a, ~b v c v ~b, c v b v a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase1562, validity, [~c v a v ~c v ~b, ~c v b, ~b v b v ~a, ~b v c, c], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase1563, validity, [~a, ~a v ~c v a v b, b v ~b, b v ~a v a v ~b, c v c v ~a v ~c], 2000, count(4)).
tests(small_testcase1564, validity, [~c v a v ~a, ~c v c v b, ~a, a v ~a, a v c], 2000, count(2)).
tests(small_testcase1565, validity, [~c v c, ~b, ~b v ~c, ~a v ~a v ~a v c, ~a v a v ~c v c], 2000, count(3)).
tests(small_testcase1566, validity, [~c v b v ~a v a, ~c v c, ~b v a v a v a, b v a v ~b v b, b v a v b], 2000, count(4)).
tests(small_testcase1567, validity, [~b, ~a v ~b v ~c, a v c v ~c, b v ~c v b, b v ~a v b v b], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase1568, validity, [~c v ~b, ~a, ~a v ~c v c v ~b, b v c v ~a, c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase1569, validity, [~c, ~c v a, ~a v a, a v ~b v b, c], 2000, count(0)).
tests(small_testcase1570, validity, [~c v ~b, ~a, a v ~b v ~a, a v b, c], 2000, count(0)).
tests(small_testcase1571, validity, [~c, ~c v ~a v ~c v ~a, ~b, ~a, c v ~b], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase1572, validity, [~c v ~c v ~c v c, ~b, a v a v ~a, c], 2000, count(2)).
tests(small_testcase1573, validity, [~b v ~a v ~c, ~b v ~a v ~b v ~a, b, b v b v a v ~b, c v a], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase1574, validity, [~c v ~c, ~c v a v ~b v b, ~c v b, ~a v b, a v ~c], 2000, count(3)).
tests(small_testcase1575, validity, [~b, ~a, b v ~c, c, c v ~c v ~a v a], 2000, count(0)).
tests(small_testcase1576, validity, [~c, ~c v a v c, ~b v c v c, a v ~c v a, a v a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase1577, validity, [~a v ~b v c, ~a v ~a, a v ~c, a v ~a, c v b v ~b v ~a], 2000, count(2)).
tests(small_testcase1578, validity, [~c v ~a v ~b v ~b, ~a, ~a v ~b v ~c v ~c, b v ~b v ~a v ~a, b v b v c v c], 2000, count(3)).
tests(small_testcase1579, validity, [~c v c v b, ~a, b, b v ~b], 2000, count(2)).
tests(small_testcase1580, validity, [~c v a, ~b v ~b v ~b v ~b, ~b v c v b v ~c, ~a v b, a], 2000, count(0)).
tests(small_testcase1581, validity, [~c v c, ~a, a v c, c v ~c v c, c v b], 2000, count(2)).
tests(small_testcase1582, validity, [~b v c, ~a v ~a v ~c v b, b v ~a v c v ~c, b v a v ~b v ~a, b v c], 2000, count(3)).
tests(small_testcase1583, validity, [~c v ~c v ~b, ~b v a v c v ~a, a, c v ~c v a, c v ~c v c v b], 2000, count(3)).
tests(small_testcase1584, validity, [~c v ~c v ~c, ~c v c v c, ~b v a v b, ~a v ~c v ~a v ~c, b v ~a], 2000, count(3)).
tests(small_testcase1585, validity, [~b, ~b v ~a v c v c, ~a v ~c v b v ~c, b v b, c v ~b], 2000, count(0)).
tests(small_testcase1586, validity, [~c, ~c v b, ~a v a v c, a, c v ~b v c v ~a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase1587, validity, [~c v ~c v c v ~a, ~b v b, ~a v c, b v b v ~a v ~a, c v a v ~a v ~c], 2000, count(5)).
tests(small_testcase1588, validity, [~c v b v ~c, ~b, ~a v ~c v b v ~b, ~a v c v ~c, b v b], 2000, count(0)).
tests(small_testcase1589, validity, [~b, ~b v ~a, a v b, b v c v b], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase1590, validity, [~a v ~a, ~a v a, a v a, c v ~a v ~a, c v b v ~b v b], 2000, count(0)).
tests(small_testcase1591, validity, [~c, ~b, ~a v ~a v ~c, b, c v ~c v c v a], 2000, count(0)).
tests(small_testcase1592, validity, [~c v b v ~a, a, a v ~b v ~a, c v ~b, c v a v ~b v c], 2000, count(2)).
tests(small_testcase1593, validity, [~c v c, ~b, ~b v ~c v ~a v a, ~b v a v b v ~a, c v ~a v ~a v ~b], 2000, count(4)).
tests(small_testcase1594, validity, [~c v ~c v b v ~a, ~b, ~a, b v ~b, b v c v ~c v a], 2000, count(2)).
tests(small_testcase1595, validity, [~c, ~b, ~a v b v ~b, c], 2000, count(0)).
tests(small_testcase1596, validity, [~b v ~b, ~b v b v ~b v c, ~a v c v ~b v a, a, a v ~c v a], 2000, count(2)).
tests(small_testcase1597, validity, [~b v ~b, ~b v c v ~a v a, a v ~b, b v ~b v a], 2000, count(4)).
tests(small_testcase1598, validity, [~c v a v a, ~b, ~b v ~c v ~a v b, a v b, a v c], 2000, count(2)).
tests(small_testcase1599, validity, [~a, ~a v ~c, c, c v ~b v b, c v a v ~c v b], 2000, count(2)).
tests(small_testcase1600, validity, [a, a v b v b v ~c, a v c v b, b, c v c], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase1601, validity, [~b v ~c v ~a v ~c, ~b v b, a v b, b v ~a, c v ~c v ~c], 2000, count(3)).
tests(small_testcase1602, validity, [~c v c, a, a v ~a, b, c v ~a v ~c], 2000, count(2)).
tests(small_testcase1603, validity, [~c v ~b v a v b, ~b v ~c v ~a v ~b, b v ~c, b v ~b v ~a v ~c, c v ~c], 2000, count(5)).
tests(small_testcase1604, validity, [~a, a, a v ~a v c v c, c v b v ~a v b], 2000, count(0)).
tests(small_testcase1605, validity, [~c v a, ~b, a v ~c v a, a v c v a v ~b, c v ~b], 2000, count(3)).
tests(small_testcase1606, validity, [~c, ~b, ~a v ~a, c v ~b v ~b], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase1607, validity, [~b v b v b v ~a, a v ~c, a v a, b, c], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase1608, validity, [~b, a v ~a v a v ~a, b v ~a v b v ~b, c, c v a], 2000, count(2)).
tests(small_testcase1609, validity, [~b, ~a, ~a v ~c v ~a v ~b, c v ~c, c v a], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase1610, validity, [~c v ~a, ~b, ~a, ~a v a, a v ~a v ~b v ~a], 2000, count(2)).
tests(small_testcase1611, validity, [~c v ~b v a v b, ~c v b v ~b, ~b v ~c, ~a, a v ~a v ~a], 2000, count(3)).
tests(small_testcase1612, validity, [~c, ~b v ~b v ~c v ~a, ~a, a v b v b v ~b, b v c v b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase1613, validity, [~c v ~c v ~c, a v ~b, a v c v a v ~a, c v ~a v ~b v ~b, c v a v c], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase1614, validity, [~c, a v ~b, b v a, c v ~a v ~b v a, c v a v ~b], 2000, count(2)).
tests(small_testcase1615, validity, [~a v ~b v b v b, a v ~c, a v ~a v ~b v ~c, b v a v ~a, c v ~a v ~c], 2000, count(6)).
tests(small_testcase1616, validity, [~c, ~a, ~a v ~c v ~b v b, ~a v ~a v b v c, ~a v b v ~a], 2000, count(2)).
tests(small_testcase1617, validity, [~b v ~b v ~a, a v c v ~a v ~c, b, b v b v ~a v ~c, c v a v a], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase1618, validity, [~c v a, ~b v ~b, ~a v c, b v ~a v ~a, c v ~b v ~c v ~c], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase1619, validity, [~b, ~b v a, ~a v ~c v ~c v b, a, c v ~b v b], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase1620, validity, [~c v ~b, ~b v ~c v ~c, a v ~a v ~a, a v a, b], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase1621, validity, [~c v ~a v a v ~b, ~b, a v ~b, b v ~a, c v b v ~a v ~a], 2000, count(2)).
tests(small_testcase1622, validity, [a, a v ~c, a v ~b v c, b v c v ~a v b, c], 2000, count(2)).
tests(small_testcase1623, validity, [~c v b v a, ~b v b v b, ~a v ~a v ~b, a v b v ~a v b, c], 2000, count(2)).
tests(small_testcase1624, validity, [~c, ~b v a, ~b v a v ~c v b, b v a v c, b v c], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase1625, validity, [~c v b v ~a v ~b, ~b, ~a v c, a v a v ~b], 2000, count(3)).
tests(small_testcase1626, validity, [~c, ~a, a, c v ~b v ~c v ~b, c v b v c v a], 2000, count(0)).
tests(small_testcase1627, validity, [~b v ~c v c v a, ~b v ~b v ~b, ~b v a, a, a v a], 2000, count(2)).
tests(small_testcase1628, validity, [~b, ~a, ~a v ~c, ~a v ~b v c v b, a v ~b], 2000, count(2)).
tests(small_testcase1629, validity, [~b, ~b v a v ~a v ~a, a v ~a v c, a v c, b v b v c v a], 2000, count(3)).
tests(small_testcase1630, validity, [~c v ~c v c, ~c v a v ~c v c, ~c v b v ~b, b, b v ~a v c], 2000, count(4)).
tests(small_testcase1631, validity, [~c v ~c, ~c v ~b v b, a, a v ~c, b], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase1632, validity, [~c v c v b v ~a, ~b, ~b v b v ~b v ~c, ~a v b v ~a, a v a v c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase1633, validity, [~c, ~c v ~b v ~a, ~b v b v a v b, a v c v a, c v a], 2000, count(2)).
tests(small_testcase1634, validity, [~b v b v ~a, ~b v b v c, a v b v a v ~a, c, c v ~b v ~b], 2000, count(4)).
tests(small_testcase1635, validity, [~b v b, ~b v c v ~a, ~a v a v ~b v c, a v c v ~a, b v ~a v b], 2000, count(5)).
tests(small_testcase1636, validity, [~c v ~b v ~a v ~b, ~b, ~b v ~c v ~b v c, b, b v c v ~b v a], 2000, count(0)).
tests(small_testcase1637, validity, [~c, ~b v b, a, b v b, c v c v b], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase1638, validity, [~b v ~c v ~c, ~b v ~c v c, ~a v ~c v ~b v a, b v ~b v ~b v ~c, b v ~a v ~a v b], 2000, count(4)).
tests(small_testcase1639, validity, [~c v ~b v ~b v ~b, ~c v b v b v c, ~c v c v c v a, a v ~c, b v a v a v b], 2000, count(4)).
tests(small_testcase1640, validity, [~c v ~b v c v ~c, ~a v c v ~c, a v b, b v c v b v ~a, c v b v ~a], 2000, count(5)).
tests(small_testcase1641, validity, [~c v a, ~b, a, b v ~a, c v a v a v ~c], 2000, count(0)).
tests(small_testcase1642, validity, [~c, a, b, b v b v b, c v c], 2000, count(0)).
tests(small_testcase1643, validity, [~a v ~c, b, b v c v ~c, c v a], 2000, count(2)).
tests(small_testcase1644, validity, [~c, ~c v c, a v ~a, b v ~c v ~c, c v c], 2000, count(0)).
tests(small_testcase1645, validity, [~c v ~a, ~b, ~b v c v ~c, ~a v ~a, b v ~b v ~b], 2000, count(2)).
tests(small_testcase1646, validity, [~b v ~b, ~a v ~c, b, c v ~c v c], 2000, count(0)).
tests(small_testcase1647, validity, [~c v ~c, b v a v b v ~b, c, c v a, c v c v ~b v b], 2000, count(0)).
tests(small_testcase1648, validity, [~b v ~b, a, a v ~a v ~c, b, c v ~a], 2000, count(0)).
tests(small_testcase1649, validity, [~c, a, a v ~a, c v c v ~c v ~b], 2000, count(2)).
tests(small_testcase1650, validity, [~c v ~c v ~b, ~a v ~b, a, a v ~b v a, b v b v b], 2000, count(0)).
tests(small_testcase1651, validity, [~c, ~c v b v a, ~a v ~c, a, b], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase1652, validity, [~b v a, ~a v a v ~a v ~a, a v b v ~c, c v ~c v a, c v ~a v ~c v ~b], 2000, count(5)).
tests(small_testcase1653, validity, [~b v ~b, ~b v b v ~b v b, a v ~c v ~b, a v a, b v ~c], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase1654, validity, [~c v a v ~a v a, a v ~c v c, a v ~b, a v ~a v c v ~c, b v c v ~c], 2000, count(6)).
tests(small_testcase1655, validity, [~c v c, ~b v b, ~a v b v ~a v ~c, a v b, b v c v b v ~c], 2000, count(5)).
tests(small_testcase1656, validity, [~b v ~a, a, b, c, c v ~a], 2000, count(0)).
tests(small_testcase1657, validity, [~b, ~b v a v ~a v c, ~a v ~c v c v b, a v ~c, a v a v ~b v a], 2000, count(3)).
tests(small_testcase1658, validity, [~c v b v b v ~a, ~a, ~a v ~b, ~a v c v ~b, b v ~b v ~a v b], 2000, count(4)).
tests(small_testcase1659, validity, [~a v c v ~b, b v ~a v a, b v c, b v c v ~c, c], 2000, count(4)).
tests(small_testcase1660, validity, [~b, a v ~b v ~a, b, c, c v a], 2000, count(0)).
tests(small_testcase1661, validity, [~b, a v c, a v c v c, b v b v b v c, c v c v ~c], 2000, count(2)).
tests(small_testcase1662, validity, [~b v ~b v c v b, a, a v c, b v ~b v ~c v a, c v ~c v c v a], 2000, count(4)).
tests(small_testcase1663, validity, [~b v ~c v ~a, ~a v a v a, a v b v ~c v c, b, c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase1664, validity, [~c v a, a, a v ~c v c v ~a, b v c v c v ~c, c v ~a], 2000, count(2)).
tests(small_testcase1665, validity, [~b v b v c, ~a v ~a v b, a v ~c v a, b, c v ~b v ~b], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase1666, validity, [~c v ~a, ~a v a v b v b, ~a v c v a v b, c v ~a v a, c v b], 2000, count(4)).
tests(small_testcase1667, validity, [~c, ~c v ~c v b, ~b v b v ~a v a, ~a v b v c, ~a v c v b v ~c], 2000, count(3)).
tests(small_testcase1668, validity, [~b v ~a v b v b, ~a v b v c, a v ~b v a, a v b v a, c v b v a v ~b], 2000, count(3)).
tests(small_testcase1669, validity, [~b v c v b v b, ~a v b v ~a v ~a, a v ~a v a v ~b, c v a, c v c v ~a v c], 2000, count(3)).
tests(small_testcase1670, validity, [~a v b v ~b, a, a v ~c v ~c v b, a v a v c, b v ~c v c v c], 2000, count(4)).
tests(small_testcase1671, validity, [~c, ~a, ~a v ~a v c, ~a v c v ~c, a v ~c v ~b v ~c], 2000, count(2)).
tests(small_testcase1672, validity, [~c v c v a v a, ~a, a v a, a v c v ~a v a, b], 2000, count(0)).
tests(small_testcase1673, validity, [~c v a, ~b v a v b v a, b v c v ~b, c v ~c v b v a, c v b v a], 2000, count(5)).
tests(small_testcase1674, validity, [~c, ~c v b, ~b, ~a v a, a v a v c v c], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase1675, validity, [~b, a, b v ~b, c v ~c v b, c v a], 2000, count(2)).
tests(small_testcase1676, validity, [~c, ~b, a v ~a, b v ~c v ~b, c], 2000, count(0)).
tests(small_testcase1677, validity, [~c v ~a, ~b v a v a v ~c, ~a v b, b v ~c v ~c], 2000, count(3)).
tests(small_testcase1678, validity, [~c, ~a v ~b v ~a, a v ~c v ~b v ~a, a v a, c v ~a v b], 2000, count(0)).
tests(small_testcase1679, validity, [~a v b, b, c v ~a, c v ~a v b v a, c v c v c v ~b], 2000, count(2)).
tests(small_testcase1680, validity, [~a v ~b, ~a v ~a v a v ~a, a v a v ~a, c v ~b v c, c v ~a v ~c v ~c], 2000, count(5)).
tests(small_testcase1681, validity, [~b v b v a, a v ~a, a v a v c v ~a, c v ~b, c v b v ~c v b], 2000, count(6)).
tests(small_testcase1682, validity, [~b v a v c v c, ~a v ~b, a v b v ~c, b, b v c v ~b], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase1683, validity, [~b v a v ~a, ~a, b v a v a v ~b, b v c v ~a v a, c], 2000, count(2)).
tests(small_testcase1684, validity, [~b v ~c, ~b v ~c v c v a, ~b v ~a, a, a v ~b], 2000, count(2)).
tests(small_testcase1685, validity, [~c v ~c v c, ~c v ~a v ~c, ~c v c v c v ~b, ~b v ~b v c v a, b v c], 2000, count(3)).
tests(small_testcase1686, validity, [~c v ~a v c, ~c v a v ~a v b, b v b, c v ~b v ~b v a, c v ~a v ~a], 2000, count(2)).
tests(small_testcase1687, validity, [~c v ~a, ~b, ~b v b v ~a, a v a v ~b v a], 2000, count(3)).
tests(small_testcase1688, validity, [~a v ~c v ~a v ~a, a, a v b, c, c v b], 2000, count(0)).
tests(small_testcase1689, validity, [~c v ~a v ~c, ~b v ~c v ~c v ~c, ~a, ~a v b v ~a v a, c v ~b v b v c], 2000, count(3)).
tests(small_testcase1690, validity, [~c v b v b, ~b v ~b, a v ~a, b, c v b v c v ~b], 2000, count(0)).
tests(small_testcase1691, validity, [~b, ~b v a v ~c v ~a, a v ~b, b v b v b, c], 2000, count(0)).
tests(small_testcase1692, validity, [~c, ~b v ~a, b v b v b v ~c, c v ~a, c v a], 2000, count(0)).
tests(small_testcase1693, validity, [a v ~c v ~c, a v ~b v c v c, b v b, b v c, c v ~a], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase1694, validity, [~b v ~c v ~a v b, ~a, a v a v ~c, b, b v c], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase1695, validity, [~c v c v ~a v c, ~b v ~a, ~b v c v ~c v ~b, b, b v ~a v b v b], 2000, count(2)).
tests(small_testcase1696, validity, [~c, ~b v b v a v ~a, ~a v c, a v ~b v ~b v ~c, c v ~b], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase1697, validity, [~b v ~c v ~c, ~b v ~b v c v ~c, ~b v a, ~b v a v ~c, ~a v a], 2000, count(5)).
tests(small_testcase1698, validity, [~c v ~a v ~b, ~b v b v c, a v ~a, b v ~c, b v a], 2000, count(4)).
tests(small_testcase1699, validity, [~c v ~a v ~a, ~b v a v a v c, ~b v c v b, ~a v ~b, a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase1700, validity, [~a v b, a v ~c, a v b v ~c v ~c, b v a v a v ~b, c v a v ~b], 2000, count(3)).
tests(small_testcase1701, validity, [~b v a v a, a, a v ~c v ~a v c, a v b v c, c v c v ~a v a], 2000, count(4)).
tests(small_testcase1702, validity, [~c v ~b v ~c v b, ~b, ~a, c v ~a, c v a], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase1703, validity, [~b v a, ~b v b v b v ~c, ~b v c, ~a v ~a v b v b, c v c v ~c v b], 2000, count(3)).
tests(small_testcase1704, validity, [~c, ~c v a v ~b v ~a, a, a v ~b v ~a, c], 2000, count(0)).
tests(small_testcase1705, validity, [~c, ~c v b, b, b v c, c v a], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase1706, validity, [~b v c v c, ~a v ~c v ~b v ~b, ~a v c v ~c, a v ~b v a v c, b v ~a v a], 2000, count(5)).
tests(small_testcase1707, validity, [~b v ~c v ~b, ~b v b v b, ~a v ~c, ~a v ~a v b, c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase1708, validity, [~c, ~b v a v a, a, a v ~b v b, a v a v ~a], 2000, count(2)).
tests(small_testcase1709, validity, [~c v a v ~a, ~b v b v c v c, a v ~c v b, a v b, c], 2000, count(3)).
tests(small_testcase1710, validity, [~c, ~b v a v ~b v ~b, ~b v c v ~a v a, a v ~c, c v ~b], 2000, count(2)).
tests(small_testcase1711, validity, [~c v c v ~b v a, ~a v ~b, a, a v b v ~c], 2000, count(2)).
tests(small_testcase1712, validity, [~b v a v c, ~a v c v a, a v ~b, b v c v ~c v ~a, c v c v ~c], 2000, count(6)).
tests(small_testcase1713, validity, [~b, ~a v c v ~b v ~c, ~a v c v c, a v ~a v ~c v c, c v c v a], 2000, count(2)).
tests(small_testcase1714, validity, [~c v a, ~c v a v b, ~b, ~b v b v c, c v b v ~a v ~a], 2000, count(2)).
tests(small_testcase1715, validity, [~b, ~a v b v ~b, b, b v ~b, c v c v a], 2000, count(0)).
tests(small_testcase1716, validity, [~b, a, a v ~c v c, b v ~a v ~b v ~c, c v ~b v ~b], 2000, count(2)).
tests(small_testcase1717, validity, [~c v ~a v ~c v a, ~b v ~c v ~c, a, a v b v b, c v ~b], 2000, count(2)).
tests(small_testcase1718, validity, [~b, ~a, a v ~b v b, b v b v ~b, c v c v b], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase1719, validity, [~c v ~b, ~c v ~a v ~c, ~b, ~a v ~a v c], 2000, count(2)).
tests(small_testcase1720, validity, [~c v b v b, ~b v ~c v c, ~b v a v c, a v ~b, b], 2000, count(2)).
tests(small_testcase1721, validity, [~c v ~b v ~c, ~b, ~b v ~a v ~c, a v a v ~c, b v ~c v ~b], 2000, count(3)).
tests(small_testcase1722, validity, [~c, ~c v ~a, ~a v a v ~c, b v c v c v ~b, c v c v ~c v ~a], 2000, count(4)).
tests(small_testcase1723, validity, [~c v ~b v c v ~a, ~c v ~a v ~b v ~b, ~b, ~a v a v ~c v ~c], 2000, count(4)).
tests(small_testcase1724, validity, [~c v b, ~b v a, b, c v a, c v a v ~b v a], 2000, count(2)).
tests(small_testcase1725, validity, [~c, ~b v ~c v ~b v c, ~b v ~a v ~c v b, a, b v a v ~b v ~b], 2000, count(2)).
tests(small_testcase1726, validity, [~c v c v ~b v ~c, ~b, ~b v b v ~c v c, ~a v ~b v ~b, ~a v ~b v ~a], 2000, count(4)).
tests(small_testcase1727, validity, [~b, ~b v ~b v b, ~b v b v ~b, a v b v c v ~c, b v c v a], 2000, count(3)).
tests(small_testcase1728, validity, [~c v ~c v a v ~b, ~a, a, a v ~c, b v c], 2000, count(0)).
tests(small_testcase1729, validity, [a v a, a v a v ~b, b v a v c v ~a, b v c v b v c, c v ~b v b], 2000, count(3)).
tests(small_testcase1730, validity, [~b v b, a, b v a, c v ~c, c v ~b v ~c], 2000, count(4)).
tests(small_testcase1731, validity, [~a v c v ~b v a, b v a, c v ~b v a v ~c, c v ~a v b, c v a v ~b v a], 2000, count(4)).
tests(small_testcase1732, validity, [~c, ~b v b, a v a v a, b v ~a, c v a v c], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase1733, validity, [~a, b v ~c, b v a v b, b v c v ~b, c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase1734, validity, [~a v a v ~c, a v ~b v ~a, a v c v ~c v ~b, b v b v b v ~b, c v b v b], 2000, count(6)).
tests(small_testcase1735, validity, [~c v b v ~b v a, ~c v b v ~a, b, b v ~a v b, c v ~a v ~b v ~a], 2000, count(3)).
tests(small_testcase1736, validity, [~c, ~c v b v ~b v b, ~b v ~b, ~b v ~a, a v c], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase1737, validity, [~b, b v ~c, b v ~a v ~a v c, c], 2000, count(0)).
tests(small_testcase1738, validity, [~a, ~a v ~a, a v ~c v ~c, a v ~a, c v b v ~b v b], 2000, count(2)).
tests(small_testcase1739, validity, [~b v ~c v ~c v ~b, ~b v ~a v c, ~a v a v a, a v c v ~b v b, c v ~a], 2000, count(4)).
tests(small_testcase1740, validity, [~c v ~a, ~a v ~a, b v ~b, b v c v ~c, c v ~b v ~c], 2000, count(4)).
tests(small_testcase1741, validity, [~b v ~b, ~b v a v c, ~b v b v ~c, ~a v a, a], 2000, count(2)).
tests(small_testcase1742, validity, [~c v b v c, ~b, ~b v a v b v ~a, ~a v ~a v a, b v ~c v b], 2000, count(2)).
tests(small_testcase1743, validity, [~c v b, ~b, b v a, c v ~a v c v ~c], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase1744, validity, [~c v a v b, ~b v ~c, ~b v b v c v b, ~a v ~b v ~b, c v ~b v ~b v ~c], 2000, count(4)).
tests(small_testcase1745, validity, [~c, ~c v a, ~b, ~a v ~c], 2000, count(2)).
tests(small_testcase1746, validity, [~b v c v ~b, ~a v ~c v a v c, a v c, a v c v a v ~c, b v ~c], 2000, count(3)).
tests(small_testcase1747, validity, [~a v ~a, b v b v ~b, b v c v ~c v ~b, c v ~c, c v ~b v b], 2000, count(4)).
tests(small_testcase1748, validity, [~b v ~b v ~c v c, ~b v c v a v ~c, b v ~a v ~c, c v ~c, c v ~b v c], 2000, count(5)).
tests(small_testcase1749, validity, [~b, ~b v ~a v ~a, ~b v c v ~b v ~c, b, c v ~a], 2000, count(0)).
tests(small_testcase1750, validity, [~c, ~a, ~a v c v a v a, c, c v b], 2000, count(0)).
tests(small_testcase1751, validity, [~c v ~b v b, ~c v b v a v ~b, ~b v a, ~b v a v ~a v b, ~a v ~c v a v ~b], 2000, count(6)).
tests(small_testcase1752, validity, [~c v c v b, ~b v ~a v a, c, c v ~c v ~b v c, c v c], 2000, count(4)).
tests(small_testcase1753, validity, [~b v ~c v a, ~b v ~b v c v ~c, c, c v ~b v b], 2000, count(3)).
tests(small_testcase1754, validity, [~c v ~b v b, ~b v c v ~b v c, b v ~b v ~c, b v a v ~b v a, c v ~b v ~b], 2000, count(6)).
tests(small_testcase1755, validity, [~c v b v c v c, ~b v a v ~c, ~b v b v a, b v ~b v ~a, c v ~b v ~c], 2000, count(7)).
tests(small_testcase1756, validity, [~c v b v c v ~c, ~b v b, ~a v a v ~b, a v b v b v c, c v b], 2000, count(6)).
tests(small_testcase1757, validity, [~c v c, ~b v ~a v b, ~a v ~a v ~c v a, ~a v c, a v a], 2000, count(2)).
tests(small_testcase1758, validity, [~b v ~b v a v ~a, ~b v a v a v ~a, ~a, ~a v a v a, a v ~b], 2000, solution([(a, f) ,(b, f)])).
tests(small_testcase1759, validity, [~c, ~a v ~a v c, ~a v a, b v ~a v ~a, c], 2000, count(0)).
tests(small_testcase1760, validity, [~b, ~b v ~c v ~c, a v c v a v b, b v ~b v b v ~c, b v ~a], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase1761, validity, [~c v b v ~c, ~a, ~a v ~a v ~a, a v b v ~b, c v c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase1762, validity, [~a, ~a v b v a v c, ~a v b v b, a v ~b v ~c, a v a], 2000, count(0)).
tests(small_testcase1763, validity, [~a v ~b v ~b, ~a v ~a v ~a v ~a, a v b v ~b v ~b, b v ~a v a, b v ~a v c v ~b], 2000, count(4)).
tests(small_testcase1764, validity, [~b, ~b v a v c, ~a v ~b v ~c v b, a, c v ~c], 2000, count(2)).
tests(small_testcase1765, validity, [~a v ~b v a v c, a v a v c, b v ~c, b v ~a v c v ~a, c], 2000, count(2)).
tests(small_testcase1766, validity, [~a v ~c, a v a v a v ~c, a v c v ~c, b v b v c, c v ~b v ~b], 2000, count(0)).
tests(small_testcase1767, validity, [~b, ~b v b v c v a, ~a v a v b v c, b v c v ~c, c v a v ~c v b], 2000, count(4)).
tests(small_testcase1768, validity, [~c v ~c v ~a v ~b, ~b v ~b, a v ~b v a, a v a v c v ~a, c v a v ~c v b], 2000, count(4)).
tests(small_testcase1769, validity, [~b, ~b v b v c, b v b v b, c v ~a v c v c, c v b], 2000, count(0)).
tests(small_testcase1770, validity, [~c, ~b, ~a, ~a v c v a v c, a], 2000, count(0)).
tests(small_testcase1771, validity, [~c v a v b v ~a, b v ~c, c v ~b, c v a v ~a, c v c v b], 2000, count(2)).
tests(small_testcase1772, validity, [~c v b, b v ~c v b v a, c, c v ~a v ~b v ~c, c v c v a v ~b], 2000, count(2)).
tests(small_testcase1773, validity, [~c v b v ~b v a, a, a v ~b v ~b, c v ~b v ~c, c v c v c v ~c], 2000, count(4)).
tests(small_testcase1774, validity, [~b v ~c, ~a v ~c v ~c v ~b, ~a v a, ~a v c, c v ~b], 2000, count(3)).
tests(small_testcase1775, validity, [~c v b v b v c, ~a v b, ~a v c v ~b, a v c v ~c v ~a, c v c v a v b], 2000, count(4)).
tests(small_testcase1776, validity, [~c v ~c v c, ~b v ~b, ~b v c v c v ~a, a v c, b v ~c], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase1777, validity, [a v ~c, a v ~c v b, b v b v ~a v ~b, c v ~c, c v ~c v b], 2000, count(6)).
tests(small_testcase1778, validity, [~c v ~c v ~b, ~b v ~b v ~c v a, ~a v c, b v ~b, b v a v ~a v ~b], 2000, count(4)).
tests(small_testcase1779, validity, [~c v c, ~b v ~a v a, ~a v ~a, b v ~c v ~b, c v b v c v ~b], 2000, count(4)).
tests(small_testcase1780, validity, [~c v ~b v a v ~c, ~a v c v c, a v ~a v c, b v c v b, c], 2000, count(3)).
tests(small_testcase1781, validity, [~c, ~a v ~c v ~c v ~c, ~a v b v c, a], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase1782, validity, [~b v ~c v ~b, ~b v ~a v a, ~a v a, a, b v ~b], 2000, count(3)).
tests(small_testcase1783, validity, [~c, ~c v ~a, a v ~c v a, b v c, c v b], 2000, count(2)).
tests(small_testcase1784, validity, [~b, ~a, a, b v a v ~b v c, b v c v ~c], 2000, count(0)).
tests(small_testcase1785, validity, [~b v ~a v b v c, ~a v c, a v c, b, c v ~c v ~c v c], 2000, count(2)).
tests(small_testcase1786, validity, [~c, ~b v ~b v ~b v ~c, ~b v a v b v ~a, a v ~a, a v ~a v ~c v ~c], 2000, count(4)).
tests(small_testcase1787, validity, [~b v ~a, ~b v a, a, c v ~a v ~c, c v c v ~b v ~b], 2000, count(2)).
tests(small_testcase1788, validity, [~c v ~c v ~c v a, ~a, ~a v ~a, a, b v b], 2000, count(0)).
tests(small_testcase1789, validity, [~c, ~b v b v ~a v ~a, ~a v ~a v ~b v ~c, b v ~c v ~c v ~b, b v ~c v ~a v ~c], 2000, count(4)).
tests(small_testcase1790, validity, [~c v b v c v c, ~a, a v b v a v b, b v b, b v b v ~a], 2000, count(2)).
tests(small_testcase1791, validity, [~c v c, ~a v ~b v ~b v ~a, ~a v ~a v ~c, a v ~a, c v b v ~b], 2000, count(5)).
tests(small_testcase1792, validity, [~c, ~c v ~b v b, c, c v ~c v ~a, c v b v c v c], 2000, count(0)).
tests(small_testcase1793, validity, [~c v ~a, ~a v b v ~a, ~a v c, b v ~b, c v a v c v ~c], 2000, count(4)).
tests(small_testcase1794, validity, [b, b v ~b v a, c, c v ~b, c v c v b v c], 2000, count(2)).
tests(small_testcase1795, validity, [~b v b v ~c v b, ~a v c v ~c, a v ~a, c v ~c v ~c v b, c v b v ~b v b], 2000, count(8)).
tests(small_testcase1796, validity, [~b, a v ~b v ~b v ~a, b v ~b v ~c, c v a, c v b], 2000, count(2)).
tests(small_testcase1797, validity, [~c v ~a v ~b, ~b v c v c, ~a v ~c v a v ~b, a v ~a v ~a v c, a v b], 2000, count(3)).
tests(small_testcase1798, validity, [~c v ~b v b v a, ~c v a v b, ~c v b v ~a v ~c, a v ~a, c v a v ~c], 2000, count(6)).
tests(small_testcase1799, validity, [~a v ~c v ~a v c, b, b v ~c, b v ~a v a v a, b v b v ~b v ~a], 2000, count(4)).
tests(small_testcase1800, validity, [~b v c, ~b v c v b, ~a v ~a, a v ~b v b v ~c, a v ~a v ~b], 2000, count(3)).
tests(small_testcase1801, validity, [~c v ~b, a, a v c v a v ~a, b v ~c v ~c, b v c v ~c v a], 2000, count(2)).
tests(small_testcase1802, validity, [~c, ~b, a v ~b v a, a v a v c, b], 2000, count(0)).
tests(small_testcase1803, validity, [~b, ~b v b, b v a v a v b, c v ~b, c v ~a v ~c], 2000, count(2)).
tests(small_testcase1804, validity, [~a v b, b, b v ~a v ~b, c v ~a v ~a, c v a], 2000, count(2)).
tests(small_testcase1805, validity, [~c v c v ~a v ~a, a v ~b v ~c v ~b, a v a, b, b v ~a v c], 2000, count(2)).
tests(small_testcase1806, validity, [~c v ~c v ~b v b, ~c v c v ~c, ~b v b, ~a v ~b v c, c v b v b v ~a], 2000, count(6)).
tests(small_testcase1807, validity, [~c v ~c v ~c v b, ~c v a, ~b v c v ~c v b, b v ~a v b, c], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase1808, validity, [~c v ~c v ~b v ~c, ~b v b v ~c, ~a v a v c v b, b v b, c v b], 2000, count(2)).
tests(small_testcase1809, validity, [~b v ~b, ~a v ~b, a v a v ~b, b v ~c v ~a v b, b v ~b v a v ~a], 2000, count(3)).
tests(small_testcase1810, validity, [~c, a, a v ~c, c], 2000, count(0)).
tests(small_testcase1811, validity, [~c v ~b v b v ~c, c v ~c v ~a v ~b, c v ~b v ~a v ~b, c v ~a v ~b, c v c v ~b], 2000, count(6)).
tests(small_testcase1812, validity, [~b, ~b v c, a, c v ~c], 2000, count(2)).
tests(small_testcase1813, validity, [~c, ~c v c, ~b v ~c v ~b, ~b v ~a v ~b, ~b v b v ~b v a], 2000, count(3)).
tests(small_testcase1814, validity, [~b, ~b v ~c v c v c, ~a v c, ~a v c v ~b v ~a, a v c v ~b], 2000, count(3)).
tests(small_testcase1815, validity, [~c, ~a v a, a, c, c v ~b v ~b], 2000, count(0)).
tests(small_testcase1816, validity, [~b v a v c, ~a v b v ~b, a, c, c v b v ~c], 2000, count(2)).
tests(small_testcase1817, validity, [~c v ~a v c, ~b v ~b, ~a, a v b v ~a v a, b v b v a], 2000, count(0)).
tests(small_testcase1818, validity, [~c v ~c, ~b, ~a, a, b v ~a], 2000, count(0)).
tests(small_testcase1819, validity, [~c v ~a v a v ~a, ~b, ~a v b v ~c v b, a v a v ~c, c v ~c], 2000, count(2)).
tests(small_testcase1820, validity, [~b v ~b v b v ~b, ~b v ~a v ~a, ~a, b v ~a v ~b, b v ~a v ~b v ~a], 2000, count(2)).
tests(small_testcase1821, validity, [~a, a, a v a, a v a v b], 2000, count(0)).
tests(small_testcase1822, validity, [~c, ~b, ~b v a v ~b v ~a, a, b v ~b v ~b v c], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase1823, validity, [~c v ~b, ~a, ~a v ~b v c, b v ~b v b, b v ~a v ~c], 2000, count(3)).
tests(small_testcase1824, validity, [~c, ~c v ~c v c v b, ~b v ~c, ~b v ~a v ~b, c], 2000, count(0)).
tests(small_testcase1825, validity, [~c, ~b v ~b, ~a v ~c v b v ~b, ~a v a, c v ~c v b v b], 2000, count(2)).
tests(small_testcase1826, validity, [~c v a, ~b, ~a v ~b v b, a v ~b v ~b, c v ~a v a], 2000, count(3)).
tests(small_testcase1827, validity, [~b v ~b v a, ~a v ~c, a v c v ~b v a, b v a, c v ~c v ~a v a], 2000, count(2)).
tests(small_testcase1828, validity, [~b, ~b v ~a, ~a v c v ~c v ~c, b, c v b v c], 2000, count(0)).
tests(small_testcase1829, validity, [a, b, b v ~a v c, c v ~a v ~a, c v ~a v c], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase1830, validity, [~a v ~a v ~b v a, ~a v b, a v ~b, b, c v ~a], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase1831, validity, [a, b, b v ~b v ~c v ~a, c], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase1832, validity, [~b, ~b v ~c, ~b v b v c, a v ~a v ~a v c, c v ~c v ~a v b], 2000, count(4)).
tests(small_testcase1833, validity, [~c v ~c v c v ~c, ~c v b, ~b v ~c v c v ~c, ~a, c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase1834, validity, [~b, ~a, b v c v b v ~c, c v a v a], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase1835, validity, [~c v c, ~b, ~b v b, ~a v ~b v b v ~c, ~a v a v c], 2000, count(4)).
tests(small_testcase1836, validity, [~a v ~a v a v c, a, a v ~b v ~a, b, c v a v a v b], 2000, count(2)).
tests(small_testcase1837, validity, [~c, ~b v a v b v b, ~b v c v c v ~a, ~a], 2000, count(2)).
tests(small_testcase1838, validity, [~c v ~a, ~c v a v a, ~b v ~b v b v ~c, ~b v ~a v a, ~a v ~b], 2000, count(3)).
tests(small_testcase1839, validity, [~c v ~c v b, ~b v b v a, ~a v a, b v ~b v c, c v ~b v c], 2000, count(4)).
tests(small_testcase1840, validity, [~b, ~b v ~c, a v ~a v ~c, b, c v ~a v ~a v ~a], 2000, count(0)).
tests(small_testcase1841, validity, [~c v b v b v ~a, ~a, ~a v a v ~b, a, a v ~c], 2000, count(0)).
tests(small_testcase1842, validity, [~c v c v a v ~a, ~a v b v ~b v b, a v ~c v c v a, a v b, c], 2000, count(3)).
tests(small_testcase1843, validity, [~c, ~c v b v ~c, a v c v ~a v c, b v a v ~c v a, c], 2000, count(0)).
tests(small_testcase1844, validity, [~c v ~b v ~c v b, ~c v ~a v ~c, ~b, a v ~b v ~b, a v ~a], 2000, count(3)).
tests(small_testcase1845, validity, [~b, ~a, a, b v c, c v ~b v b v a], 2000, count(0)).
tests(small_testcase1846, validity, [~b v ~b, ~b v a v ~a, ~a v ~b v a, ~a v ~a v ~a, c v ~a v c v ~b], 2000, count(2)).
tests(small_testcase1847, validity, [~c, ~b v ~a v ~b, ~a v a v ~c v a, c v a v a, c v b], 2000, count(0)).
tests(small_testcase1848, validity, [~b v b, a v a, a v a v ~b, b v ~b v ~a v ~a], 2000, count(2)).
tests(small_testcase1849, validity, [~c v b v ~c v b, ~b v a, a v ~c, c v ~c v a, c v b], 2000, count(2)).
tests(small_testcase1850, validity, [~b v ~a, ~b v b v c v ~c, b, b v ~b v ~b v ~b], 2000, count(2)).
tests(small_testcase1851, validity, [~a v c, ~a v c v ~b, a v b v ~c v a, b, c], 2000, count(2)).
tests(small_testcase1852, validity, [~b v b, ~a v a v ~c v ~c, ~a v b v b, b v ~c v a, c v a], 2000, count(3)).
tests(small_testcase1853, validity, [~c v ~b v ~a, ~b v a v ~c, ~a v ~a v ~a, ~a v a, a v ~c], 2000, count(2)).
tests(small_testcase1854, validity, [~b, a, a v c v ~c, a v c v b, c v ~b v b], 2000, count(2)).
tests(small_testcase1855, validity, [~c v b v ~a, ~a v a, ~a v c, ~a v c v ~c, a v ~b v ~a], 2000, count(5)).
tests(small_testcase1856, validity, [~b, ~b v ~c, ~b v ~b, ~a v b, c v ~a], 2000, count(2)).
tests(small_testcase1857, validity, [~c, a, a v c, b v b, c v ~b v c], 2000, count(0)).
tests(small_testcase1858, validity, [~c v a, ~c v a v ~c, ~b v ~c v ~b, ~a, a v ~c], 2000, count(2)).
tests(small_testcase1859, validity, [~b, a, b v ~b, c v ~b, c v b v a v ~a], 2000, count(2)).
tests(small_testcase1860, validity, [~c v b v a, ~a v ~c v ~a v ~c, ~a v b, a v a v b v a, c v ~c], 2000, count(3)).
tests(small_testcase1861, validity, [~c v c v c v b, ~b, a, a v c v ~b, b v a v ~b v ~b], 2000, count(2)).
tests(small_testcase1862, validity, [~c v ~c, ~c v ~a v a v ~c, ~b v ~b, ~a, ~a v ~a v ~c], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase1863, validity, [~c v b, ~b v c v a v ~c, ~a v c, b v ~b v c, b v a], 2000, count(3)).
tests(small_testcase1864, validity, [~c v ~c, a, b, b v a, b v c v a], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase1865, validity, [~c, ~b v c v b v ~a, ~a v ~b v ~a v ~c, a v a v ~c, c v a v ~b v ~c], 2000, count(4)).
tests(small_testcase1866, validity, [~b, ~b v b, ~a, a v a v b, b v ~b v ~a], 2000, count(0)).
tests(small_testcase1867, validity, [~b, ~b v ~a, ~b v c, ~a v ~b v ~c v ~b, a v ~a], 2000, count(4)).
tests(small_testcase1868, validity, [~c v c v ~b v ~a, ~b v ~b, a v a v b, b v c v ~a v ~b, c v a v ~c v a], 2000, count(2)).
tests(small_testcase1869, validity, [~a v c v b, a v a v c v ~c, b v ~c, c, c v b v c], 2000, count(2)).
tests(small_testcase1870, validity, [~a v ~a v a v ~a, a, b, b v c v a, c v ~c], 2000, count(2)).
tests(small_testcase1871, validity, [~c v a v c, ~a v ~b v ~c v a, a v a v a, b v ~c, c v b], 2000, count(2)).
tests(small_testcase1872, validity, [~b v ~b v c, ~a v ~b v ~b, ~a v ~b v b v ~b, a v a v ~c v ~b, b v ~a v ~a v ~c], 2000, count(3)).
tests(small_testcase1873, validity, [~a, ~a v ~c v b, c, c v ~a, c v ~a v ~a v ~b], 2000, count(2)).
tests(small_testcase1874, validity, [~c v ~b v ~a, ~b, ~b v ~a, ~a v ~b v a v ~c, a v b v b v ~b], 2000, count(4)).
tests(small_testcase1875, validity, [~c, ~c v ~b, ~a v a v a, a, b v b v ~c], 2000, count(2)).
tests(small_testcase1876, validity, [~a v ~c, b, c, c v ~b], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase1877, validity, [~c, ~c v ~c, ~c v ~b, ~b v ~c v ~a, ~a v ~b], 2000, count(3)).
tests(small_testcase1878, validity, [~a, ~a v b v ~c, a, b v a v ~a v ~a, c], 2000, count(0)).
tests(small_testcase1879, validity, [~b, a v b v b v ~b, b, c v a, c v b v ~a v ~a], 2000, count(0)).
tests(small_testcase1880, validity, [~c, a v ~b v ~b v b, b, b v b v a v ~b, c], 2000, count(0)).
tests(small_testcase1881, validity, [~c v ~b v ~b, ~c v c, a v ~a v ~b v a, b, c v a v c v ~c], 2000, count(2)).
tests(small_testcase1882, validity, [~b, ~b v b, ~b v b v a, ~a v ~c, b v ~a v a], 2000, count(3)).
tests(small_testcase1883, validity, [~c, ~b v b, ~b v b v ~a v ~a, b v ~c v ~c v ~a, c v c v ~c v b], 2000, count(4)).
tests(small_testcase1884, validity, [~c, ~a v ~a v ~b, ~a v a v b v a, a v b v c, b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase1885, validity, [~a v ~c v ~a, b v ~c v c, b v ~b, b v c, c], 2000, count(2)).
tests(small_testcase1886, validity, [~c v ~a, ~c v a v a v ~c, ~a v ~b v ~c, a v ~a, c], 2000, count(0)).
tests(small_testcase1887, validity, [~c, ~a v a v a v a, b v ~b, b v ~a, c v ~b v ~c], 2000, count(3)).
tests(small_testcase1888, validity, [~c v a v ~a v ~c, ~a v a v ~a, a, a v ~b v c v a, b], 2000, count(2)).
tests(small_testcase1889, validity, [~c v a v b, ~c v a v c v a, ~b v b, a, c v ~c v b v ~c], 2000, count(4)).
tests(small_testcase1890, validity, [~c, ~b, ~a v a v b v b, b], 2000, count(0)).
tests(small_testcase1891, validity, [~c, ~c v a v ~a, ~a v ~b v b v ~c, a v b, c v ~c v ~a], 2000, count(3)).
tests(small_testcase1892, validity, [~b v ~b, ~b v ~a, a v a v ~a v a, b v ~b, b v a v ~c], 2000, count(3)).
tests(small_testcase1893, validity, [~a v b v b v ~a, a v b v ~c, a v c v ~b, b v ~c, c v ~a v c], 2000, count(3)).
tests(small_testcase1894, validity, [~c v ~b v ~c, ~b v c v ~c, a v a, b v b v ~a v ~a, c v ~a v ~b], 2000, count(0)).
tests(small_testcase1895, validity, [~a, ~a v b v ~c v ~b, a, b, c], 2000, count(0)).
tests(small_testcase1896, validity, [~c v ~c, ~a, a, c, c v b], 2000, count(0)).
tests(small_testcase1897, validity, [~c v ~c v a v b, ~c v ~a, ~a v ~c v b, b v b v ~a, c v ~b v a], 2000, count(3)).
tests(small_testcase1898, validity, [~a v ~b v c v c, a, b v c, c], 2000, count(2)).
tests(small_testcase1899, validity, [~c v a v ~c v b, a, a v ~c, c v a v ~b, c v c v ~a v ~a], 2000, count(2)).
tests(small_testcase1900, validity, [~c v c v ~a v c, ~a, ~a v c v c v ~a, c v ~a v ~c, c v ~a v ~a], 2000, count(2)).
tests(small_testcase1901, validity, [~b v ~c, ~b v ~a v c v ~a, ~a v a v c v c, a], 2000, count(2)).
tests(small_testcase1902, validity, [~c v ~c v c v ~c, ~c v ~a, ~a v c, b v ~c, c v ~b], 2000, count(2)).
tests(small_testcase1903, validity, [~c v ~c, ~b, a, b v ~c, b v ~a v ~c v ~b], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase1904, validity, [~b, ~a, b v c v ~b, c, c v b v b v ~b], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase1905, validity, [~c v ~c, ~a v ~b v ~c, b, b v ~a v b v b, c v b v ~b], 2000, count(2)).
tests(small_testcase1906, validity, [~c v ~c, ~c v ~b, ~b v ~c v a, c v c v ~c v c], 2000, count(4)).
tests(small_testcase1907, validity, [~b v ~b v ~c, ~a v ~c v ~b v b, a v ~b v ~a v ~a, b v a, c v ~c v ~a v ~b], 2000, count(4)).
tests(small_testcase1908, validity, [~b, ~b v a v ~c, ~a v ~b, a, b], 2000, count(0)).
tests(small_testcase1909, validity, [~b v ~a, ~b v c v c, a v c v ~a, c], 2000, count(3)).
tests(small_testcase1910, validity, [~b, ~b v ~b v ~c, ~b v ~a v ~b, ~a v a, a v ~c v a v a], 2000, count(3)).
tests(small_testcase1911, validity, [~c v a v ~c v c, ~b v ~b, ~b v ~b v ~c v ~c, ~a v ~c], 2000, count(3)).
tests(small_testcase1912, validity, [~a v a v ~c v ~c, a v c, b, c, c v ~b v ~a v ~a], 2000, count(2)).
tests(small_testcase1913, validity, [~c v ~c v c, ~b, ~a v ~c v c, b v ~b v ~a v c, c v a v ~c v a], 2000, count(4)).
tests(small_testcase1914, validity, [~c, a v ~c, b v ~b, c, c v ~b v a v ~b], 2000, count(0)).
tests(small_testcase1915, validity, [~c v a v b v a, ~b v a, ~a v a, a, b], 2000, count(2)).
tests(small_testcase1916, validity, [~c v b v ~b v ~b, ~b, a v b, b v ~b v c v a, c v a v a v b], 2000, count(2)).
tests(small_testcase1917, validity, [~b, ~a v ~c v c v ~b, c, c v ~b v c, c v c v ~a v ~b], 2000, count(2)).
tests(small_testcase1918, validity, [~b v ~b v ~b v c, ~a, a, c, c v c v ~b v a], 2000, count(0)).
tests(small_testcase1919, validity, [~c, ~c v ~b, ~a v ~b, b v a v a v ~b, c v ~a v ~c v ~a], 2000, count(3)).
tests(small_testcase1920, validity, [~c v ~a, ~a v ~b, a v c v a, c v ~b v c v ~b, c v b v ~a], 2000, count(2)).
tests(small_testcase1921, validity, [~b v ~a, ~a v ~a, a v ~b v b, b v b v c v ~c, c v a], 2000, count(2)).
tests(small_testcase1922, validity, [~b v c, ~a v b v b v ~a, a v ~c, a v ~c v a, a v ~b], 2000, count(2)).
tests(small_testcase1923, validity, [a v ~c, a v a v c, b v a v ~a v c, c v ~c v c v ~b], 2000, count(4)).
tests(small_testcase1924, validity, [~b, ~b v a v ~c, ~a v ~c v c, ~a v c v c, c], 2000, count(2)).
tests(small_testcase1925, validity, [~c v c, ~a, c v ~a v b v ~b, c v a v ~b, c v c], 2000, count(2)).
tests(small_testcase1926, validity, [~c v ~b, ~b v c v c v ~b, a, b, c v c v ~a v a], 2000, count(0)).
tests(small_testcase1927, validity, [~c v b, ~b v c v b, ~a, ~a v ~c v ~c, ~a v ~a v a v a], 2000, count(3)).
tests(small_testcase1928, validity, [~b, ~a v a, a v c, c v ~c v ~b v a, c v ~a], 2000, count(2)).
tests(small_testcase1929, validity, [~c v ~c v c, ~c v c v c, b, c, c v ~c v a v a], 2000, count(2)).
tests(small_testcase1930, validity, [~b v ~c v c, ~a v ~c v a, a v c, b v b v ~a v ~b, c v a], 2000, count(6)).
tests(small_testcase1931, validity, [a v ~c, b v ~c v c, b v ~b v ~b, c v ~c v ~a, c v ~c v c v a], 2000, count(6)).
tests(small_testcase1932, validity, [~b, ~b v ~c, ~b v ~b v c v a, a, a v a v ~a v ~a], 2000, count(2)).
tests(small_testcase1933, validity, [~c, ~a v ~b, b, c v c v ~b], 2000, count(0)).
tests(small_testcase1934, validity, [~c v b, ~c v b v c, ~b, ~a, a], 2000, count(0)).
tests(small_testcase1935, validity, [~c v a, ~b v ~c v b, ~b v b v ~a, a v ~b v ~a, b v ~a], 2000, count(4)).
tests(small_testcase1936, validity, [~c v ~c v c v ~b, ~c v a v b, ~b v ~b, c, c v ~c v a], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase1937, validity, [~c v a v ~b, ~b v ~c v ~c, a, b, b v ~b v ~b v b], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase1938, validity, [~c, ~c v ~a, ~b v ~a, ~b v c v ~c v b, ~a v c v ~b v ~b], 2000, count(3)).
tests(small_testcase1939, validity, [~b v b, ~a, a v a v ~b v ~a, b v ~a v a, b v c v ~c v ~c], 2000, count(4)).
tests(small_testcase1940, validity, [~c v ~b, ~c v ~a v c, ~b v c, c v ~c v ~a v a, c v b v ~b v ~b], 2000, count(4)).
tests(small_testcase1941, validity, [~b v ~c v c, ~a v ~c, b v ~b v ~c v ~a, b v c v ~b, c v ~c], 2000, count(6)).
tests(small_testcase1942, validity, [~b, ~a, ~a v ~c v ~c v a, b v ~b v b, c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase1943, validity, [~b v a, ~a v c v c v a, a, b, c v ~a], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase1944, validity, [~b v ~b v c v b, ~b v ~a, a v ~c, a v ~b v c, b v ~b], 2000, count(3)).
tests(small_testcase1945, validity, [~a v ~b v a, ~a v ~a v c, a v a v b, c, c v b v ~b], 2000, count(3)).
tests(small_testcase1946, validity, [~c, ~c v b v a v b, a, c v b v ~c v c, c v c], 2000, count(0)).
tests(small_testcase1947, validity, [~c v a v ~c, ~b, ~b v ~b, a v b v ~b v ~a, a v c v c], 2000, count(2)).
tests(small_testcase1948, validity, [~b v ~b v a, ~b v ~b v c v ~b, ~a v ~a v ~a v c, ~a v c v ~b v ~a, c v ~c], 2000, count(4)).
tests(small_testcase1949, validity, [~c v a, b, b v ~c, b v ~b, c v c v ~a v ~c], 2000, count(3)).
tests(small_testcase1950, validity, [~c, ~b v c, ~a v b, b v ~b v ~b v b, c], 2000, count(0)).
tests(small_testcase1951, validity, [~c v ~b v b v c, ~b, ~a v ~c v ~a, b v a v c v b, c v a], 2000, count(2)).
tests(small_testcase1952, validity, [~c, ~c v ~c v b, ~a, ~a v ~c v ~c, c], 2000, count(0)).
tests(small_testcase1953, validity, [~b v ~a v ~a v ~c, ~a, ~a v ~c, b v ~a v ~a, c v ~b v a v a], 2000, count(3)).
tests(small_testcase1954, validity, [~b v ~b v b v b, b, b v ~b v a, b v ~a v c, b v b v ~a v ~c], 2000, count(4)).
tests(small_testcase1955, validity, [~c, ~a, ~a v ~a v b, b, c v ~b v ~b v ~c], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase1956, validity, [~c, ~b, ~b v a, a v ~b, a v c v b], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase1957, validity, [~c, ~b, ~b v ~c v ~c, b, c], 2000, count(0)).
tests(small_testcase1958, validity, [~c v ~a, ~a v ~b, ~a v c v a, a, a v ~a v ~a v c], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase1959, validity, [~c v ~b v b, ~b v b, a, b v c, c v ~b v c v ~c], 2000, count(3)).
tests(small_testcase1960, validity, [~c, ~c v a v b, ~a v c v ~c v ~a, b v ~c, b v c], 2000, count(2)).
tests(small_testcase1961, validity, [~c v ~c v b, ~b, ~b v ~b v a, b v a v ~a v ~b], 2000, count(2)).
tests(small_testcase1962, validity, [a v a v c v ~c, a v c, a v c v ~b, b v ~b v c, c v ~a v ~b], 2000, count(5)).
tests(small_testcase1963, validity, [~c v ~a v ~c, ~a v b v c, a v b, b v ~a v ~b v a, b v b], 2000, count(3)).
tests(small_testcase1964, validity, [~c, ~c v ~c v b, ~a v a, a v b v c v b, c v b v ~c v ~c], 2000, count(3)).
tests(small_testcase1965, validity, [~c, ~b v b, b, b v ~c, c v a v ~c v c], 2000, count(2)).
tests(small_testcase1966, validity, [~c, ~c v ~a v ~a v c, ~b, ~b v ~a, b v c v ~a], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase1967, validity, [~c, ~a, ~a v b v c, b v ~b, b v ~b v c], 2000, count(2)).
tests(small_testcase1968, validity, [~c v ~c v ~c v b, a, b v b v ~c, c v ~c, c v ~a], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase1969, validity, [~c, ~b v c v c, a v a v ~c v ~b, a v c v a, b v ~c v ~b v a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase1970, validity, [~b v a v ~a v ~b, ~a v b v ~a, b v ~c v ~b, c v a, c v c v a], 2000, count(4)).
tests(small_testcase1971, validity, [~c, ~c v a v b v ~c, ~a v c v c, a v ~b, c v a v b v a], 2000, count(0)).
tests(small_testcase1972, validity, [~b, ~b v ~a, ~a v a v ~a v ~b, b, c v ~b], 2000, count(0)).
tests(small_testcase1973, validity, [~c, ~c v ~a, ~c v a, ~a v ~b v b v a, a v a v a v b], 2000, count(3)).
tests(small_testcase1974, validity, [~c v ~b v c, ~a v b, a v a v c, b, c], 2000, count(2)).
tests(small_testcase1975, validity, [~b v c v ~b v b, ~a v ~c v ~a, a v ~a v ~c, a v a, a v b v c v ~b], 2000, count(2)).
tests(small_testcase1976, validity, [~b, ~a v ~c v c, b], 2000, count(0)).
tests(small_testcase1977, validity, [~c v ~c v ~c, ~c v c v ~b, ~b v c, c v ~a v ~b v a, c v b v ~c], 2000, count(2)).
tests(small_testcase1978, validity, [~c, ~c v ~c v ~c v ~b, c, c v ~c v ~c v ~b, c v a v ~a], 2000, count(0)).
tests(small_testcase1979, validity, [~c v ~b v b, ~c v ~a v ~b v ~a, ~b v ~a v ~c v b, a], 2000, count(3)).
tests(small_testcase1980, validity, [~c v ~a v b, ~c v a v ~b, ~b, ~a v ~c v a, b], 2000, count(0)).
tests(small_testcase1981, validity, [~b, a v ~b v b, b, b v ~a v b v ~c, c v ~b v ~c v ~b], 2000, count(0)).
tests(small_testcase1982, validity, [~a, ~a v a, a v ~a v ~c], 2000, count(2)).
tests(small_testcase1983, validity, [~c, ~c v c, a, b v b v ~a v c, b v c v b], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase1984, validity, [~c, ~b, ~b v ~a v a, ~a v a v a v ~a, a v b v ~c v ~b], 2000, count(2)).
tests(small_testcase1985, validity, [~c v c, a v ~c v b, b, b v ~a, c v ~c v a v ~a], 2000, count(4)).
tests(small_testcase1986, validity, [a v a, b, b v ~a v a v ~a, b v a v ~c v b, b v b v b v c], 2000, count(2)).
tests(small_testcase1987, validity, [~a v ~a, ~a v b v c, a v c v ~b v c, b v ~c v c v ~b, c], 2000, count(2)).
tests(small_testcase1988, validity, [~b v ~a v ~b, ~b v c, b v ~c v ~b, b v ~b v c, b v ~a v c], 2000, count(4)).
tests(small_testcase1989, validity, [~b, ~b v b, ~a v ~c, c v ~b v a v ~a, c v c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase1990, validity, [~c, ~b v ~a, ~a, b v c v ~c v ~c, c v c], 2000, count(0)).
tests(small_testcase1991, validity, [~b v a v ~a v ~b, a v b v ~c, b, c], 2000, count(2)).
tests(small_testcase1992, validity, [~c, ~b, ~a, c, c v c], 2000, count(0)).
tests(small_testcase1993, validity, [~c, ~c v c v b v ~c, a v ~b, b v ~b, c v ~c v a], 2000, count(3)).
tests(small_testcase1994, validity, [~c v a, ~c v c, ~b v ~c v ~c, ~b v ~a v ~c v ~c, b v ~a], 2000, count(3)).
tests(small_testcase1995, validity, [~b v ~c, a v c, b v ~c, c v ~c, c v ~a v ~a], 2000, count(0)).
tests(small_testcase1996, validity, [~b, a v b v ~b, b v c, b v c v a, c v b], 2000, count(2)).
tests(small_testcase1997, validity, [a, a v ~a, a v a v ~c v c, b v ~c, c v a v a v ~a], 2000, count(3)).
tests(small_testcase1998, validity, [~c v b v a v ~c, ~c v c v a v ~a, ~b, ~b v ~c v c v ~c, b v ~a], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase1999, validity, [~a, ~a v a v a v ~c, a v ~c v c, c v ~c, c v c], 2000, solution([(a, f) ,(c, t)])).
tests(small_testcase2000, validity, [~b v c, a, a v ~c, a v b, a v c], 2000, count(3)).
tests(small_testcase2001, validity, [~b v ~b v ~c, ~b v c, b v a v ~a v c, b v b, c], 2000, count(0)).
tests(small_testcase2002, validity, [~a v a v ~b v ~c, a, a v c, b v b v ~a, c v ~b], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase2003, validity, [~c v ~b v ~a v ~a, ~a v b v ~c, ~a v b v a v c, b, c v ~b v ~a], 2000, count(2)).
tests(small_testcase2004, validity, [~c v ~c, ~c v ~a v ~c v b, ~a v c v ~c v a, a, a v ~b], 2000, count(2)).
tests(small_testcase2005, validity, [~c v ~c v ~a, ~b, a v ~c v ~b v c], 2000, count(3)).
tests(small_testcase2006, validity, [~c v c v a, ~b v ~a v b, b v ~a, b v c, c v ~c v a], 2000, count(5)).
tests(small_testcase2007, validity, [~c v ~c, ~c v ~a v a, ~c v c v ~c, b v ~c v b, c v ~b], 2000, count(2)).
tests(small_testcase2008, validity, [~b v ~c, b, c, c v ~c v c v ~a, c v b], 2000, count(0)).
tests(small_testcase2009, validity, [~c v ~c v ~c v ~c, ~c v ~b v ~c, ~c v a v ~c v b, ~c v c, a v a], 2000, count(2)).
tests(small_testcase2010, validity, [~c v c, ~a v a, ~a v b, a v ~b v ~a v a, c], 2000, count(3)).
tests(small_testcase2011, validity, [~c v ~a v ~b v ~a, ~b, a v a v ~b, c v ~b, c v b v ~a v c], 2000, count(3)).
tests(small_testcase2012, validity, [~c, ~b v ~c, ~b v ~b v c, b v b v c, c], 2000, count(0)).
tests(small_testcase2013, validity, [~c v ~a v ~b v a, ~b, ~b v ~b, a v ~c v ~b, b], 2000, count(0)).
tests(small_testcase2014, validity, [~c, ~c v ~b v ~c v ~a, ~c v a v c, a v b v c, c], 2000, count(0)).
tests(small_testcase2015, validity, [~b v c v c v c, a v ~c v ~b v ~a, a v b, c v ~c, c v ~a], 2000, count(3)).
tests(small_testcase2016, validity, [~c, ~b v c, ~a v ~c v ~a v c, b, c v c], 2000, count(0)).
tests(small_testcase2017, validity, [~b v ~c v c v ~a, a, a v b, b, b v b v ~c], 2000, count(2)).
tests(small_testcase2018, validity, [~c v ~b v ~a v c, ~a, ~a v ~a v a, a, c], 2000, count(0)).
tests(small_testcase2019, validity, [~c v a v c, ~b, ~b v ~b, c, c v b v ~a v ~a], 2000, count(2)).
tests(small_testcase2020, validity, [~c v ~b, a v a v b, b v ~b v c, b v c, c v c v ~b v ~b], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase2021, validity, [~b v c v a, a, c v ~b, c v a v b v ~c, c v c v a v c], 2000, count(3)).
tests(small_testcase2022, validity, [~c, ~c v ~c, ~b v a v a v ~b, ~a v c v b v a, a v ~b v ~b], 2000, count(3)).
tests(small_testcase2023, validity, [~c v c v ~c, ~c v c v ~a v b, ~b, ~a v c, a v b v ~c v c], 2000, count(3)).
tests(small_testcase2024, validity, [~c, ~b v a, ~b v b v a, ~a v b v ~a v c, b v ~b v ~b], 2000, count(2)).
tests(small_testcase2025, validity, [~c v a v a v ~a, ~c v c v ~c, ~b, c v ~c v ~b, c v ~a], 2000, count(3)).
tests(small_testcase2026, validity, [~c v ~b v c v c, ~c v b, ~b v a, ~b v b, b v b v a], 2000, count(3)).
tests(small_testcase2027, validity, [~c, ~b v ~a, ~a], 2000, count(2)).
tests(small_testcase2028, validity, [~c v ~a v a v b, ~b v ~b v a v c, ~a v ~c v ~c, a v a, c], 2000, count(0)).
tests(small_testcase2029, validity, [~b, a, a v ~b v c, a v b v ~a v ~a, a v c v c], 2000, count(2)).
tests(small_testcase2030, validity, [~c, ~c v ~a, ~b, ~b v a, b v ~c v b], 2000, count(2)).
tests(small_testcase2031, validity, [~c, ~c v c v b v a, ~b v a v ~a, ~a v b v b v ~c, a v c v b], 2000, count(3)).
tests(small_testcase2032, validity, [~c v b v a v ~a, b v c v c, c, c v ~c v c], 2000, count(4)).
tests(small_testcase2033, validity, [~c v ~c v b, ~c v b, ~b v a v ~a v a, ~a, a v b v c v ~c], 2000, count(3)).
tests(small_testcase2034, validity, [~c v a, ~a v a v ~c, a v a, b, b v ~a v b v ~a], 2000, count(2)).
tests(small_testcase2035, validity, [~b v ~c v a v ~a, ~a v ~a, ~a v a, ~a v b v b v ~a, a v a], 2000, count(0)).
tests(small_testcase2036, validity, [~c v ~c v ~b, ~b, ~b v b v a v a, ~a, a v ~b v ~a], 2000, count(2)).
tests(small_testcase2037, validity, [~c v ~a v a, ~a v ~b, b v b v b, c v ~a], 2000, count(2)).
tests(small_testcase2038, validity, [~c v b v b v ~c, ~b v b, ~a v ~b, a v ~c v ~b, c], 2000, count(0)).
tests(small_testcase2039, validity, [~c v a v c v b, ~c v c v b, ~b v ~c v b, a v ~a v c, a v c v a v b], 2000, count(7)).
tests(small_testcase2040, validity, [~b v a v ~b, ~b v c, a v a, b v ~c v ~b v c, c], 2000, count(2)).
tests(small_testcase2041, validity, [~b v ~b v ~a, ~b v c, ~b v c v a, b v ~b v ~a v ~c, c v b v ~b], 2000, count(5)).
tests(small_testcase2042, validity, [~b v b v c, a v b v a, b, b v ~c v c v b, b v b v ~a], 2000, count(4)).
tests(small_testcase2043, validity, [~a v b v c v ~b, a v a v ~c v ~c, b, b v a, b v a v ~c v b], 2000, count(3)).
tests(small_testcase2044, validity, [~c, ~b, ~b v c, ~a v ~c v ~c, b v ~c v c], 2000, count(2)).
tests(small_testcase2045, validity, [~b v a v a, ~b v c v a v c, ~a v b v ~b, a v a v a, c v b v ~a], 2000, count(3)).
tests(small_testcase2046, validity, [~b v c, ~a v b v ~c, b, b v a v ~c, c v ~a], 2000, count(2)).
tests(small_testcase2047, validity, [~b v c v ~a, a v ~a v b v c, a v c, a v c v a, c v a], 2000, count(5)).
tests(small_testcase2048, validity, [~c v ~c v ~a v ~a, ~c v a, ~a v a v b v a, b, b v ~a v ~c v ~b], 2000, count(2)).
tests(small_testcase2049, validity, [~a, a v a, b v b v ~c, b v b v c, c v b], 2000, count(0)).
tests(small_testcase2050, validity, [~c v ~c, ~b, ~a v b v ~b, a v ~a], 2000, count(2)).
tests(small_testcase2051, validity, [~b v c v ~c, ~a v ~c v ~a v a, b v ~c v a v ~b, b v ~b v b v ~c, c v ~c], 2000, count(8)).
tests(small_testcase2052, validity, [~a v ~c v ~b v ~a, a v ~b v ~c, b v ~c, b v a v b v b, b v c], 2000, count(2)).
tests(small_testcase2053, validity, [~b v b, a v ~c v a v a, b v b, c v ~c, c v a], 2000, count(2)).
tests(small_testcase2054, validity, [~c v a v ~c v ~a, ~b v b v ~b v b, ~a v ~a, a v ~a v ~c v ~c, b v ~b v ~a], 2000, count(4)).
tests(small_testcase2055, validity, [~b, b v c v c, c, c v ~a v c, c v c v b], 2000, count(2)).
tests(small_testcase2056, validity, [a v b v b v ~a, a v b v c, a v c, b, c v ~b], 2000, count(2)).
tests(small_testcase2057, validity, [b v ~b, b v a v ~b v c, c v ~c v c, c v b v a], 2000, count(7)).
tests(small_testcase2058, validity, [~c, ~c v ~c v a v ~a, ~a v ~c v ~b, a v a v ~a, a v b], 2000, count(3)).
tests(small_testcase2059, validity, [~b v ~c, ~b v ~a v ~c v ~c, ~a v ~a v c v c, ~a v b, a v a v b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase2060, validity, [~c v ~a, ~c v c, a v a, b v c, c v b], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase2061, validity, [~a, b, b v c v b v a, c, c v ~b], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase2062, validity, [~c, ~b v ~a, a v a, b v ~c v ~c v ~b, b v c v ~b v b], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase2063, validity, [~c v a v ~a, a v ~b, a v a v a v c, a v b v ~c, a v c], 2000, count(4)).
tests(small_testcase2064, validity, [a, a v a v ~c v c, b, c v ~c v ~a, c v c], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase2065, validity, [~c v ~b v ~c, ~a v ~a v ~a v ~c, ~a v b, a v ~c v b, c], 2000, count(0)).
tests(small_testcase2066, validity, [~c, ~b, ~a v a, b v ~a v ~a, c v ~c v b], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase2067, validity, [~b v ~b v a, a, a v ~c, a v a, a v b v ~b], 2000, count(4)).
tests(small_testcase2068, validity, [~a v ~c v ~b v c, a v b v b v c, a v c v ~c v ~b, b v ~a v b, b v a v ~b], 2000, count(5)).
tests(small_testcase2069, validity, [~c v b v b v ~b, ~a v ~c v c v ~c, a v b v c, a v c v b v b, c v b v ~c v ~b], 2000, count(7)).
tests(small_testcase2070, validity, [~b v a v b v ~a, ~b v c, ~a, b, c v a v a], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase2071, validity, [~b v b v ~c, ~a v ~c, ~a v b v a, ~a v c v ~b v c, a v ~b v b], 2000, count(5)).
tests(small_testcase2072, validity, [~c v ~b v b, ~b v ~a v a, ~a v a v ~a v ~b, a v ~c, b v c v ~c], 2000, count(6)).
tests(small_testcase2073, validity, [~c v b v a, ~b v ~a, ~b v c v ~a, ~a, c v ~a v a], 2000, count(3)).
tests(small_testcase2074, validity, [~b, ~a v b, a v ~b, a v ~b v ~a v ~b, b v ~c], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase2075, validity, [~c, ~c v ~a v ~a v ~c, b, b v a, c v ~a v b v ~c], 2000, count(2)).
tests(small_testcase2076, validity, [~c, ~c v ~b v c v ~a, ~a, b, b v ~c v b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase2077, validity, [~a v ~c v b, a, b v ~c, b v b v b v ~c, b v c v ~b v ~c], 2000, count(3)).
tests(small_testcase2078, validity, [~b, ~b v b v b v ~a, ~b v c v ~a v b, ~b v c v b, a v ~a v ~c v c], 2000, count(4)).
tests(small_testcase2079, validity, [~c, ~a, a, b, c], 2000, count(0)).
tests(small_testcase2080, validity, [~b, ~b v ~b v b, a v ~a v ~a, b], 2000, count(0)).
tests(small_testcase2081, validity, [~c v a v ~a v c, ~b v ~c, ~b v ~b v b v a, c v ~c v b v b, c v ~b], 2000, count(4)).
tests(small_testcase2082, validity, [~b v ~a v ~b v ~b, ~b v c v ~c v ~b, ~b v c v c v b, a, a v ~c v b v ~c], 2000, count(2)).
tests(small_testcase2083, validity, [~b v ~b v ~c v ~c, a, b, c, c v c v b v ~c], 2000, count(0)).
tests(small_testcase2084, validity, [~b v c, ~a v ~b, a v ~b v a, b], 2000, count(0)).
tests(small_testcase2085, validity, [~b v ~a, ~a, b, b v ~b v b v a, c v a], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase2086, validity, [~b, ~b v ~a v ~b, ~a v ~b v a, ~a v a v c v a, a v b v ~c v ~a], 2000, count(4)).
tests(small_testcase2087, validity, [~c v ~a, ~c v b v ~a v ~c, a v b v c, b, c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase2088, validity, [~c v a v ~a, ~b v a v ~a, ~b v a v a, ~a v ~b v b v ~c, c v c v ~c], 2000, count(6)).
tests(small_testcase2089, validity, [~b, ~a v ~b, ~a v ~b v a, a v ~a v c, c v b v b], 2000, count(2)).
tests(small_testcase2090, validity, [~b v ~b v ~a, ~a v c, a, a v ~b v c, a v ~a v ~a v ~a], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase2091, validity, [~a, a, a v b v c, b, b v a v a v b], 2000, count(0)).
tests(small_testcase2092, validity, [~c v ~c v ~b, ~c v ~b v ~c, ~c v ~a v c, ~b, b v ~a v ~b v a], 2000, count(4)).
tests(small_testcase2093, validity, [~c v c v ~a, ~b, ~a, a v c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase2094, validity, [~c, ~a v b v ~a v b, a, b v a v ~c v a, c v b], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase2095, validity, [~c, ~a, b v a v b, b v a v b v ~c], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase2096, validity, [~c v ~c, ~b v a, ~a v a, b, b v ~a], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase2097, validity, [~c v a v b v b, ~b v ~c, ~b v b v ~b v ~a, ~a, b v ~a v ~a v c], 2000, count(2)).
tests(small_testcase2098, validity, [~c v a v ~b, ~b v b v ~a v c, a v ~a, a v c v ~a, c v ~a], 2000, count(5)).
tests(small_testcase2099, validity, [~c v ~c v b v a, ~b v c v ~b, ~a, ~a v b v a, b v c v a], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase2100, validity, [~c v c v b v a, ~b v c, ~a, ~a v a v a v ~c, c], 2000, count(2)).
tests(small_testcase2101, validity, [~a v ~a v c v c, ~a v b v b v c, c v a, c v a v ~c, c v c v c], 2000, count(4)).
tests(small_testcase2102, validity, [~b v c v ~c v ~b, ~a v ~b v ~a v ~c, a, b v c v c, c v ~b v a], 2000, count(2)).
tests(small_testcase2103, validity, [~b v ~c v ~a, ~b v ~b, a, b v a, b v b v b], 2000, count(0)).
tests(small_testcase2104, validity, [~c v ~b v a v a, a, a v ~b, c], 2000, count(2)).
tests(small_testcase2105, validity, [~c, ~b, ~a v ~b, ~a v c v a, b v b v c v ~c], 2000, count(2)).
tests(small_testcase2106, validity, [~b, ~b v ~c v ~a, ~a, b v c, c v ~c v ~b v ~c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase2107, validity, [~b v ~a v a, a, a v a v ~c, b v ~a v b v ~b, b v c v c], 2000, count(3)).
tests(small_testcase2108, validity, [a, a v b, b v ~b v c, b v a v ~c v ~c, c], 2000, count(2)).
tests(small_testcase2109, validity, [~c, ~c v ~b v ~b v ~c, ~a v b v c, b v ~b v c v b, c], 2000, count(0)).
tests(small_testcase2110, validity, [~b, ~b v a v a v c, ~a v ~c, b v ~c v c v ~c, b v ~b], 2000, count(3)).
tests(small_testcase2111, validity, [~b v ~b v c, a, b v ~c v ~c, b v b], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase2112, validity, [~c v b, ~c v c v ~b, ~b v ~c, ~a], 2000, count(2)).
tests(small_testcase2113, validity, [~c v c, ~b v ~c v ~b, a v ~b, a v c v a, c], 2000, count(2)).
tests(small_testcase2114, validity, [~c, ~b v a v ~c, ~a, a v ~a v c v ~a, c], 2000, count(0)).
tests(small_testcase2115, validity, [a v ~b, a v a v ~a v ~c, a v c, c v ~a v ~a, c v b v a], 2000, count(3)).
tests(small_testcase2116, validity, [~c, ~c v ~a v a, a, a v a v ~a v ~b], 2000, count(2)).
tests(small_testcase2117, validity, [~c v ~a v ~b, ~b v c v ~c, a v ~c v a, a v ~a, b v ~b v b], 2000, count(5)).
tests(small_testcase2118, validity, [~c v a, ~b v a v a v ~b, ~a v ~b, ~a v b, b v c v b], 2000, count(0)).
tests(small_testcase2119, validity, [~c v ~c v b v a, ~b v ~a v ~a, a v ~c v ~a, c v a v c, c v b v ~c], 2000, count(3)).
tests(small_testcase2120, validity, [~b v ~c, ~a v ~b v ~a v ~b, c v ~b v a v ~b, c v b, c v c], 2000, count(2)).
tests(small_testcase2121, validity, [~c v ~b, ~b, b, c, c v ~c v ~a], 2000, count(0)).
tests(small_testcase2122, validity, [~c, ~a, a v ~a v ~c v ~b, c, c v c v b], 2000, count(0)).
tests(small_testcase2123, validity, [~c, ~c v ~b, ~b, ~a v c, c v a], 2000, count(0)).
tests(small_testcase2124, validity, [~c, ~c v a v ~b, ~b v b, a v ~b v c, b v ~a v ~a], 2000, count(2)).
tests(small_testcase2125, validity, [~c v b, b v ~b v c, b v ~a v ~c v a, b v a, c], 2000, count(2)).
tests(small_testcase2126, validity, [~c v a v ~a, ~b v b v ~c, ~a v ~b v ~b v c, b v ~c v b, c v b v c v c], 2000, count(3)).
tests(small_testcase2127, validity, [~c v ~b, ~c v c v ~c v ~c, ~b v ~a v ~c v b, ~a v a, c v ~b v ~b], 2000, count(4)).
tests(small_testcase2128, validity, [~a v ~c v ~c, a v b v ~c, c, c v ~b v a v b, c v ~b v c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase2129, validity, [~c, ~b v a v b v ~b, ~a, b, c v a], 2000, count(0)).
tests(small_testcase2130, validity, [~c, a v ~a v ~a v b, b, c v ~a v ~c, c v b v ~a v ~b], 2000, count(2)).
tests(small_testcase2131, validity, [~c, ~a v ~c v a v a, ~a v c v ~b v a, a v ~b v ~b v ~a, c], 2000, count(0)).
tests(small_testcase2132, validity, [~c, ~c v a v a, ~c v b v ~a, ~b v c, ~a v b v a v a], 2000, count(2)).
tests(small_testcase2133, validity, [~c v ~c v ~c v ~a, ~c v ~b, a, c, c v b v ~a], 2000, count(0)).
tests(small_testcase2134, validity, [~c v ~b v b, ~c v ~b v b v b, ~b, ~b v ~c v c, b], 2000, count(0)).
tests(small_testcase2135, validity, [~b v ~c v b v ~a, ~b v ~b v ~a v ~c, ~b v b v a v ~b, ~a v ~a v c, c v ~b v ~b v c], 2000, count(4)).
tests(small_testcase2136, validity, [~b, a v ~b, a v ~a v b, a v c, b], 2000, count(0)).
tests(small_testcase2137, validity, [~b, ~b v ~c, ~a v c v ~a v a, a, c v a v ~b v c], 2000, count(2)).
tests(small_testcase2138, validity, [~c v ~c v b, ~b, ~b v ~a v ~a v ~c, ~a v ~a v a, a v ~a v ~b v ~b], 2000, count(2)).
tests(small_testcase2139, validity, [~c v ~b v ~a, ~b, ~a, ~a v b v a, c v ~b], 2000, count(2)).
tests(small_testcase2140, validity, [~b v ~b v ~b, ~b v a v b v c, ~b v c v a, ~a v ~c, c v b v ~c], 2000, count(3)).
tests(small_testcase2141, validity, [~a v ~a v b, a, a v ~c, b v ~a, c v ~b], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase2142, validity, [~c v ~c, ~c v ~a, a, a v ~b, b v ~a], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase2143, validity, [~c v c v b v ~c, ~b v ~c v a, ~b v b v c v a, ~a, a v a], 2000, count(0)).
tests(small_testcase2144, validity, [~b, ~b v ~c v ~a, ~b v ~b, ~a v ~a v a, b], 2000, count(0)).
tests(small_testcase2145, validity, [~b, a v ~a v ~b v b, b, b v b, b v b v ~a v ~c], 2000, count(0)).
tests(small_testcase2146, validity, [~b v c v ~a v a, ~a, ~a v a, b v ~c, c v ~b v b], 2000, count(3)).
tests(small_testcase2147, validity, [~c v ~c, ~a v ~c, a, c, c v ~a v ~a v ~b], 2000, count(0)).
tests(small_testcase2148, validity, [~c v a, ~b, a, b, c v b v ~c v ~a], 2000, count(0)).
tests(small_testcase2149, validity, [~b v ~b v a, ~b v b v ~c v b, ~a v ~b, a, b v b v c v ~b], 2000, count(2)).
tests(small_testcase2150, validity, [~a v c, a v ~c, a v b, c, c v ~c], 2000, count(2)).
tests(small_testcase2151, validity, [~c v c v ~a, b, b v c v b v a, c v ~a], 2000, count(3)).
tests(small_testcase2152, validity, [~b v b v ~b, ~a, ~a v ~c v b v c, ~a v ~a v a v c, c v c], 2000, count(2)).
tests(small_testcase2153, validity, [~c v ~c v ~a v ~b, ~a, a, a v ~c v ~c v c, c v c v ~a], 2000, count(0)).
tests(small_testcase2154, validity, [~c, ~c v b v c, ~c v c, ~a v ~a, b v ~b v c], 2000, count(2)).
tests(small_testcase2155, validity, [~b, a v ~c v a, a v a, b v ~c v b v ~b, c v ~a v a v b], 2000, count(2)).
tests(small_testcase2156, validity, [~c v b, ~a, a v b, b v ~c v ~a, b v ~c v b], 2000, count(2)).
tests(small_testcase2157, validity, [~c, ~b v a, ~b v c v ~c, b v ~c v a v ~a, c v c v ~c], 2000, count(3)).
tests(small_testcase2158, validity, [~c v b v c v ~a, ~b v b v ~b v ~b, ~b v b v b, ~a, b], 2000, count(2)).
tests(small_testcase2159, validity, [~c v ~b, ~a v c v ~b v b, b v ~a, c v ~c, c v b v ~b v ~c], 2000, count(4)).
tests(small_testcase2160, validity, [~c v ~b, ~c v a, ~b v a v a, a v ~b v ~b v a, b], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase2161, validity, [~c, ~a, a, a v c v ~b v b, b v ~b v ~b], 2000, count(0)).
tests(small_testcase2162, validity, [~c, ~b, a, a v a v ~a, c v ~c v a v a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase2163, validity, [~a v ~c v b v b, ~a v a v ~a v a, ~a v b, a, b v b], 2000, count(2)).
tests(small_testcase2164, validity, [~c, ~c v ~b v a, ~a v ~c, b v a, b v b], 2000, count(2)).
tests(small_testcase2165, validity, [~c v ~b v ~b, ~a v ~c, a v b, c, c v ~c v ~a], 2000, count(0)).
tests(small_testcase2166, validity, [~b v a, ~b v c v ~c v ~b, a, b, c v ~c v c], 2000, count(2)).
tests(small_testcase2167, validity, [~b v ~c, b, b v ~b v b v c, c, c v b], 2000, count(0)).
tests(small_testcase2168, validity, [~c, ~a, ~a v b v a, a v a], 2000, count(0)).
tests(small_testcase2169, validity, [a v c v ~c v b, b v ~b v ~b v a, b v a v ~b v ~c, c, c v c v ~a], 2000, count(4)).
tests(small_testcase2170, validity, [~c, ~b, ~a v ~b, ~a v a v b v ~a, a v a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase2171, validity, [~c v a v a, ~a v ~c v c, ~a v ~a, a v c v b v c, c v ~b v c], 2000, count(0)).
tests(small_testcase2172, validity, [~c v a, ~a, b, b v ~b v ~c, c v ~b v b v a], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase2173, validity, [~c, ~a, ~a v ~c v ~b, ~a v c v b, c v ~a v ~b v b], 2000, count(2)).
tests(small_testcase2174, validity, [~c v ~c v b, ~c v ~b, ~b, ~a v ~c, c v a v b v ~a], 2000, count(2)).
tests(small_testcase2175, validity, [~c, ~c v ~b v a v ~b, ~b, ~a v a v c, b v c v a v b], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase2176, validity, [~c v ~b v b, ~a v ~b v ~c v ~a, a v ~c v c v ~c, c v a v ~c, c v c v b v ~b], 2000, count(7)).
tests(small_testcase2177, validity, [~c, ~c v b v ~a v ~c, ~b, c v ~b], 2000, count(2)).
tests(small_testcase2178, validity, [~b, a v ~c, a v ~b v ~a, b v ~c v ~a, c v a v c v ~a], 2000, count(2)).
tests(small_testcase2179, validity, [~c v ~c v ~a v a, ~c v ~a v a, ~b, a, c], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase2180, validity, [~b v ~b v ~c v c, a, b v ~b v ~b, c, c v ~c v a], 2000, count(2)).
tests(small_testcase2181, validity, [~c, ~c v a v ~c v a, ~a, b v c v c v c, c], 2000, count(0)).
tests(small_testcase2182, validity, [~c v ~a, ~c v ~a v b, ~b, ~b v c v c v b, a v b v b v ~c], 2000, count(2)).
tests(small_testcase2183, validity, [~b v b v ~b, ~a v ~c v c, a, a v b, b v ~a], 2000, count(2)).
tests(small_testcase2184, validity, [~b, ~b v a v ~b, a, b, b v a v c v ~a], 2000, count(0)).
tests(small_testcase2185, validity, [~b v ~a v ~a, a v ~b v ~b v b, a v c, c v b], 2000, count(3)).
tests(small_testcase2186, validity, [~b v ~c, ~b v a, ~b v c, b v a, c v ~a], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase2187, validity, [~c v a v b v ~c, ~b v a v c v ~a, a, a v ~a v ~a v ~b, b v ~c v a v ~a], 2000, count(4)).
tests(small_testcase2188, validity, [~a v a v ~c, a v c, b, c v ~c, c v a v ~c v b], 2000, count(3)).
tests(small_testcase2189, validity, [~c v a v ~b v ~c, ~a v ~c, a v a v a v ~b, a v c, c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase2190, validity, [~b v ~c v b, ~a v a v c, b v ~a v ~a v b, c v ~a, c v c v ~b], 2000, count(4)).
tests(small_testcase2191, validity, [~a, ~a v ~b v ~a v ~c, ~a v ~a v ~a v a, b v ~c v c v ~b, c], 2000, count(2)).
tests(small_testcase2192, validity, [~b v ~b, ~b v b, ~a v c v a v ~b, c v ~c, c v ~a v ~c], 2000, count(4)).
tests(small_testcase2193, validity, [~c, ~b, ~b v b, ~b v c v ~a, a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase2194, validity, [~b v ~b v a, ~a v c, a v ~c, a v a v a, c v ~c v ~c], 2000, count(2)).
tests(small_testcase2195, validity, [~c v c v a, ~b, b, c, c v b v ~a v ~c], 2000, count(0)).
tests(small_testcase2196, validity, [~c v a, ~b, ~b v b v b v ~c, ~a v ~c, ~a v a], 2000, count(2)).
tests(small_testcase2197, validity, [~b v a v b, ~a v ~c v a v b, a, a v ~a v ~c v ~c, b v a v b v a], 2000, count(4)).
tests(small_testcase2198, validity, [~b v a v b v ~b, ~a, ~a v b v ~b v ~b, a v ~a v a v ~c, c v a], 2000, count(2)).
tests(small_testcase2199, validity, [~c, ~a v b v ~c, ~a v c v b v ~c, a v ~b v a v b, b v c v ~b v b], 2000, count(4)).
tests(small_testcase2200, validity, [~c v ~a, ~c v b, ~b v ~c, ~a, c v ~c], 2000, count(2)).
tests(small_testcase2201, validity, [~a v ~a v ~c v c, a v ~a, b, b v b v a, c v ~c], 2000, count(4)).
tests(small_testcase2202, validity, [~c v b v a v ~b, ~a v ~b, b, b v ~b v ~c v ~a, c v b v b], 2000, count(2)).
tests(small_testcase2203, validity, [~c v ~b, ~b v ~b v a, a v ~b v ~c, a v a v ~b, b v ~a v a v ~c], 2000, count(5)).
tests(small_testcase2204, validity, [~c, ~c v a, c v a, c v a v a, c v b v c v ~c], 2000, count(2)).
tests(small_testcase2205, validity, [~c, ~b v ~b, ~b v c v c, a v b, c], 2000, count(0)).
tests(small_testcase2206, validity, [~c v b v ~b v ~b, ~b v ~c v ~a, b v ~b v c, c v ~c v ~a, c v ~b v b], 2000, count(7)).
tests(small_testcase2207, validity, [~c v ~c v a, ~c v c v ~c v b, ~a, b, c v a v b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase2208, validity, [~b, a v ~c v ~a, a v ~a v a, a v c v ~c], 2000, count(4)).
tests(small_testcase2209, validity, [~c, ~a, b v c v ~c, c, c v ~a v a v ~a], 2000, count(0)).
tests(small_testcase2210, validity, [~c, ~b v a v a v ~b, ~a, b v ~a v c v c, c], 2000, count(0)).
tests(small_testcase2211, validity, [~c, ~c v ~c, ~c v a v ~b v ~a, ~a v b v ~b, b v b v b], 2000, count(2)).
tests(small_testcase2212, validity, [~b, ~b v b v c, b, b v a v a v a, c v b], 2000, count(0)).
tests(small_testcase2213, validity, [~a, ~a v ~b, a v ~a v a, b v ~c, b v b], 2000, count(2)).
tests(small_testcase2214, validity, [~c, ~b v ~a v c, ~b v a v ~a v ~a, a v ~a v ~b, c], 2000, count(0)).
tests(small_testcase2215, validity, [~b, ~b v ~c v a, ~b v ~c v c, ~b v a v ~b v ~a, b v ~b v a v b], 2000, count(4)).
tests(small_testcase2216, validity, [~b v b v ~a v ~a, ~b v b v b v c, b, b v a, c v ~a v ~a], 2000, count(3)).
tests(small_testcase2217, validity, [~a, b, b v b v a, b v b v c v ~a, c v b], 2000, count(2)).
tests(small_testcase2218, validity, [~c v ~b v c, ~a v b, ~a v c v a, b v b v ~b, c v b v b v b], 2000, count(5)).
tests(small_testcase2219, validity, [~c v a v b, ~a, a v ~a v a, b, c v c v ~a], 2000, count(2)).
tests(small_testcase2220, validity, [~c, ~c v ~a v ~b v ~c, ~b, ~a v ~c, ~a v ~b v ~b v ~c], 2000, count(2)).
tests(small_testcase2221, validity, [~b v ~c, ~b v b v b v ~b, ~a v ~c v a v ~a, a, c], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase2222, validity, [~b, b, b v ~c v ~a v a, b v c v a v ~b, c v c], 2000, count(0)).
tests(small_testcase2223, validity, [~c v b v ~a, ~a v ~b, ~a v b, a v b v b v ~a, c], 2000, count(2)).
tests(small_testcase2224, validity, [~c, ~c v b, ~a v ~c, a v c v ~b, b v a v ~b], 2000, count(3)).
tests(small_testcase2225, validity, [~c, ~b v ~a, b v a, b v b v b, b v c v ~a v a], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase2226, validity, [~c v c, ~b, ~a, b, b v ~c v b], 2000, count(0)).
tests(small_testcase2227, validity, [~c v b v ~a, ~b v ~b v b, ~a, a v ~b v ~b v ~a, a v a v b], 2000, count(2)).
tests(small_testcase2228, validity, [~c, ~c v ~c, ~a v ~b, ~a v c v ~c v c, b v ~a v ~b v ~c], 2000, count(3)).
tests(small_testcase2229, validity, [~c v ~c v b, ~c v c v ~a v ~b, a, a v a v ~c, b], 2000, count(2)).
tests(small_testcase2230, validity, [~c v a, ~c v b, ~b, a, a v ~a v ~b v ~b], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase2231, validity, [~a, ~a v ~b v a, a v a v ~c v ~b, b v b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase2232, validity, [~c, ~b, ~a v a v ~c, ~a v a v ~c v ~a, a v ~b v a v a], 2000, count(2)).
tests(small_testcase2233, validity, [~c v c, ~b, ~a, b v ~c, b v b v ~a v c], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase2234, validity, [~c, ~c v ~b v b, a v ~c v ~a v a, b v b v ~c v b, c], 2000, count(0)).
tests(small_testcase2235, validity, [~c v ~c v ~a, ~c v ~a v c v a, ~b v a v c, ~a v b, a v ~a v a v a], 2000, count(4)).
tests(small_testcase2236, validity, [~a, b, b v ~c, b v ~b v c, b v ~a v b], 2000, count(2)).
tests(small_testcase2237, validity, [~c v ~a v ~b v a, ~a, a v a v a v a, b, c], 2000, count(0)).
tests(small_testcase2238, validity, [~c v ~c, a v c v a v c, b v c v ~a, c v b v ~a v ~b, c v c], 2000, count(0)).
tests(small_testcase2239, validity, [~c, ~c v ~a v ~a v a, ~b, a v ~b v ~a v b, b v a v ~b v b], 2000, count(2)).
tests(small_testcase2240, validity, [~b, ~b v ~c v a v ~c, ~b v c, ~a v a v ~a v ~c, a v ~b v ~b v ~a], 2000, count(4)).
tests(small_testcase2241, validity, [~b, ~a, ~a v ~a v ~b, a, c v ~a v a v ~c], 2000, count(0)).
tests(small_testcase2242, validity, [~c v b, ~b v ~b v ~c v ~c, a v ~c v b, b v a v ~a v ~a, c v c], 2000, count(0)).
tests(small_testcase2243, validity, [~c, ~b, ~a v a v c, a v a v ~a v c, c v ~b], 2000, count(2)).
tests(small_testcase2244, validity, [~c v ~c v a v a, ~c v ~b v ~a, ~b v c v ~b, ~a v ~c, b v c v b], 2000, count(0)).
tests(small_testcase2245, validity, [~c, ~b, ~b v ~a v a v ~a, b, c], 2000, count(0)).
tests(small_testcase2246, validity, [~b v ~c v a, a v c, c, c v ~b v ~a v ~a], 2000, count(3)).
tests(small_testcase2247, validity, [~c v ~a, ~a, ~a v b v ~b, a v a v ~a, c v ~a v ~c v ~a], 2000, count(4)).
tests(small_testcase2248, validity, [~b, ~a, ~a v c v a, a, c v ~b], 2000, count(0)).
tests(small_testcase2249, validity, [~c, ~b, ~a v c v ~b, a, c v ~a v ~b v ~b], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase2250, validity, [~a v ~a v c, b v ~a v ~c v b, b v a v c v ~b, b v b, c v a v ~b v c], 2000, count(2)).
tests(small_testcase2251, validity, [~a v b, a, b v ~c v a v ~b, c v b v b v ~c, c v c v ~b], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase2252, validity, [~b v c v ~c, ~a v ~c, ~a v ~a, ~a v a v ~a, ~a v c v a], 2000, count(4)).
tests(small_testcase2253, validity, [~b v b, b v ~b v ~c v a, b v ~b v ~a, c], 2000, count(4)).
tests(small_testcase2254, validity, [~c v c v c v b, ~a v b v ~c v ~a, a v ~b, b v b v ~a v ~c, b v b v b], 2000, count(2)).
tests(small_testcase2255, validity, [a, a v ~c, a v a, b, b v b v ~b v ~a], 2000, count(2)).
tests(small_testcase2256, validity, [~c v c v b, ~b v ~b, a v ~b v ~b v b, b v a, c v ~b v c], 2000, count(2)).
tests(small_testcase2257, validity, [~a, b v ~b v ~b v ~b, b v ~b v ~b v c, b v b v b v ~c, c v a v ~a v c], 2000, count(3)).
tests(small_testcase2258, validity, [~c v ~a v a, ~c v c, ~a v c v ~a v c, a v ~a], 2000, count(3)).
tests(small_testcase2259, validity, [~c v c v a v ~b, ~a v ~c v ~b, ~a v ~a v ~b, ~a v c, b], 2000, count(2)).
tests(small_testcase2260, validity, [~c v ~b v ~b, ~b v ~c v c, ~a, ~a v c, c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase2261, validity, [~b, ~a, ~a v a v ~b, a v b, c v ~b], 2000, count(0)).
tests(small_testcase2262, validity, [~c v ~a v ~a, ~b v ~c, ~b v a v a, a v a v b, a v c], 2000, count(2)).
tests(small_testcase2263, validity, [~c v ~b v c, ~c v c v ~c, ~a, a v b v c, c v ~c], 2000, count(3)).
tests(small_testcase2264, validity, [~c, ~c v ~c v ~c v ~a, ~b v c v ~b, a v ~b, c], 2000, count(0)).
tests(small_testcase2265, validity, [~c, ~c v b v ~a v ~c, ~a, a], 2000, count(0)).
tests(small_testcase2266, validity, [~b v c v a v c, a v ~a v b, a v b v b v a, b, c v a v c], 2000, count(3)).
tests(small_testcase2267, validity, [~b v a, a v ~c, a v ~b v ~c, b v c v ~c, c v ~a v b], 2000, count(4)).
tests(small_testcase2268, validity, [~c, a v ~a v ~a, b v ~a, c v a], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase2269, validity, [~a v a v ~a v ~c, a, a v ~c v b v ~a, b, b v ~b v b], 2000, count(2)).
tests(small_testcase2270, validity, [~b, ~b v ~b, ~a v b, b, c], 2000, count(0)).
tests(small_testcase2271, validity, [~b, a v c, b v ~c v a v c, b v ~a, c v ~a v a v c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase2272, validity, [~a, a, a v a v ~c, c, c v a], 2000, count(0)).
tests(small_testcase2273, validity, [~b v ~b, b v ~c v ~b v c, b v b v c, b v c, c v ~a v ~a], 2000, count(2)).
tests(small_testcase2274, validity, [~c v b v ~c, ~b v ~c, ~b v c v ~c, b v ~c v b v ~b, c v ~c v ~b v c], 2000, count(2)).
tests(small_testcase2275, validity, [~b v ~a v ~a v a, ~a, a, a v ~b v ~a, b v ~a v ~a v ~b], 2000, count(0)).
tests(small_testcase2276, validity, [~a v b v c, a v a, a v b v ~c, b v ~b, c v c v ~c], 2000, count(3)).
tests(small_testcase2277, validity, [~b v ~c v a v ~a, ~b v ~b, ~a, a, a v ~a v b], 2000, count(0)).
tests(small_testcase2278, validity, [~c, ~c v b, ~c v b v a, ~a v ~b, a v b], 2000, count(2)).
tests(small_testcase2279, validity, [~c, ~c v b v a v a, ~c v c v ~a v a, ~b v b v ~a v a, ~a v ~b v c v c], 2000, count(3)).
tests(small_testcase2280, validity, [~a, ~a v ~b v c v a, b v ~a, b v ~a v ~b v a, c v b], 2000, count(3)).
tests(small_testcase2281, validity, [~b, ~a v b v a, b v c v ~c v c, c, c v b v c], 2000, count(2)).
tests(small_testcase2282, validity, [~c, ~a, ~a v ~c v a, a v a, a v b v a v ~c], 2000, count(0)).
tests(small_testcase2283, validity, [~b v ~a, ~b v a v b, a v ~a v ~c, b v c v ~c, b v c v c v ~c], 2000, count(6)).
tests(small_testcase2284, validity, [~b v c v ~c, ~a v ~a v c, a v ~a, b, c v c v ~b], 2000, count(2)).
tests(small_testcase2285, validity, [~c, ~c v ~a, ~a v ~b v ~c v c, a v ~b v c v ~c, b], 2000, count(2)).
tests(small_testcase2286, validity, [~c v ~a, ~b v ~a, ~a v a v ~a, a v ~a, c v ~c v b v ~a], 2000, count(5)).
tests(small_testcase2287, validity, [a, a v ~b v b v ~a, b v b v ~b, c v ~c v ~b v ~c], 2000, count(4)).
tests(small_testcase2288, validity, [~c v c v ~b, ~b v ~c, ~a v a v b, b v ~b v ~c, c v b v b v ~c], 2000, count(6)).
tests(small_testcase2289, validity, [~c v a v ~c, ~c v c v b, ~b, ~a, a v ~c v ~b v ~a], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase2290, validity, [~c v ~a v ~b v c, ~b, ~a, b v a, c v a v b v a], 2000, count(0)).
tests(small_testcase2291, validity, [~b, b, c, c v a v c], 2000, count(0)).
tests(small_testcase2292, validity, [~b v a, ~b v a v a v ~c, b, b v ~b v c, b v a], 2000, count(2)).
tests(small_testcase2293, validity, [~b v ~b, ~a v a v c v ~b, a v ~a, a v b, b v b v a v ~a], 2000, count(2)).
tests(small_testcase2294, validity, [~c, ~b, c, c v c v ~a], 2000, count(0)).
tests(small_testcase2295, validity, [~c, ~c v ~b v c, b, b v a v ~c], 2000, count(2)).
tests(small_testcase2296, validity, [~c v ~b v ~c, ~b v a v ~c, ~a, a, c v ~c], 2000, count(0)).
tests(small_testcase2297, validity, [~c v ~a v ~b v ~c, ~c v c, ~b v c v ~a, ~a v ~b, c v ~a v ~c], 2000, count(6)).
tests(small_testcase2298, validity, [~c v a v a v a, ~b, ~a v ~b v ~c v ~b, a, c], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase2299, validity, [~c v b, ~b, ~a, b v c v b, c v ~a v ~c v b], 2000, count(0)).
tests(small_testcase2300, validity, [~a v ~b, ~a v ~a v c, a v ~b v ~a, a v ~a v ~a v c, a v a], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase2301, validity, [~c, ~b v c v ~c v c, a v ~c v ~c v a, a v ~c v ~a v c, a v c v ~a v a], 2000, count(4)).
tests(small_testcase2302, validity, [~c v ~c v b v b, ~c v ~c v b v c, ~c v ~b, a v ~a v ~b v ~c, b], 2000, count(2)).
tests(small_testcase2303, validity, [~c v c v ~b, ~b v ~a v ~c, b v ~c, c, c v a v ~b v ~a], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase2304, validity, [~c v b, ~b v ~b, a, a v a v a v c, b v c], 2000, count(0)).
tests(small_testcase2305, validity, [~b v ~b v ~c, ~a v b v ~b v c, a v ~a v ~c v ~a, b v b v c, c v ~b], 2000, count(2)).
tests(small_testcase2306, validity, [~c v c v ~a v b, ~a, ~a v ~c, c v ~b], 2000, count(3)).
tests(small_testcase2307, validity, [~b v a v ~c v ~c, ~b v a v ~a, ~a, b v ~b, c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase2308, validity, [~c v ~b v ~c, ~c v b v ~b, ~a, a v a, c v b v b v ~a], 2000, count(0)).
tests(small_testcase2309, validity, [~a v c v ~b v ~b, a v ~b, b v ~a v ~a, c v ~a v a, c v ~a v b v b], 2000, count(3)).
tests(small_testcase2310, validity, [~b, ~b v c, b, b v b v c], 2000, count(0)).
tests(small_testcase2311, validity, [~b, ~b v b v ~b, ~a v ~c v a, a v c v ~a], 2000, count(4)).
tests(small_testcase2312, validity, [~b, ~b v ~b v ~b v ~a, ~b v b, ~b v c, a], 2000, count(2)).
tests(small_testcase2313, validity, [~c, ~c v b, b, c v ~c v ~b], 2000, solution([(b, t) ,(c, f)])).
tests(small_testcase2314, validity, [~c, ~a v ~a v c, ~a v c v ~c, b v ~c v b v ~b, c], 2000, count(0)).
tests(small_testcase2315, validity, [~b, ~a, ~a v ~b v a, ~a v b v a v b], 2000, solution([(a, f) ,(b, f)])).
tests(small_testcase2316, validity, [~a v ~a, ~a v a v c, b v ~a v a v ~a, c, c v ~c], 2000, count(2)).
tests(small_testcase2317, validity, [~a, ~a v ~b v b v ~c, ~a v b v a v ~b, b v b v b v b], 2000, count(2)).
tests(small_testcase2318, validity, [~b v b, ~a v a, b, c, c v b v ~a], 2000, count(2)).
tests(small_testcase2319, validity, [~c, ~b v ~a v ~b, ~b v ~a v a, a v c v c, c], 2000, count(0)).
tests(small_testcase2320, validity, [~c, ~a v b v c, a v ~b v ~c, a v ~a v ~a, c], 2000, count(0)).
tests(small_testcase2321, validity, [~c v ~b v b, ~b v ~b, ~a v ~a v c v a, b v a, c v ~b v a], 2000, count(2)).
tests(small_testcase2322, validity, [~b v ~a v ~b, ~a v ~c v c v b, ~a v ~b v ~a v a, a, b v ~c v ~b v ~a], 2000, count(2)).
tests(small_testcase2323, validity, [~c v ~b v b v c, ~c v b v ~b, a, a v ~a], 2000, count(4)).
tests(small_testcase2324, validity, [~c v ~c v a, ~c v b, b, b v c v c v ~c, c v c], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase2325, validity, [~c v b v ~c v a, ~b v ~b v c, ~b v b v ~b v ~c, a v b v ~c v ~a, c], 2000, count(3)).
tests(small_testcase2326, validity, [~c v ~b v ~b, ~b v a, a v ~b, b v a v ~c v b, c v ~a v c], 2000, count(2)).
tests(small_testcase2327, validity, [~b v c, ~a, a v ~b v ~c v c, b v ~a v ~c, b v ~a v ~b], 2000, count(3)).
tests(small_testcase2328, validity, [~b v c, b, b v ~b v ~a, b v ~a v c v ~c], 2000, count(2)).
tests(small_testcase2329, validity, [~c v c v ~b, ~b v b v ~c, ~a, ~a v a, b v c], 2000, count(3)).
tests(small_testcase2330, validity, [~c v a v ~a v ~b, ~a v ~b v b, b v b v c v ~c, b v b v c v c, c v a], 2000, count(5)).
tests(small_testcase2331, validity, [~c, ~b, ~b v b, ~a], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase2332, validity, [~b, c, c v ~b v ~b v ~c, c v c v ~b, c v c v b v ~a], 2000, count(2)).
tests(small_testcase2333, validity, [~c, ~c v ~a v a, ~c v b v ~c v c, c, c v ~b v ~a], 2000, count(0)).
tests(small_testcase2334, validity, [a v ~b v c, a v c v ~a v ~c, c, c v ~c v a, c v ~b], 2000, count(4)).
tests(small_testcase2335, validity, [~c v ~c v c, ~c v ~a v a v b, ~a v b v ~c, a v ~a, b v ~b], 2000, count(7)).
tests(small_testcase2336, validity, [~a, ~a v ~a v ~a, a v c v a, b, c v ~c v ~a v c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase2337, validity, [~c v ~c v a, ~c v ~a v ~c, ~c v a, ~b, c v c v a v b], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase2338, validity, [~c v ~a v ~a, ~a, a v ~b v a v b, b, b v ~a v b v b], 2000, count(2)).
tests(small_testcase2339, validity, [~c, ~c v ~a v c v a, ~c v b v ~c, c, c v c v ~b], 2000, count(0)).
tests(small_testcase2340, validity, [~a, ~a v b v ~a, a v ~a v ~c, b v ~a v ~b, c v b v c], 2000, count(3)).
tests(small_testcase2341, validity, [~b v ~b, ~b v ~a v ~b, b, b v ~c v a, c v c v ~a v c], 2000, count(0)).
tests(small_testcase2342, validity, [~c, ~b v ~c v a v b, ~a v a v ~b, ~a v b, a v ~b v ~c], 2000, count(3)).
tests(small_testcase2343, validity, [~b v ~b, ~a, a, c v ~b v c], 2000, count(0)).
tests(small_testcase2344, validity, [~c v c, ~b v b v b v ~c, b v ~b, c, c v ~b v ~a], 2000, count(4)).
tests(small_testcase2345, validity, [~a v b v ~b v b, a v ~b, a v c v b, b, c v ~c v ~a v ~a], 2000, count(2)).
tests(small_testcase2346, validity, [~c v a v b, a, a v ~c v ~b, b v ~c v c v c], 2000, count(4)).
tests(small_testcase2347, validity, [~b, a v b, a v b v ~b v ~c, b v ~c, b v ~b v ~a v ~b], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase2348, validity, [~c v ~b v b, ~a v ~a, ~a v c v ~a, c, c v ~b v ~c v b], 2000, count(2)).
tests(small_testcase2349, validity, [~c, a v b v ~b v b, a v c, c v a v ~b], 2000, count(2)).
tests(small_testcase2350, validity, [~c v ~c v a v ~b, ~c v ~a v ~c, a, a v b v b v a, c v ~a], 2000, count(0)).
tests(small_testcase2351, validity, [~c v ~c v ~a, ~b v a v c v ~b, ~a v ~c v b v ~a, b v ~c v ~a, b v ~a v ~c], 2000, count(5)).
tests(small_testcase2352, validity, [~c v ~b, ~a v ~c, ~a v c v a v b, b v c v ~a, c v a v ~b v b], 2000, count(4)).
tests(small_testcase2353, validity, [~c v ~c v b v ~a, ~c v ~b, ~a, b, c v ~a], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase2354, validity, [~b v ~b v ~c v ~a, ~a v c v a v ~b, a v a v ~a v b, b v b, c v ~a v ~c], 2000, count(3)).
tests(small_testcase2355, validity, [~c, ~b, ~a, a, c v ~b], 2000, count(0)).
tests(small_testcase2356, validity, [~b, ~b v b v ~a, a, b], 2000, count(0)).
tests(small_testcase2357, validity, [~c, ~c v c v c v b, ~b v a, a, c v a v c v b], 2000, count(2)).
tests(small_testcase2358, validity, [~b v ~c v ~c v ~c, ~a v c v ~a, a v b v c v c, b, b v b v ~b v ~c], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase2359, validity, [~c, ~b v c v c v b, ~a v ~b v ~b v ~c, b v ~b v ~c, c v ~b v ~b v a], 2000, count(3)).
tests(small_testcase2360, validity, [~b, ~a v ~a v c, a, b, c v c v c], 2000, count(0)).
tests(small_testcase2361, validity, [~b v c v c v a, ~a v b v c v ~a, ~a v c, ~a v c v b, b v ~a v ~b v a], 2000, count(5)).
tests(small_testcase2362, validity, [~c v a v ~a v b, ~b v b v a, ~a v a v ~c, a v b v b v a, c], 2000, count(3)).
tests(small_testcase2363, validity, [~c v c v ~b v a, ~b v ~b v c, ~a v ~a v ~b, a v ~b v ~a v ~c, c], 2000, count(3)).
tests(small_testcase2364, validity, [~c, ~b v ~c v ~c, ~b v b v ~a, ~a v ~a, c v ~b v b], 2000, count(2)).
tests(small_testcase2365, validity, [~c, ~c v ~a v b v b, ~b, b v ~c, c v a v ~a v ~b], 2000, count(2)).
tests(small_testcase2366, validity, [~c, ~c v c v b v ~b, b, b v a v c, c v a v a], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase2367, validity, [~a, ~a v b v ~a, ~a v c, b, b v b v ~c v ~c], 2000, count(2)).
tests(small_testcase2368, validity, [~c v b, ~b, a v c, b v ~a v c v b, c], 2000, count(0)).
tests(small_testcase2369, validity, [~c, ~b, ~a, c v b], 2000, count(0)).
tests(small_testcase2370, validity, [~c, ~b, ~a v a v ~b v ~b, a v ~a, b v ~c v ~b v b], 2000, count(2)).
tests(small_testcase2371, validity, [~b v a v ~b, ~b v b v a, ~a, b, c], 2000, count(0)).
tests(small_testcase2372, validity, [~b v c v b v b, ~a, c v ~c v b v b, c v c v ~a v b, c v c v a v a], 2000, count(2)).
tests(small_testcase2373, validity, [~c v c v ~b v ~a, ~b v c v ~a, a v c, c v ~b v b v b, c v b], 2000, count(4)).
tests(small_testcase2374, validity, [~b, a v ~b v a v ~c, b v c v ~c v ~a, c v b v c], 2000, count(2)).
tests(small_testcase2375, validity, [~c v a, ~a, b v ~c v ~c, c, c v a v a], 2000, count(0)).
tests(small_testcase2376, validity, [~c v ~c v a, ~c v b v a, ~b, ~b v a v ~a v c, b v ~b], 2000, count(3)).
tests(small_testcase2377, validity, [~b v ~a, ~b v ~a v a, ~a v c v c v b, c v ~c, c v ~c v ~c v ~b], 2000, count(5)).
tests(small_testcase2378, validity, [a v ~c v c v b, a v a v ~c, b v b, b v b v b, b v c], 2000, count(3)).
tests(small_testcase2379, validity, [~c v ~c, ~c v c v c v a, ~a v ~c v c, a v a v c v b, b], 2000, count(2)).
tests(small_testcase2380, validity, [~a v ~b v b v ~c, ~a v ~a, a v ~c v ~c, a v b v b v ~c, b v b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase2381, validity, [~c v ~c v b, ~b v b v ~b v ~a, ~a v ~a, c v a v ~c v c, c v b v ~b], 2000, count(3)).
tests(small_testcase2382, validity, [~b v b v c, ~a v b v a v ~c, a v c v ~a, c v ~a, c v a v ~b v ~b], 2000, count(5)).
tests(small_testcase2383, validity, [~c, ~a v c, a, a v ~c], 2000, count(0)).
tests(small_testcase2384, validity, [~a v ~a, a v b, b v b, c v ~c v a, c v ~a v ~b v b], 2000, count(2)).
tests(small_testcase2385, validity, [~c v ~b v b v ~b, ~a v b v a v ~a, a, c v ~a, c v a v ~a v ~c], 2000, count(2)).
tests(small_testcase2386, validity, [~c v ~c v c v ~a, ~c v ~b, ~a, ~a v ~c, b v ~a v ~a v ~a], 2000, count(3)).
tests(small_testcase2387, validity, [~a, ~a v b v b, a v b v ~a v c, b, b v ~b], 2000, count(2)).
tests(small_testcase2388, validity, [~a, ~a v ~a, a v c, b v a v ~b, c v a v a], 2000, count(2)).
tests(small_testcase2389, validity, [~a, ~a v b v b, ~a v b v c v ~b, c v ~b], 2000, count(3)).
tests(small_testcase2390, validity, [~c v ~b v ~c v c, ~c v c v b v c, ~b v ~c v ~b, ~a, ~a v a v a v c], 2000, count(3)).
tests(small_testcase2391, validity, [~c v ~a v ~b v ~b, ~b v ~a v c v a, ~b v a v ~b v ~b, a v b, b v c v ~c], 2000, count(3)).
tests(small_testcase2392, validity, [~b v ~a v ~a v ~c, ~a v ~a v ~a, ~a v a v ~b, a, b v c], 2000, count(0)).
tests(small_testcase2393, validity, [~b v a, ~a v a v a v ~a, b v ~a, b v a v c v b, c v ~b v ~a], 2000, count(2)).
tests(small_testcase2394, validity, [~b v ~b v b v ~b, ~a v ~c v a, ~a v a v ~c v b, a, c], 2000, count(2)).
tests(small_testcase2395, validity, [~c v b v c v b, ~a v ~c, a, b v ~c v ~c, b v c v a v ~a], 2000, count(2)).
tests(small_testcase2396, validity, [~b v ~a v ~c v ~b, ~a v ~b, b v b, b v b v b, c v a v c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase2397, validity, [~c, ~c v ~b v ~a, b v b v ~a v ~c, c, c v ~a], 2000, count(0)).
tests(small_testcase2398, validity, [~a v ~b v ~b v a, ~a v c, a, a v a], 2000, count(2)).
tests(small_testcase2399, validity, [~c v ~b v ~a, ~a v b, a v ~c, a v a, c], 2000, count(0)).
tests(small_testcase2400, validity, [~b v ~b, ~b v b v a, a v ~b, b v ~a v c v a, c v c], 2000, count(2)).
tests(small_testcase2401, validity, [~b, a v b v c v a, b v a, b v a v c, c v ~b v ~c v c], 2000, count(2)).
tests(small_testcase2402, validity, [~c, ~a, ~a v ~a, a v c], 2000, count(0)).
tests(small_testcase2403, validity, [~c v ~a v ~a v ~c, ~c v c v ~a v c, b v ~a, b v a v a, c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase2404, validity, [~c, ~b, a, b v ~b v b], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase2405, validity, [~c v a v ~a v b, ~a v b, b v a v ~b v ~a, c], 2000, count(3)).
tests(small_testcase2406, validity, [~c v ~a v a v a, ~a v ~b v c v c, a, a v b v a v c, c v ~c], 2000, count(3)).
tests(small_testcase2407, validity, [~b v ~c v ~c, ~b v ~a v ~a v ~a, ~a v ~c v ~b, b v ~b v a v c, c], 2000, count(2)).
tests(small_testcase2408, validity, [~c, ~b v ~b v ~c, b, b v ~b v c v ~c, c v c], 2000, count(0)).
tests(small_testcase2409, validity, [~c v ~c v ~c v ~b, ~b v ~a, a v ~a v ~c v b, a v c, a v c v a], 2000, count(3)).
tests(small_testcase2410, validity, [~c v b, ~a v ~c v a, a v a v ~c, b v a v b, c v c v a], 2000, count(3)).
tests(small_testcase2411, validity, [~c v b v b v a, ~a, ~a v ~a v a v c, ~a v b v ~c, b v ~a v ~b], 2000, count(3)).
tests(small_testcase2412, validity, [~c v b v ~a v ~b, b v ~b, b v ~b v c v a, c, c v c v ~c], 2000, count(4)).
tests(small_testcase2413, validity, [~c v c, ~b v ~a v ~c v ~b, ~a v a, b v b v b, c v b], 2000, count(3)).
tests(small_testcase2414, validity, [~c v b, ~c v b v ~c, a v ~a, b v b v a, c v c v c], 2000, count(2)).
tests(small_testcase2415, validity, [~c v ~a v c, a, a v ~a v ~c, b v a v c v c, c v ~c], 2000, count(4)).
tests(small_testcase2416, validity, [~a v ~b, a, a v ~a v c v c, b v b v c v b, c v ~b], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase2417, validity, [~c, ~c v ~b v ~c v c, ~c v b, a, b v c v a], 2000, count(2)).
tests(small_testcase2418, validity, [~c v ~b, ~c v c v c v a, b v b v ~a, b v c, c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase2419, validity, [~c v a, ~b v a, ~a, a v ~b v ~b, c v ~b v b], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase2420, validity, [~c, ~c v a v b v ~c, ~b v a, ~b v b, ~a v ~c v ~a], 2000, count(3)).
tests(small_testcase2421, validity, [~c, ~b v b v b, ~a v c v ~c v a, b v ~b v ~c v ~a, c], 2000, count(0)).
tests(small_testcase2422, validity, [~b v ~c, a v ~b v ~b v a, a v ~a, c v a v ~c, c v b v ~c v b], 2000, count(5)).
tests(small_testcase2423, validity, [~c, ~c v ~c, ~b, c], 2000, count(0)).
tests(small_testcase2424, validity, [~a v ~c, ~a v b, a, b v a v ~b, c], 2000, count(0)).
tests(small_testcase2425, validity, [~c v a v ~b, ~b v a, ~a, ~a v ~b, a v ~b v ~b v ~a], 2000, count(2)).
tests(small_testcase2426, validity, [~c, ~c v ~a, ~c v ~a v ~c, ~a v a v ~c, c v ~b v c], 2000, count(2)).
tests(small_testcase2427, validity, [~a v b, a v b v b v c, b, c v ~a, c v c], 2000, count(2)).
tests(small_testcase2428, validity, [~c, ~c v ~b v ~a, ~a v b v a, b v a v ~c, c v b v a v ~c], 2000, count(4)).
tests(small_testcase2429, validity, [~c v a, ~a, a v ~a v ~b v ~c, c, c v ~b], 2000, count(0)).
tests(small_testcase2430, validity, [~b v ~c v ~c, ~a v ~c, b v ~c v ~c v ~a, b v ~b v ~a v ~c, b v ~a v ~c], 2000, count(5)).
tests(small_testcase2431, validity, [~c v ~b v a v ~b, ~c v a v b v ~c, a v c v ~a, b v c v b v c, c], 2000, count(2)).
tests(small_testcase2432, validity, [~c v ~a v c v c, ~a, a v a v c v ~a, a v b v ~a, b v b v b v c], 2000, count(3)).
tests(small_testcase2433, validity, [~a v ~b v ~b, a, c, c v c v c v b], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase2434, validity, [a, a v a, b v c, c v ~c v ~c, c v a v a v ~a], 2000, count(3)).
tests(small_testcase2435, validity, [~c v a v c, c, c v ~b, c v ~a, c v c], 2000, count(4)).
tests(small_testcase2436, validity, [~b, a v ~b v ~b v a, b, b v ~a v ~c, c v b v ~b], 2000, count(0)).
tests(small_testcase2437, validity, [~c v ~b v b, b v ~c v ~a v c, b v ~b, c, c v ~b v b v a], 2000, count(4)).
tests(small_testcase2438, validity, [~c v a, ~b v ~c v b, ~b v ~b v ~a v c, b, b v ~c v a], 2000, count(2)).
tests(small_testcase2439, validity, [~c v ~a v c, b v b v ~b, c, c v ~c, c v c v ~b], 2000, count(4)).
tests(small_testcase2440, validity, [~c, ~a v a v b, a v ~b v ~a v ~a, b v b v a], 2000, count(3)).
tests(small_testcase2441, validity, [~c v b, ~a v ~c v a v ~a, ~a v ~c v b, ~a v ~a v c v ~b, b v ~b v ~a], 2000, count(5)).
tests(small_testcase2442, validity, [~a, a, a v ~b v ~b, a v c v ~c v a, b v ~b v b], 2000, count(0)).
tests(small_testcase2443, validity, [~c, ~a v c v ~a v ~c, a, c v ~c v a v ~a, c v c v b v c], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase2444, validity, [~c v ~c, ~c v ~c v a v a, ~b v ~c v a v ~b, c, c v ~b], 2000, count(0)).
tests(small_testcase2445, validity, [~b v ~c, ~b v c v c, b v ~c v ~c, b v b v ~b, c], 2000, count(0)).
tests(small_testcase2446, validity, [~b, a v c v a, c, c v ~a v ~c, c v a v ~b], 2000, count(2)).
tests(small_testcase2447, validity, [~b, ~b v ~b, a, c v b v ~b v c], 2000, count(2)).
tests(small_testcase2448, validity, [~c v b v ~a v ~b, ~a v ~a v ~a, ~a v a v a v b, b v ~b v c v a, b v c v ~b], 2000, count(4)).
tests(small_testcase2449, validity, [~b v a, ~b v b v ~a v b, a v ~a v ~b v ~c, c v ~b v b v c, c v b v ~b v ~a], 2000, count(6)).
tests(small_testcase2450, validity, [~c v ~b v ~a, ~a v ~a, ~a v b, a v a, a v c], 2000, count(0)).
tests(small_testcase2451, validity, [~c, ~c v ~b v c v b, ~a, a v ~c v a, c], 2000, count(0)).
tests(small_testcase2452, validity, [~c, ~b v ~c v c v ~c, ~a v a v ~c v a, a, a v ~b], 2000, count(2)).
tests(small_testcase2453, validity, [~b, ~b v b v ~c, ~a v ~c v c, a v a, b], 2000, count(0)).
tests(small_testcase2454, validity, [~c, ~c v ~a v b, ~b, a, c v ~b v a v a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase2455, validity, [~b v ~a, ~a v ~b, ~a v ~a v ~a, a v a, b], 2000, count(0)).
tests(small_testcase2456, validity, [~c v b v ~b v c, a v ~a v c v ~b, a v a v c, a v b, c v ~b], 2000, count(4)).
tests(small_testcase2457, validity, [~a v c v ~b v ~c, a v c v a, b], 2000, count(3)).
tests(small_testcase2458, validity, [~c v ~a v ~b v ~c, ~b, ~a v ~c, ~a v c, ~a v c v ~c v b], 2000, count(2)).
tests(small_testcase2459, validity, [~b v ~a v a, ~a v b v c, ~a v c v c, b v a v ~c, b v c v ~b], 2000, count(5)).
tests(small_testcase2460, validity, [~c v ~a, ~b, a v b, c v b v a v ~c], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase2461, validity, [~c v b, ~b v ~a, ~a, a v ~c v c, a v c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase2462, validity, [~c, ~b v ~a, ~a v ~c v ~b v c, b v ~a v a, c v ~b], 2000, count(2)).
tests(small_testcase2463, validity, [~c, ~c v ~c v ~a, a v ~c, a v c, c v ~b], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase2464, validity, [~c v ~c v ~a v ~b, ~a v a, a v b, b v b v c, c v b v ~a], 2000, count(4)).
tests(small_testcase2465, validity, [~b, ~b v c v ~a, ~a v ~c, ~a v ~b v ~b v c, c v ~c], 2000, count(3)).
tests(small_testcase2466, validity, [~c v ~c v b, ~a, ~a v ~c, a, a v c v a v a], 2000, count(0)).
tests(small_testcase2467, validity, [~c v a v ~a v ~a, ~a, a, b v c v a, c], 2000, count(0)).
tests(small_testcase2468, validity, [~c v c, ~b, b v ~b v ~c v c, b v b v ~b, c], 2000, solution([(b, f) ,(c, t)])).
tests(small_testcase2469, validity, [~b, ~b v b v b, ~a v b, b v ~b, c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase2470, validity, [~c v ~b v c, ~c v b v ~a, b, b v ~c v b v ~a], 2000, count(4)).
tests(small_testcase2471, validity, [~a, ~a v ~b v b, ~a v ~a, ~a v ~a v b, b v ~b], 2000, count(2)).
tests(small_testcase2472, validity, [~c v a, ~c v a v c v b, ~b v ~c, ~b v ~b, ~a], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase2473, validity, [~b, ~a v ~a v c, ~a v b v ~c v c, ~a v c, a], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase2474, validity, [~c v c, ~b, ~b v ~c v c v c, b v ~a, b v a], 2000, count(0)).
tests(small_testcase2475, validity, [~c v a v c, ~b v ~b v c, ~b v ~a v ~b v ~a, ~a, ~a v b v ~a], 2000, count(3)).
tests(small_testcase2476, validity, [~b v c v ~c, ~a v ~c, a v ~a, c, c v c], 2000, count(2)).
tests(small_testcase2477, validity, [~c v c v ~c, ~b, a v ~b v ~c, a v ~a, b v c], 2000, count(2)).
tests(small_testcase2478, validity, [~a v ~b v ~c v ~c, ~a v b v ~a, ~a v c, a v ~a v ~a, c v ~b v ~b], 2000, count(3)).
tests(small_testcase2479, validity, [~c v ~b v a v ~a, ~c v ~b v c v a, ~c v ~a, ~a v c v ~b v ~a, a v ~c v ~a], 2000, count(5)).
tests(small_testcase2480, validity, [~c v c v ~c, ~c v c v c v c, ~b v ~a v a v a, b, b v ~b v a], 2000, count(4)).
tests(small_testcase2481, validity, [~c v a v a v ~b, ~c v c v a, ~a v ~c v c v ~c, b v ~c v c, b v a v ~a v ~c], 2000, count(7)).
tests(small_testcase2482, validity, [~c v b, ~b v ~c v ~b v a, a v b, b v ~b v ~b, b v b v c v c], 2000, count(3)).
tests(small_testcase2483, validity, [~c v ~c v a, ~b v ~b v b, ~a v ~a v ~b, a, c v c v c], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase2484, validity, [~b, ~a v ~c v c, a v ~b, c v ~b, c v c], 2000, count(2)).
tests(small_testcase2485, validity, [~c v ~a, ~c v c v ~c, a v b v b v ~a, a v c, b v ~c v ~a v a], 2000, count(4)).
tests(small_testcase2486, validity, [~c v ~c v a, ~c v a v ~a, ~b v b v ~c, a v ~c v a, c v b], 2000, count(4)).
tests(small_testcase2487, validity, [~c, a, b, b v ~b], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase2488, validity, [~b, ~b v a, ~a v a v b, ~a v c v b v ~a, c v ~c v ~c], 2000, count(3)).
tests(small_testcase2489, validity, [~b v b v ~a v ~a, a v c, b v a v a v b, b v b, b v c], 2000, count(3)).
tests(small_testcase2490, validity, [a, a v ~a v b, a v b v ~b v ~c, b, b v b v c], 2000, count(2)).
tests(small_testcase2491, validity, [~c v c v ~a v a, ~c v c v a, ~b, a v a, b], 2000, count(0)).
tests(small_testcase2492, validity, [~a v ~b v ~c, ~a v a v ~c v ~a, a v ~c v c v a, a v ~a v ~c, b v b v b], 2000, count(3)).
tests(small_testcase2493, validity, [~c v ~a v b, ~a v ~c v ~c, a v a, b v c v a, c v ~c], 2000, count(2)).
tests(small_testcase2494, validity, [~b, ~a v b, a v ~c v a, a v b], 2000, count(0)).
tests(small_testcase2495, validity, [~c, a v ~c v ~b v ~c, b, b v ~c v ~a, b v a v b v a], 2000, count(2)).
tests(small_testcase2496, validity, [~c v ~c, ~a v a v b, a v ~b, c v ~c v a, c v c v ~a], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase2497, validity, [~b v ~b v ~b v ~a, a, a v c, b v ~c, c v a v ~c v a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase2498, validity, [~c v b, ~b v a, ~a v ~c v a, b v b, b v c v ~a v b], 2000, count(2)).
tests(small_testcase2499, validity, [~b v ~c, ~b v a, a, c v ~c, c v b v b], 2000, count(2)).
tests(small_testcase2500, validity, [~b v ~c v ~b v a, ~b v c v b, a v ~a v b, b v c, c], 2000, count(3)).
tests(small_testcase2501, validity, [~c, ~c v b v a, a, b v ~c, b v ~c v a], 2000, count(2)).
tests(small_testcase2502, validity, [~c v a v c v ~a, ~c v c, ~b, b v ~a v ~c, c v b v ~a v b], 2000, count(2)).
tests(small_testcase2503, validity, [~c, ~a v ~a v b, a v ~c v a v b, b v ~a, c v ~b v ~a], 2000, count(2)).
tests(small_testcase2504, validity, [~b, ~a, ~a v ~c v c, b, b v b v ~a v b], 2000, count(0)).
tests(small_testcase2505, validity, [~c v ~c v ~c v a, ~c v a, ~a v ~b, a, b v ~c v ~c v b], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase2506, validity, [~c, ~c v ~a v a v a, ~b v b v ~c, ~a v ~c v b v a, ~a v ~c v c], 2000, count(4)).
tests(small_testcase2507, validity, [~c v ~b v a v ~c, ~b v ~c v a, ~b v ~a v c, ~a v ~c v c v a, a], 2000, count(3)).
tests(small_testcase2508, validity, [~c v ~a, ~c v ~a v b, ~b, a v ~a, b v ~c], 2000, count(2)).
tests(small_testcase2509, validity, [~c v b v ~a, ~b v a, a, a v ~c v ~b, c v b], 2000, count(2)).
tests(small_testcase2510, validity, [~c v ~a v a v ~a, ~c v c v ~a, ~b v ~c, ~a v a v b, c], 2000, count(2)).
tests(small_testcase2511, validity, [~a v ~c v c, a v ~a v b, b v a v b, b v b, b v b v a v c], 2000, count(4)).
tests(small_testcase2512, validity, [~b, ~b v ~c, ~a, ~a v ~b, ~a v ~a v c], 2000, count(2)).
tests(small_testcase2513, validity, [~c v ~b v ~b v ~b, ~b, ~a v ~b, c, c v ~b v a], 2000, count(2)).
tests(small_testcase2514, validity, [~c v a, ~c v a v ~b, ~b v ~c v ~c v ~c, ~b v b v a v ~a, c v a v c v ~a], 2000, count(5)).
tests(small_testcase2515, validity, [~c v ~a v a v a, ~b v ~c v a, b v b v ~a, c v ~c v ~c v c, c v b], 2000, count(4)).
tests(small_testcase2516, validity, [~b v c v ~c v ~b, ~a, ~a v ~c v ~c v b, a v c, a v c v a v ~b], 2000, count(2)).
tests(small_testcase2517, validity, [~a v ~c v b, ~a v c, a v b, c v a, c v c v c v a], 2000, count(2)).
tests(small_testcase2518, validity, [~b v ~b v ~a v c, a v ~b v ~a, a v ~a v ~c v a, b v ~c, c v ~b v c v c], 2000, count(4)).
tests(small_testcase2519, validity, [~b, ~b v ~c v ~b, b v ~b v b v b, c v ~a v c v a, c v c v ~a v ~b], 2000, count(4)).
tests(small_testcase2520, validity, [~c, ~c v c, ~b v b v ~c v c, a v ~a v ~c v ~a, b v c v ~a v ~c], 2000, count(4)).
tests(small_testcase2521, validity, [~c v ~c, ~b v ~c v a, ~b v c, b v c, c v c v b], 2000, count(0)).
tests(small_testcase2522, validity, [a v b, b v ~b v ~c, b v ~a v ~b, c v a v a, c v a v a v a], 2000, count(5)).
tests(small_testcase2523, validity, [~a, a, a v a v a v ~b, a v c, b v ~a], 2000, count(0)).
tests(small_testcase2524, validity, [~b v ~b v a v ~a, ~a v ~c v ~c v a, a, b, b v ~c], 2000, count(2)).
tests(small_testcase2525, validity, [~b, ~b v b, ~a v ~b v b, ~a v ~a v b v ~b, ~a v b v ~b], 2000, count(2)).
tests(small_testcase2526, validity, [~c v b, ~a v ~b v b v b, ~a v b, b, c v ~b], 2000, count(2)).
tests(small_testcase2527, validity, [~c, ~b, a v a, c v b], 2000, count(0)).
tests(small_testcase2528, validity, [~a v ~b, a v ~b, a v ~b v b, c v ~a, c v b], 2000, count(2)).
tests(small_testcase2529, validity, [~b, ~a v b, c, c v ~b v ~c, c v b v b], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase2530, validity, [~c v b v ~c v a, ~b v ~a, ~b v a, a v a v ~a v a, c v c], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase2531, validity, [~c v c, ~b, ~b v ~b v ~a v ~c, b v ~a v b, b v a v c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase2532, validity, [~a v b, a, b v ~c, b v b v a, c v ~c v c v ~b], 2000, count(2)).
tests(small_testcase2533, validity, [~c v a, ~a v ~b v b, ~a v b v ~a v c, c, c v ~c v c], 2000, count(2)).
tests(small_testcase2534, validity, [~c, ~c v a, ~a, a v ~c v b], 2000, count(2)).
tests(small_testcase2535, validity, [~b v ~a v ~a, ~b v b v a v ~a, ~a v b, ~a v c v ~c, c v ~b v ~b], 2000, count(3)).
tests(small_testcase2536, validity, [~a v b, b v ~a v ~a, b v a v ~b, b v c, c v c], 2000, count(3)).
tests(small_testcase2537, validity, [~b v c, a v c v c, b v ~c v a v ~c, b v ~b], 2000, count(4)).
tests(small_testcase2538, validity, [~c v a v ~b, ~a v ~a v ~c, a v a, a v c, b v a v c v ~b], 2000, count(2)).
tests(small_testcase2539, validity, [~c v b v ~a, a v ~a, a v ~a v ~c v a, a v ~a v c, c v a], 2000, count(5)).
tests(small_testcase2540, validity, [~c v ~c, ~b v ~b, ~b v ~a, b v a, c v ~c v a v c], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase2541, validity, [~c v a v c v ~a, ~b, ~b v a, b v b, b v c v ~c], 2000, count(0)).
tests(small_testcase2542, validity, [a, b, b v a v ~b v b, c v ~b v b, c v b], 2000, count(2)).
tests(small_testcase2543, validity, [~b v ~b v ~a, ~b v a, ~b v c, ~a v ~c v ~b v a], 2000, count(4)).
tests(small_testcase2544, validity, [~c v c v a, ~a, a v ~c, b v ~b v ~b v c, b v a v b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase2545, validity, [~b, ~b v ~a, ~a, ~a v b v ~a, b v c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase2546, validity, [~c v b, ~b, ~a v ~c v ~b v ~b, b v a, c], 2000, count(0)).
tests(small_testcase2547, validity, [~b v c v ~b v ~c, ~a v a v c, ~a v b v ~a v ~a, c, c v c v b v ~a], 2000, count(3)).
tests(small_testcase2548, validity, [~b v ~c, ~a v b v ~c, ~a v c v a, a v b v b, b v c v ~b], 2000, count(3)).
tests(small_testcase2549, validity, [~c v ~b v c v ~b, a v a v a v b, b, b v b v ~b, c v b v b v b], 2000, count(4)).
tests(small_testcase2550, validity, [~b, b, b v ~b, b v a v ~b v b], 2000, count(0)).
tests(small_testcase2551, validity, [~c, ~b v b, ~b v c v ~c, ~a v ~b v c, b v ~a], 2000, count(2)).
tests(small_testcase2552, validity, [~c, a v c, b, b v b, c], 2000, count(0)).
tests(small_testcase2553, validity, [~b v ~b v ~b v ~a, ~b v c v a, a, b v ~b v ~b v ~c, c], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase2554, validity, [~c v ~b, a v b v c, b v b, b v c v b, c v a], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase2555, validity, [~b, ~b v ~b v ~a v a, a v ~c v a, a v ~b v b v b, b v b v ~c], 2000, count(2)).
tests(small_testcase2556, validity, [~c v ~b, ~c v a v ~c, ~b v b v ~a v c, a v c v a, c v a v ~c v ~b], 2000, count(3)).
tests(small_testcase2557, validity, [~b, ~b v ~c, a v a, b v ~c v ~a, c v ~c v b v ~a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase2558, validity, [~c, ~b v ~b v a, ~a v a, b v ~b v ~c v a, b v b], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase2559, validity, [~b, a, b v ~c v ~a, b v ~a, c v c v a v c], 2000, count(0)).
tests(small_testcase2560, validity, [~c v ~a, ~c v c v c, ~b, ~b v a, ~b v b], 2000, count(3)).
tests(small_testcase2561, validity, [~c v ~a, ~b v ~b, ~a v b v c, a v ~a v a v ~c, a v c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase2562, validity, [~a v b, a v b v ~a, b, b v ~b, c], 2000, count(2)).
tests(small_testcase2563, validity, [~b v ~b v a, ~b v c, ~a v ~c v b v a, a v a v ~c, c], 2000, count(2)).
tests(small_testcase2564, validity, [~c, ~b v ~a, ~b v c v b v ~b, a v ~c v ~b, a v a v ~b], 2000, count(2)).
tests(small_testcase2565, validity, [~b v ~c v ~a v ~b, c, c v ~b v a, c v a v c], 2000, count(3)).
tests(small_testcase2566, validity, [~b v c, a v ~b, a v ~a v ~a, b v a v c, c], 2000, count(3)).
tests(small_testcase2567, validity, [~c v ~b v ~c, ~b v c v ~b v a, ~a v ~c v c, a v a v a v b, b], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase2568, validity, [~c v ~a, ~b v c v ~c, ~a v b, a v ~b v a, c v b v ~b v a], 2000, count(3)).
tests(small_testcase2569, validity, [~b, ~b v c, a v ~c, b v ~c v a v c, b v ~a v b v ~a], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase2570, validity, [~c v ~c v ~c v ~c, ~b v c v c, ~a v b, c v a v ~c, c v b v c v ~a], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase2571, validity, [~c, ~a v ~b v c v ~b, a v a v b v ~a, b v ~c, c v a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase2572, validity, [~c v c, a v ~c v ~c v ~c, a v ~b v ~c v ~a, b v ~b, b v a v ~a v ~a], 2000, count(6)).
tests(small_testcase2573, validity, [~c v b v ~c v ~b, ~b, ~b v a v ~b, a v b v a v ~a, c v c v c v ~b], 2000, count(4)).
tests(small_testcase2574, validity, [~c, ~b v ~a v ~c, ~a v b, a, b], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase2575, validity, [~c v ~b v ~c, ~b v ~b v a v ~b, ~a v a v ~c v b, a v ~c, c v c v c v ~c], 2000, count(4)).
tests(small_testcase2576, validity, [a, a v a, b v a v ~c, c v ~b v a v ~a, c v c v a], 2000, count(4)).
tests(small_testcase2577, validity, [~a, ~a v b v ~c, a, a v b v c], 2000, count(0)).
tests(small_testcase2578, validity, [~c v ~b, ~b v ~b, ~b v ~a v ~a, b v a v c v ~b], 2000, count(4)).
tests(small_testcase2579, validity, [~c v ~c v c, ~c v ~a, ~a, ~a v ~a v ~b v a, b v ~a], 2000, count(4)).
tests(small_testcase2580, validity, [~c v ~c v a, ~c v ~a v a v a, b v ~b v ~b v c, c, c v ~c v ~b], 2000, count(2)).
tests(small_testcase2581, validity, [~c v b v a v c, ~c v c v ~c v ~b, a v ~a v ~c v ~b, b v a v ~a v a, c v ~a], 2000, count(6)).
tests(small_testcase2582, validity, [~c, ~b, ~b v b, c], 2000, count(0)).
tests(small_testcase2583, validity, [~b v a v ~b v c, ~a v ~a, ~a v ~a v ~a v c, a v ~a v ~c v ~b, a v a v c v c], 2000, count(2)).
tests(small_testcase2584, validity, [~b, b v ~a, b v c v c v b, c v ~b, c v b v b], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase2585, validity, [~c v c v a v a, ~b, a v ~c v b v c, b, c v ~b], 2000, count(0)).
tests(small_testcase2586, validity, [~b v c, ~a v b v a, a v b v a v b, c, c v b], 2000, count(3)).
tests(small_testcase2587, validity, [~c v b v ~a, ~c v b v c, ~a v b v ~b v ~c, b v b v a v a, c v ~a v a v b], 2000, count(5)).
tests(small_testcase2588, validity, [~c v ~b v a, a v b, a v b v a v a, b v ~b v ~c, b v c v a], 2000, count(5)).
tests(small_testcase2589, validity, [~c v c v ~b v ~c, ~b v ~c, ~b v c v ~b v ~a, a, b], 2000, count(0)).
tests(small_testcase2590, validity, [~c v ~a v c, ~a v ~a v b, a v a, c v ~b v c], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase2591, validity, [~b, ~b v c v a v ~a, ~a v ~c v ~b v ~b, ~a v ~a v ~b v ~a, c v ~b], 2000, count(4)).
tests(small_testcase2592, validity, [~a v ~c v b, a v a, b v ~c, c v ~c v ~a v ~a, c v ~b], 2000, count(2)).
tests(small_testcase2593, validity, [~c, b, c v ~c, c v ~a v c, c v b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase2594, validity, [~c, ~c v c v c, ~a v ~a v ~b v b, ~a v c, b v a v ~b v b], 2000, count(2)).
tests(small_testcase2595, validity, [~c, ~c v c v ~c v ~a, ~b v ~b, a v b v ~b, b v ~a v ~b v a], 2000, count(2)).
tests(small_testcase2596, validity, [~c v a v b, ~a v b v ~a v ~a, ~a v b v a, b v ~a v c v b, b v b v b v c], 2000, count(4)).
tests(small_testcase2597, validity, [~c, a v b, b, b v b v b v ~b, c v ~c v ~c], 2000, count(2)).
tests(small_testcase2598, validity, [~c v ~a v ~c v a, ~a v ~b v c v c, a, a v ~b v a v a, b v b v ~a], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase2599, validity, [~c, ~b v ~a v a, ~a, b, c v ~c v ~b v ~a], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase2600, validity, [~c v ~c v a v ~a, ~a v a v b, a, b v b], 2000, count(2)).
tests(small_testcase2601, validity, [~c v c v a v ~b, ~a, ~a v ~c v ~c v ~c, ~a v ~a v ~c, a v ~b v ~a], 2000, count(4)).
tests(small_testcase2602, validity, [~c v ~a v ~c, ~b, ~a v ~b v ~b, ~a v a, b], 2000, count(0)).
tests(small_testcase2603, validity, [~c, ~c v ~a v c, a v ~a, a v ~a v ~c v c, c v ~c], 2000, count(2)).
tests(small_testcase2604, validity, [~b v a v a v ~c, a, a v c v a v a, b, c v ~a v ~c], 2000, count(2)).
tests(small_testcase2605, validity, [~c v ~b v ~c v ~a, ~b v ~b v b v ~c, ~b v ~a, b, c v b v c], 2000, count(2)).
tests(small_testcase2606, validity, [~c v ~c, ~b v ~a, a, a v ~a, c], 2000, count(0)).
tests(small_testcase2607, validity, [~c v ~a v ~b, ~b, ~b v ~b, ~a v ~c, b v ~a], 2000, count(2)).
tests(small_testcase2608, validity, [~c v b v a, b v ~c v c, b v b v a v ~a, c, c v ~b v a v b], 2000, count(3)).
tests(small_testcase2609, validity, [~a v b, b, b v a v ~c, c, c v ~b], 2000, count(2)).
tests(small_testcase2610, validity, [~b v a v c v ~a, ~b v b, a v ~a v ~b v ~a, b v ~a], 2000, count(6)).
tests(small_testcase2611, validity, [~c v ~c, ~c v a v ~c, ~b v b v ~b, ~a v b v b, c v b], 2000, count(2)).
tests(small_testcase2612, validity, [~c, ~b v ~a, ~a, a v b, c], 2000, count(0)).
tests(small_testcase2613, validity, [~b v ~c, ~b v b v ~a v ~a, ~b v c v a, a v b v c v ~c, b v ~a], 2000, count(3)).
tests(small_testcase2614, validity, [~b v b, ~b v c v b, ~a v c, a, b v ~c v ~b], 2000, count(2)).
tests(small_testcase2615, validity, [~c v c v ~b, ~c v c v ~a, ~b v c v ~b v b, ~a v c, c v c v a v a], 2000, count(4)).
tests(small_testcase2616, validity, [~c v ~c v c v ~b, ~c v ~a v ~a, ~b, ~b v ~c v a, b v b v ~a v a], 2000, count(3)).
tests(small_testcase2617, validity, [~c, ~c v ~b v b v b, ~b v b, a, a v ~a v ~b], 2000, count(2)).
tests(small_testcase2618, validity, [~b v ~b, ~a, a, b, c], 2000, count(0)).
tests(small_testcase2619, validity, [~a, a v b v b, b v ~b v ~b, c v ~b v ~c, c v a v b v ~c], 2000, count(2)).
tests(small_testcase2620, validity, [~c, ~a, ~a v ~c, a, c v ~a v ~b v c], 2000, count(0)).
tests(small_testcase2621, validity, [~c v b, ~c v c v ~b v b, ~a v b v ~a, a v ~a v b v ~b, c], 2000, count(2)).
tests(small_testcase2622, validity, [~c v ~a v ~b v ~a, ~b v ~a v a v ~b, ~b v c v ~b, a v ~c, b v ~b v c v ~b], 2000, count(3)).
tests(small_testcase2623, validity, [~c v a v c v b, ~a, ~a v c v ~b, b v ~c v ~c, b v ~c v b v ~a], 2000, count(3)).
tests(small_testcase2624, validity, [~b, ~b v ~b v ~a v c, ~a v b v c, a, b v ~b], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase2625, validity, [~b, ~b v c v a, b, b v ~a v ~b, c v a], 2000, count(0)).
tests(small_testcase2626, validity, [~c v ~c v b v ~b, ~a v ~b v a, a, c, c v a v ~a v ~b], 2000, count(2)).
tests(small_testcase2627, validity, [~c v ~a v b v a, b, b v b, c v ~b, c v b v b v ~c], 2000, count(2)).
tests(small_testcase2628, validity, [~c v ~a v ~c v c, ~c v a v ~b, ~a v b v c, a v b v ~b v a, b v c v ~b v ~c], 2000, count(6)).
tests(small_testcase2629, validity, [~c, ~b, b v ~c v ~b v ~b, c v ~c v b, c v a v c v b], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase2630, validity, [~b, ~a v b v ~b, a, b v a v ~c, c], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase2631, validity, [~c v c, a, a v ~c, b v a v b, c], 2000, count(2)).
tests(small_testcase2632, validity, [~c v b v ~a v ~a, ~a v ~a, a v a v ~c, a v a v ~a, b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase2633, validity, [~b v ~c v ~c v ~a, a, a v ~c v ~c, b v ~b, b v ~a], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase2634, validity, [~c, ~c v ~a v ~c, ~c v a v a, b v c v ~b v c, c v ~a v c v ~b], 2000, count(3)).
tests(small_testcase2635, validity, [~c v a, ~b, ~a, ~a v ~c, a v b], 2000, count(0)).
tests(small_testcase2636, validity, [~b v b v ~a v ~c, b v ~a v c, b v a, c, c v ~b v a], 2000, count(3)).
tests(small_testcase2637, validity, [~b v ~a v a, a v ~c v ~b, b, b v ~a v ~b v c, c v ~a v ~c v c], 2000, count(3)).
tests(small_testcase2638, validity, [~a, ~a v ~b, a v c v ~c v ~c, b, c v ~b v a v c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase2639, validity, [~c v a v a v c, ~b v b v b, ~a, ~a v c, c], 2000, count(2)).
tests(small_testcase2640, validity, [~b v b v a, ~b v b v b, ~b v b v b v ~a, ~a], 2000, count(2)).
tests(small_testcase2641, validity, [~b v a v ~b v ~a, ~a v a v ~a v b, a v ~c v b, c, c v c v c v ~c], 2000, count(3)).
tests(small_testcase2642, validity, [~b v a v ~c v ~c, ~a, a v ~b v ~c v ~a, a v c v c, c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase2643, validity, [~c, ~b, ~b v b, ~a v b v c v a, b v ~a], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase2644, validity, [~c, ~b v ~a v a v ~c, ~b v b v a, ~a v b v b v b, b v ~c v b v ~c], 2000, count(3)).
tests(small_testcase2645, validity, [~c v ~a v ~a v a, ~c v a v c, ~b, ~a v ~a, b v ~a v b], 2000, count(2)).
tests(small_testcase2646, validity, [~b v ~b, ~a, ~a v ~a, a v ~c, a v ~b], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase2647, validity, [~b v a v c v ~a, ~a v ~b v a v c, b, b v c v c v ~b, c], 2000, count(2)).
tests(small_testcase2648, validity, [~a, ~a v ~c v ~a, ~a v a v ~b, b, c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase2649, validity, [~a, ~a v ~c, ~a v ~a, a v a, c v b], 2000, count(0)).
tests(small_testcase2650, validity, [~c v ~b v ~c, ~b v b, ~a v ~c, ~a v b v ~a, b v c v a], 2000, count(3)).
tests(small_testcase2651, validity, [~c v ~a v ~b, b v ~a v c v ~c, b v a, b v b, c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase2652, validity, [~c, ~a, ~a v ~b, a v b, c v b v a], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase2653, validity, [~a v c v ~b v ~a, ~a v c v ~b v a, a v ~b v c, b v ~a v a, c], 2000, count(4)).
tests(small_testcase2654, validity, [~c v ~a v ~a v ~c, ~b v ~b v ~b, ~a, c v ~b v ~c, c v ~a], 2000, count(2)).
tests(small_testcase2655, validity, [~c v b v ~b, a, a v ~a v ~c v ~b, a v b, b], 2000, count(2)).
tests(small_testcase2656, validity, [~a, ~a v ~b v a v ~c, a v ~b v ~b v ~b, a v ~a v ~a v ~b, c v a], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase2657, validity, [~b, ~a, b v ~a, b v a, b v a v ~c], 2000, count(0)).
tests(small_testcase2658, validity, [~b, ~b v ~a, a v c v c v ~b, b v c v ~c, c v ~c v ~a], 2000, count(4)).
tests(small_testcase2659, validity, [~b v b v a, a, a v b v c v c, b, b v ~c v ~a], 2000, count(2)).
tests(small_testcase2660, validity, [~c v c v c v ~c, ~b v b v a, ~a v b, a v c, c], 2000, count(3)).
tests(small_testcase2661, validity, [~c v c, ~b v ~c v ~b, ~a v ~a v ~a, b v ~a, b v c v c v ~c], 2000, count(3)).
tests(small_testcase2662, validity, [~c, ~b, b v a v ~c v c, c v b, c v c], 2000, count(0)).
tests(small_testcase2663, validity, [~c v ~a, ~c v b v a v b, b v ~b, c, c v ~a v a v b], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase2664, validity, [~b v b v ~b v ~a, ~a, c, c v ~a v ~c v ~b, c v a], 2000, count(2)).
tests(small_testcase2665, validity, [~a v ~a, ~a v ~a v b v b, a v ~c v ~c, a v ~a v b, a v b v c], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase2666, validity, [~c, ~a v c, a, a v c, b], 2000, count(0)).
tests(small_testcase2667, validity, [~c, ~b v ~b v ~b, ~a v ~b v ~b, a v ~a v ~c v ~c, c v ~b v c v ~c], 2000, count(2)).
tests(small_testcase2668, validity, [~b v c v ~c, ~a v ~b v b v ~c, b v ~c v a, b v ~b v a, b v c v c v a], 2000, count(6)).
tests(small_testcase2669, validity, [~c v a, a, a v ~c v ~b, c v b v a, c v c v c v ~b], 2000, count(3)).
tests(small_testcase2670, validity, [~a v ~a v ~b v a, a, a v ~a, b, c], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase2671, validity, [~b v c v a, ~a, ~a v c v ~b v c, ~a v c v ~a, b v ~a v ~b], 2000, count(3)).
tests(small_testcase2672, validity, [~b v a v c, ~a, ~a v a v a, a, c], 2000, count(0)).
tests(small_testcase2673, validity, [~c v ~c v c v b, a v ~c v ~c v c, a v ~c v ~a, a v a, b v ~a], 2000, count(2)).
tests(small_testcase2674, validity, [~c v b, ~a, a v ~c, b v ~b v b v ~c, c v b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase2675, validity, [~c v ~c v b v ~c, ~c v c, ~a, a v c v b, b v ~b v ~a], 2000, count(2)).
tests(small_testcase2676, validity, [~c v ~b, ~b v b, ~a, ~a v ~c v c, b v c v c v c], 2000, count(2)).
tests(small_testcase2677, validity, [~b v ~b v a, ~b v a, a v ~a v ~a, b v b, c v ~b v b], 2000, count(2)).
tests(small_testcase2678, validity, [~c, ~c v ~b, a v c v c v b, b v a v c, c v a v a], 2000, count(2)).
tests(small_testcase2679, validity, [~c v ~a v a v ~a, ~c v a v ~b v ~a, ~a v ~b v a v ~c, c, c v ~b v a], 2000, count(4)).
tests(small_testcase2680, validity, [~a v ~c v ~b v a, ~a v a v c, ~a v c v ~b v c, b v c, c v b], 2000, count(5)).
tests(small_testcase2681, validity, [~c v c, ~b v ~a v ~b, a v a v a, a v c v ~c, c v a v ~b], 2000, count(2)).
tests(small_testcase2682, validity, [~c v ~b v ~a, ~a, ~a v ~c v a, c v b], 2000, count(3)).
tests(small_testcase2683, validity, [~c v b v ~c, ~b, ~b v ~a, a v c, c v ~b v ~a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase2684, validity, [~c v c v ~a, ~c v c v b v ~c, ~b, ~b v ~c v b, a v ~c v a], 2000, count(3)).
tests(small_testcase2685, validity, [~c v ~b, ~c v ~b v ~b v c, ~a, ~a v b, a v ~b], 2000, count(2)).
tests(small_testcase2686, validity, [~b v ~c, ~a v ~b, ~a v a v ~c v ~c, b v ~c v b, c], 2000, count(0)).
tests(small_testcase2687, validity, [~b v ~b v ~b v ~b, ~a, ~a v b v ~c v a, ~a v c v a, c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase2688, validity, [~c v c v a, a v ~c v ~c v b, a v ~b, b, c v ~c v a v a], 2000, count(2)).
tests(small_testcase2689, validity, [~b v a v b v c, ~a v b v a, b, c, c v ~b], 2000, count(2)).
tests(small_testcase2690, validity, [~a v ~a v b, ~a v a, ~a v c v ~a v b, b v a v c v ~a, b v b], 2000, count(4)).
tests(small_testcase2691, validity, [~a, a v ~a v ~c v c, b, b v a], 2000, count(2)).
tests(small_testcase2692, validity, [~b v ~c, ~a v a v ~b v c, a, a v ~c v c v ~a, b v b v ~b v ~b], 2000, count(3)).
tests(small_testcase2693, validity, [~b, ~a, a v b], 2000, count(0)).
tests(small_testcase2694, validity, [~c v a v b v ~a, ~c v c v b, ~b v ~a v ~c v ~c, ~b v a, a v a v ~b v b], 2000, count(5)).
tests(small_testcase2695, validity, [~c v ~a, ~b, a v a, b v ~b v ~c, b v a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase2696, validity, [~b v ~c v ~b v b, ~a v ~c v c, ~a v c, b v ~c, c], 2000, count(2)).
tests(small_testcase2697, validity, [~c v b, ~b v ~c, ~b v ~a v c v b, ~a v c v c, b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase2698, validity, [~b v c v ~c v ~a, ~a, a, b v ~c v ~c, b v ~b], 2000, count(0)).
tests(small_testcase2699, validity, [~b, a, a v c v a v c, b v ~c, b v a v a v c], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase2700, validity, [~b v ~b v ~b v c, b v ~b v ~b, b v a v b, b v b, c v ~b], 2000, count(2)).
tests(small_testcase2701, validity, [~b v a v a, ~a, ~a v b v ~a v b, a v b v c, b], 2000, count(0)).
tests(small_testcase2702, validity, [~b v ~a v a, ~b v b v ~a v ~a, a v ~c v a v ~b, b v ~a, b v c v ~b v a], 2000, count(5)).
tests(small_testcase2703, validity, [~c v ~a v ~c, ~b v ~a, ~b v a v ~c, b v ~c v ~a, b v a v c], 2000, count(3)).
tests(small_testcase2704, validity, [~b v b v ~c v ~c, ~a, a v ~b v c, a v a v a v ~a, c v c v ~b v ~b], 2000, count(3)).
tests(small_testcase2705, validity, [~b, ~b v c v b v b, c], 2000, solution([(b, f) ,(c, t)])).
tests(small_testcase2706, validity, [~b, ~a, a v b v ~b, b v ~a v c v a, c v c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase2707, validity, [~c, a v a, b, c v c, c v c v ~c v c], 2000, count(0)).
tests(small_testcase2708, validity, [~a, a, b, b v c v ~c, c v a], 2000, count(0)).
tests(small_testcase2709, validity, [~c v a, ~a, b v a v ~b v a, c, c v c v a], 2000, count(0)).
tests(small_testcase2710, validity, [~c, ~a, a, a v a, c v ~a], 2000, count(0)).
tests(small_testcase2711, validity, [~c v ~a v a, ~b v ~b v b, ~a, b, c v ~c v b], 2000, count(2)).
tests(small_testcase2712, validity, [~b v c, ~a v ~a v a v ~a, ~a v b, a v ~a, b v c], 2000, count(3)).
tests(small_testcase2713, validity, [~b v a v ~c v b, ~a, ~a v c, a v ~b, c v ~c v c v b], 2000, count(2)).
tests(small_testcase2714, validity, [~c v b v ~b v ~c, ~c v c, ~a v ~a v ~c, c v ~c v ~c, c v a], 2000, count(4)).
tests(small_testcase2715, validity, [~b, ~a v ~a, ~a v ~a v ~b, a v b v ~b v ~c, b v ~a v c], 2000, count(2)).
tests(small_testcase2716, validity, [~a v ~c v b v c, ~a v b, a v ~a, a v a, c v b v b v c], 2000, count(2)).
tests(small_testcase2717, validity, [~b v a v b v a, ~a, a v ~a v c v a, b v ~a v a, c v ~b v a v ~b], 2000, count(3)).
tests(small_testcase2718, validity, [~c v c, a, a v ~c, a v b v ~c v b, b v c v ~a], 2000, count(3)).
tests(small_testcase2719, validity, [~b v ~a, ~a, ~a v ~c, c], 2000, count(2)).
tests(small_testcase2720, validity, [~b v ~b v ~a, ~b v a v c, ~a, ~a v b v b v a, ~a v c], 2000, count(3)).
tests(small_testcase2721, validity, [~b v ~b, ~b v a, ~a v ~b v b v b, c v ~c, c v ~a], 2000, count(3)).
tests(small_testcase2722, validity, [~c v ~b v ~b v c, ~a, ~a v ~a v a, b v ~c v ~c, c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase2723, validity, [~c v ~c v ~c, ~b, ~b v ~c v ~c, a v a, b v ~c], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase2724, validity, [~c, ~b v ~a, ~b v c, a v ~c v ~a, c v c], 2000, count(0)).
tests(small_testcase2725, validity, [a, b v ~b v a, b v b v c, c v ~a, c v b v c], 2000, count(2)).
tests(small_testcase2726, validity, [~b, a v ~b v a, b v b v a, c], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase2727, validity, [~c v ~a, ~b v a v a, ~a v b v b v a, a v ~b v ~c v b, c v ~c], 2000, count(4)).
tests(small_testcase2728, validity, [~c, ~c v a v c v b, ~b, ~b v a v ~a, ~a v b v ~a v c], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase2729, validity, [~c v ~c v b v a, ~c v ~b v ~c, ~c v c, c v ~c v ~b, c v a], 2000, count(3)).
tests(small_testcase2730, validity, [~c v a v c, ~b v b, ~b v c v c, b, c v c], 2000, count(2)).
tests(small_testcase2731, validity, [~c v c, ~a v b v ~a v b, ~a v c v b v c, a v b, a v b v ~c v ~c], 2000, count(4)).
tests(small_testcase2732, validity, [~b, ~b v ~b v ~c v b, ~b v ~b v b v a, a, c v ~a v ~c v ~a], 2000, count(2)).
tests(small_testcase2733, validity, [~c v b v a v a, ~b, ~b v b v ~c, a v c v ~c v ~a, b], 2000, count(0)).
tests(small_testcase2734, validity, [~c, ~c v a v ~a, a v ~b, b v b v ~b, c v b], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase2735, validity, [~b, ~a v ~a, a v ~b, a v c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase2736, validity, [~b v c v ~a, ~a v ~a, b, c v ~a, c v a v b v ~c], 2000, count(2)).
tests(small_testcase2737, validity, [~c v ~a, ~a, b v c v b v ~c, c v ~c v ~b v ~c], 2000, count(4)).
tests(small_testcase2738, validity, [~c v a, ~b v ~c, a v b v ~b v ~c, b v b, c v c v ~a], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase2739, validity, [~c, ~a, a v ~a, b, b v ~a v ~b v ~a], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase2740, validity, [a, a v b v c v b, a v c v c v ~b, c, c v ~c], 2000, count(2)).
tests(small_testcase2741, validity, [~c, ~b, ~a, a v ~b v b v ~b, c], 2000, count(0)).
tests(small_testcase2742, validity, [~c, ~c v ~b v a, b v ~c, b v ~a, c v a], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase2743, validity, [~c, ~c v ~b v a v b, a v ~b v c v a, c v ~b, c v c v c v ~c], 2000, count(2)).
tests(small_testcase2744, validity, [~c v ~c v a, ~b v a, a v ~a v a v b, a v b v c v ~b, a v c], 2000, count(4)).
tests(small_testcase2745, validity, [~b, ~b v ~a, ~b v c v ~c, b v c v b, c], 2000, count(2)).
tests(small_testcase2746, validity, [~b, ~b v ~b v c v ~b, b v ~a, c v ~c v ~b, c v c v a v a], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase2747, validity, [~c, ~b, a v ~c, b v a v ~c v ~a, b v c], 2000, count(0)).
tests(small_testcase2748, validity, [~b, ~a v ~a v a v ~a, a v b v b, b v c v b, c v b], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase2749, validity, [~c, ~b, ~b v a, ~a v c v c v ~a, c v b v ~c], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase2750, validity, [~c v ~a v a v c, ~b v b, ~a v ~c v ~b v c, a v b, c], 2000, count(3)).
tests(small_testcase2751, validity, [a, a v ~c v a v c, a v a, a v c, b v c v c], 2000, count(3)).
tests(small_testcase2752, validity, [~c, ~b, ~b v ~b v b, ~a v ~b, c v b v a v ~b], 2000, count(2)).
tests(small_testcase2753, validity, [~c v c v ~a, ~a v b v ~b, b, b v ~b v c v b, c v c v c v a], 2000, count(3)).
tests(small_testcase2754, validity, [~c v ~b, ~b v ~c v ~c, ~a v a v ~a v b, a v ~a, c v a], 2000, count(4)).
tests(small_testcase2755, validity, [~c, c, c v ~a, c v ~a v c v ~c, c v a], 2000, count(0)).
tests(small_testcase2756, validity, [~b, ~a, ~a v ~b v c, a, c v a], 2000, count(0)).
tests(small_testcase2757, validity, [~c v ~b v a v b, ~b v ~a v ~c v b, b, b v c v b v b, c v c v ~c v ~b], 2000, count(4)).
tests(small_testcase2758, validity, [~a v b v ~a, b v ~b v ~b v ~a, b v ~b v ~a, c v ~b v b, c v b v ~a], 2000, count(6)).
tests(small_testcase2759, validity, [~c v b v ~b v c, ~b v ~a v ~a v ~a, ~a v ~b, b, c v ~b v ~b v ~c], 2000, count(2)).
tests(small_testcase2760, validity, [~b, ~a, ~a v a v ~b v ~b, ~a v b v c v ~b, a], 2000, count(0)).
tests(small_testcase2761, validity, [~c v ~a v b v c, ~b v ~a, ~b v c v a, c v ~c v a, c v b v b], 2000, count(3)).
tests(small_testcase2762, validity, [~c v ~b v ~a v ~a, ~b, ~a, a v b, c v b], 2000, count(0)).
tests(small_testcase2763, validity, [~b v ~b, ~a v ~b v ~b v b, ~a v c, b v ~a, b v c v ~c], 2000, count(2)).
tests(small_testcase2764, validity, [~c v c v c v b, ~b, ~b v b, ~b v c v a, c v ~a v a v ~c], 2000, count(4)).
tests(small_testcase2765, validity, [~c v b v a, ~b v ~a, ~a v c v ~b, a v c v ~b v b, b], 2000, count(2)).
tests(small_testcase2766, validity, [~b, ~b v ~c, ~b v b, ~b v b v c v ~c, b], 2000, count(0)).
tests(small_testcase2767, validity, [~b v a, ~a, b, b v ~b v ~a, c], 2000, count(0)).
tests(small_testcase2768, validity, [~c v ~c, ~b v b v c v a, ~a v c v a v c, b v ~b v ~b v ~c, b v a v ~a v a], 2000, count(4)).
tests(small_testcase2769, validity, [~c v ~c, ~b v ~b v ~a, ~b v b, b v b v ~b, b v b v ~a], 2000, count(2)).
tests(small_testcase2770, validity, [~a v ~a v ~c, a, b, c], 2000, count(0)).
tests(small_testcase2771, validity, [~c v c v c, ~b, b v ~c v ~b v b, c v ~c, c v ~a v c], 2000, count(3)).
tests(small_testcase2772, validity, [~c v c v ~a, ~a v a, b v ~a v ~a, c, c v ~c v ~a], 2000, count(3)).
tests(small_testcase2773, validity, [~c, ~c v c v ~a, ~a v a v c v c, b v b v a, c v ~c v ~b v ~a], 2000, count(3)).
tests(small_testcase2774, validity, [~b, ~b v b, a v a v ~c v b, a v a v b v c, c], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase2775, validity, [~c v c v ~a, ~c v c v a v ~c, a v ~a v ~c, a v a v ~b, c], 2000, count(3)).
tests(small_testcase2776, validity, [~c v b v ~c, ~b, a v c v ~b, b, c], 2000, count(0)).
tests(small_testcase2777, validity, [~a, ~a v a v c v a, b v ~a v ~c, c, c v a v ~c v ~b], 2000, count(2)).
tests(small_testcase2778, validity, [~c, ~c v ~a, a v ~c v ~a v a, a v ~b v ~b v ~a, c v a], 2000, count(2)).
tests(small_testcase2779, validity, [~c, ~a, ~a v b, b v ~b v ~c], 2000, count(2)).
tests(small_testcase2780, validity, [~c v b v ~a, ~a v a, ~a v a v ~c, b v b v ~b v ~b, c], 2000, count(3)).
tests(small_testcase2781, validity, [~b v ~b v b v c, ~b v ~a v c v ~c, ~a v b, ~a v b v ~a v ~a, a v ~a v a v a], 2000, count(6)).
tests(small_testcase2782, validity, [~c v ~c, ~c v ~b v ~c v ~a, ~c v ~b v ~c v b, ~b v b v ~b, c v b v b], 2000, count(2)).
tests(small_testcase2783, validity, [~b, ~a v a v ~b v ~a, b, b v c v ~c, c v ~c], 2000, count(0)).
tests(small_testcase2784, validity, [~c v b v a v ~c, ~b v ~c v c v ~c, b v ~c v a v b, b v ~a v b, c v ~b v a], 2000, count(4)).
tests(small_testcase2785, validity, [~c v a, a, b, b v ~c v ~c], 2000, count(2)).
tests(small_testcase2786, validity, [~b v b v ~c v b, a v ~b v b, a v a v ~a, a v b v ~c, b v b v b], 2000, count(4)).
tests(small_testcase2787, validity, [~c, ~a, ~a v ~c v b, ~a v a, a v a], 2000, count(0)).
tests(small_testcase2788, validity, [~b v a, ~b v c v c, b v ~b, c v ~a v a v b, c v c v a v c], 2000, count(4)).
tests(small_testcase2789, validity, [~c v b, ~c v c v b v b, a v ~c v ~b, a v b v b v ~a, c v ~b], 2000, count(3)).
tests(small_testcase2790, validity, [~c v ~c v ~b, ~a, a v b v ~c, b, b v b v ~c v ~b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase2791, validity, [~b v ~a v b v ~b, ~a v ~b, c v ~a, c v a v b v ~a, c v b], 2000, count(4)).
tests(small_testcase2792, validity, [~c v a, ~c v c v a v a, b v ~c v ~b v ~b, b v c v ~a, c v ~b v c], 2000, count(3)).
tests(small_testcase2793, validity, [~b, ~b v ~c v c, a v ~c v c, c, c v b], 2000, count(2)).
tests(small_testcase2794, validity, [~c, ~a v ~b v a, ~a v b v c v c, a v ~c v ~a v c, a v ~a v ~c v ~a], 2000, count(3)).
tests(small_testcase2795, validity, [~b v c v b v ~b, ~a, a v ~b v ~c, c v ~c v a v a, c v c v ~c], 2000, count(3)).
tests(small_testcase2796, validity, [~b v a, ~a, b, b v ~c v c v b, c v a v a], 2000, count(0)).
tests(small_testcase2797, validity, [~c, ~a v ~c v c, ~a v ~a v b, b, c v c], 2000, count(0)).
tests(small_testcase2798, validity, [~a v ~c, a v c, b, c v ~c, c v c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase2799, validity, [~c v c, ~b v a, ~a, c v ~c, c v ~c v ~a v ~b], 2000, count(2)).
tests(small_testcase2800, validity, [~c, ~c v b, b v ~b v ~a v ~a, b v b v ~a, c], 2000, count(0)).
tests(small_testcase2801, validity, [~c, ~c v ~c v b v b, ~b, c, c v b], 2000, count(0)).
tests(small_testcase2802, validity, [~a v c v ~b v c, a v ~a, a v b v ~a v ~b, a v b v ~a v c, c v a v ~a v ~a], 2000, count(7)).
tests(small_testcase2803, validity, [~c v c, ~b v c v ~b v ~a, ~b v c v c v ~b, b v a, c v ~b v b], 2000, count(4)).
tests(small_testcase2804, validity, [~b v ~b v ~a v ~b, ~a v ~b v b, a v ~b v c, a v b v ~c v ~c, b v ~a], 2000, count(2)).
tests(small_testcase2805, validity, [~b v ~c v ~c v ~c, ~a v ~c v a, ~a v ~a v ~b v ~b, a v a v ~c v ~a, b v a v c], 2000, count(4)).
tests(small_testcase2806, validity, [~b v c, a v c v c, b, b v b v ~c, b v b v ~a], 2000, count(2)).
tests(small_testcase2807, validity, [~b, ~b v a, ~a, a], 2000, count(0)).
tests(small_testcase2808, validity, [~c v b v ~c v c, ~b v a v ~b, a v c, b v c v b, c v ~c v a], 2000, count(4)).
tests(small_testcase2809, validity, [~c v a, ~b, ~b v ~a v c, ~b v c v ~b, a v ~b v ~b v ~c], 2000, count(3)).
tests(small_testcase2810, validity, [~c, a v a, b], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase2811, validity, [~b v ~a v a v c, ~a v b v ~b, b v ~c v ~c v ~a, c v a, c v c], 2000, count(3)).
tests(small_testcase2812, validity, [~c v ~c v ~a, ~b v ~c, b v a v a v c, c v ~c v a, c v c v a], 2000, count(3)).
tests(small_testcase2813, validity, [~b v ~a, ~b v c v ~b, ~a v ~b v b v c, b, b v b v a], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase2814, validity, [~c v ~b, ~b v ~b v ~c, ~b v ~a v ~b, ~a v b v ~a, b v ~b v ~b v ~a], 2000, count(3)).
tests(small_testcase2815, validity, [~c v b v ~b v c, a, a v a v c v c, b v b v ~a, b v c], 2000, count(2)).
tests(small_testcase2816, validity, [~b, ~a v ~c, a v c v a, c v a v ~b v ~c, c v c v c v ~b], 2000, count(2)).
tests(small_testcase2817, validity, [~c, ~b v b v ~c v a, ~a, ~a v c, b v c], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase2818, validity, [a v b v ~a v b, b, b v ~c, b v b, c v a], 2000, count(3)).
tests(small_testcase2819, validity, [~b v ~a v b v b, ~a, ~a v ~a v a v c, a], 2000, count(0)).
tests(small_testcase2820, validity, [~a, ~a v ~c, a, a v ~b v c v ~c, c], 2000, count(0)).
tests(small_testcase2821, validity, [~c, ~c v b v ~a v c, a v ~a v c, c, c v ~b], 2000, count(0)).
tests(small_testcase2822, validity, [~c v a, ~c v a v a, ~b v c v ~a, ~b v c v c v a, ~a v b v b], 2000, count(2)).
tests(small_testcase2823, validity, [~b, ~b v c, ~a v ~c v c v c, c, c v c v ~c v a], 2000, count(2)).
tests(small_testcase2824, validity, [~b v ~c, ~b v b, ~b v b v ~a, c], 2000, count(2)).
tests(small_testcase2825, validity, [~c, ~c v b v ~c, a v ~a, b v ~c, c v c v a v ~c], 2000, count(4)).
tests(small_testcase2826, validity, [~c v ~b v c, ~b, ~a v ~a v a v ~a, ~a v b v ~c, a], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase2827, validity, [~c v ~b v ~b, ~b, ~a v ~b, ~a v ~a v c v ~a, c v a v b v ~a], 2000, count(3)).
tests(small_testcase2828, validity, [~c v ~a v a, ~b v b v a v ~b, ~a, ~a v c, b v c], 2000, count(3)).
tests(small_testcase2829, validity, [~c v ~b v ~c, ~c v a v a, ~b, ~a v ~c v ~b, b v ~a], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase2830, validity, [a v ~c v b, a v a v ~a v b, b, b v c v ~c, c v b v c v c], 2000, count(4)).
tests(small_testcase2831, validity, [~c v ~c, ~c v a, ~a v ~c v c, b v ~b v b v a, b v a], 2000, count(3)).
tests(small_testcase2832, validity, [~a, ~a v b v ~a, a v ~c v ~c, b, c v ~b], 2000, count(0)).
tests(small_testcase2833, validity, [~c, ~b, b v ~b, b v ~a v c v ~b, c], 2000, count(0)).
tests(small_testcase2834, validity, [~c, ~b, ~b v ~c v ~a v ~b, ~a v ~c v a, b], 2000, count(0)).
tests(small_testcase2835, validity, [~c v ~a, ~c v b, ~a, b v b, c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase2836, validity, [~c v ~a v c v c, ~b v ~c v ~c v a, ~a, b v ~b v b, c v a v ~b], 2000, count(2)).
tests(small_testcase2837, validity, [~c v ~a v ~b v ~a, ~b v a v ~a, ~a v ~c, a v ~a v ~b v b, b v ~c v c], 2000, count(6)).
tests(small_testcase2838, validity, [~c v ~a v a v ~c, a v ~b v ~b v a, b, c, c v ~c], 2000, solution([(a, t) ,(b, t) ,(c, t)])).
tests(small_testcase2839, validity, [~b, ~b v ~b v c v ~c, b v ~a, c], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase2840, validity, [~c v ~c, ~c v ~a, ~a v ~b v ~c, b v a v ~c v c, c v c v c v b], 2000, count(2)).
tests(small_testcase2841, validity, [~b v ~c, ~a v ~b v ~c, ~a v ~b v b, c v b v ~a v ~c, c v c], 2000, count(2)).
tests(small_testcase2842, validity, [~c v ~a, ~b v ~c v ~a, a v ~a, b v ~c, c v ~a v ~b], 2000, count(4)).
tests(small_testcase2843, validity, [~c, ~b, b v ~b v c, b v ~a v c v c], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase2844, validity, [~c, ~c v a v b, ~a v ~c v c, a, b v a v a v ~b], 2000, count(2)).
tests(small_testcase2845, validity, [~c v a, ~b, ~a, a v c, c v a v ~c], 2000, count(0)).
tests(small_testcase2846, validity, [~c, ~a, a v ~a, a v ~a v c, c v ~a v c], 2000, solution([(a, f) ,(c, f)])).
tests(small_testcase2847, validity, [~c v a v a, ~a v ~a v ~c v ~b, b v ~c, c v ~a v a, c v b], 2000, count(2)).
tests(small_testcase2848, validity, [~c v c, a, a v ~b v ~c, b v c, c v b v c v ~b], 2000, count(3)).
tests(small_testcase2849, validity, [a v ~a, a v b v ~b, b v c v ~c, c v ~b, c v ~b v b v c], 2000, count(6)).
tests(small_testcase2850, validity, [a v b v ~a v ~a, a v c v b, b, c], 2000, count(2)).
tests(small_testcase2851, validity, [~b, ~a v ~b, ~a v a, a, a v a v b], 2000, solution([(a, t) ,(b, f)])).
tests(small_testcase2852, validity, [a, b v a, b v b v c, c v c v a], 2000, count(3)).
tests(small_testcase2853, validity, [~b v b v ~c, ~a v ~a v ~a v b, b v ~b v ~c, c, c v b], 2000, count(3)).
tests(small_testcase2854, validity, [~c, ~a v ~a v ~c, ~a v c v ~a v b, a, b v ~a v ~a v a], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase2855, validity, [~c v b v ~c v ~b, ~a, a v ~a v c v c, a v b, b v ~c v ~c v c], 2000, count(2)).
tests(small_testcase2856, validity, [~c v c v ~a v ~c, a, c v ~a], 2000, solution([(a, t) ,(c, t)])).
tests(small_testcase2857, validity, [~c v c v a v c, ~a v c v c v ~a, a, a v c v ~a, c v c v a v ~c], 2000, solution([(a, t) ,(c, t)])).
tests(small_testcase2858, validity, [~c v b v ~b v a, ~b v c v c, ~a v ~c, a, b v b v ~a v ~b], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase2859, validity, [~c v ~c v ~c v ~b, ~b v ~c v c, a, a v c, b], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase2860, validity, [~c v ~a v b v b, ~a v a, a v b v c v a, a v c, b], 2000, count(3)).
tests(small_testcase2861, validity, [~b, ~a, a v ~a, b v ~a v ~c, b v b], 2000, count(0)).
tests(small_testcase2862, validity, [~b v b, ~a v a v a, a, b v ~c v c, b v c v b v a], 2000, count(4)).
tests(small_testcase2863, validity, [~b, ~b v a v ~a v c, ~b v b v a, ~a v ~c v c, c v b v ~b], 2000, count(4)).
tests(small_testcase2864, validity, [~a, c v ~a, c v ~a v c, c v b], 2000, count(3)).
tests(small_testcase2865, validity, [~c v ~b, ~a v ~a v b, ~a v c, a v b, b v b], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase2866, validity, [~b v ~a v ~a, ~a v ~c v ~a, a v ~c v c, b, c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase2867, validity, [~a, a, a v b v a, c, c v b], 2000, count(0)).
tests(small_testcase2868, validity, [~a v c, ~a v c v ~b v a, a v ~a, a v a v c, b v ~a v a], 2000, count(4)).
tests(small_testcase2869, validity, [~c v ~a v ~a, ~b v b, a v ~b v ~a, c v a, c v a v ~c], 2000, count(4)).
tests(small_testcase2870, validity, [~c, ~a, a, b v c], 2000, count(0)).
tests(small_testcase2871, validity, [~c v ~b v ~a v c, ~c v b v c, ~a v a v a, a v ~a v a v ~c, b v ~c], 2000, count(6)).
tests(small_testcase2872, validity, [~a v ~a v a, ~a v b v ~c v ~b, c v ~c v ~c v b, c v ~c v b, c v ~b v ~a v a], 2000, count(8)).
tests(small_testcase2873, validity, [~b v ~a v c, ~a v ~b, a v b, b v ~c, b v b], 2000, count(2)).
tests(small_testcase2874, validity, [~c v ~a, ~b v b v a, ~a v ~b v ~c v b, a v ~c, a v b v ~a], 2000, count(4)).
tests(small_testcase2875, validity, [~c, ~c v b, a v c, c v ~c], 2000, count(2)).
tests(small_testcase2876, validity, [~c v a, ~b v ~c v ~a v a, ~b v a v a v ~b, b, c v b v ~a], 2000, count(2)).
tests(small_testcase2877, validity, [~b v c v ~b v ~b, ~a, a v ~b, b v ~c v ~b, b v ~b], 2000, count(2)).
tests(small_testcase2878, validity, [~c, ~c v a v ~b v c, ~b, ~b v ~b v ~c v ~c, b v c v a v ~a], 2000, count(2)).
tests(small_testcase2879, validity, [~a v ~b, ~a v ~a v ~b v ~b, a, a v ~c, b v ~b], 2000, count(2)).
tests(small_testcase2880, validity, [~c v ~b v a v ~b, ~b v a v a v ~b, a v ~a v c v ~c, b v ~c v ~a, b v b v ~a], 2000, count(4)).
tests(small_testcase2881, validity, [~c v ~a, ~c v a v ~b, ~a v ~a v ~a, ~a v b, ~a v c v a v c], 2000, count(3)).
tests(small_testcase2882, validity, [~a v ~a, ~a v a v c, ~a v c, a v ~a v b, c v ~c v b v b], 2000, count(4)).
tests(small_testcase2883, validity, [~c v ~b, ~b v c, a v ~b v a, c v ~c, c v ~a v ~b v ~b], 2000, count(4)).
tests(small_testcase2884, validity, [~c v b v a v c, ~b v b v ~a v b, ~a v a v b v ~c, a v ~c, c v ~c], 2000, count(6)).
tests(small_testcase2885, validity, [~c v ~a v b, ~a, b v ~a v ~b, b v a v a v ~a, c v ~a v ~b v ~b], 2000, count(4)).
tests(small_testcase2886, validity, [~b v a, a, a v ~a v ~c v a, b v ~b v b v a, c v ~c v a], 2000, count(4)).
tests(small_testcase2887, validity, [~a, ~a v c, b v a v ~c v a, c v ~c v b, c v b], 2000, count(2)).
tests(small_testcase2888, validity, [~c, ~b v ~a v a, a v ~b v b v ~c, a v ~a v a], 2000, count(4)).
tests(small_testcase2889, validity, [~b v c v a, a, b v ~a v a v ~a, b v a v b], 2000, count(4)).
tests(small_testcase2890, validity, [~c v c v b, ~a v ~a v c, ~a v a, b v c v ~c v ~c, c v ~c v ~a], 2000, count(6)).
tests(small_testcase2891, validity, [~c, a v ~b v ~a v ~a, a v b v a, a v c v ~a v ~c, b v ~b], 2000, count(3)).
tests(small_testcase2892, validity, [~b, ~a v ~c v ~b v a, a v a v ~b v ~a, c v b v ~b v b, c v c], 2000, count(2)).
tests(small_testcase2893, validity, [~b v b v ~b, ~a v ~b v a, ~a v a v ~a v c, a], 2000, count(4)).
tests(small_testcase2894, validity, [~c, ~b v ~a, c v ~c v ~a v ~b, c v ~a v ~a, c v ~a v c], 2000, count(2)).
tests(small_testcase2895, validity, [~b v b v ~c v ~c, ~b v c, ~a v c, a v ~b v ~a, b], 2000, count(2)).
tests(small_testcase2896, validity, [~b v c v a v ~a, ~a v ~b, a v ~a v a v ~c, a v ~a v c v b, c v ~c v ~c v ~c], 2000, count(6)).
tests(small_testcase2897, validity, [~a, a v ~b v ~c v ~b, a v ~b v a v ~b, b v c v ~a v a], 2000, count(2)).
tests(small_testcase2898, validity, [~b, ~a, ~a v ~b v c v ~a, a, b v c], 2000, count(0)).
tests(small_testcase2899, validity, [~c v ~a v c, ~b v c, a v ~c v c v ~b, b, c v ~a v b v c], 2000, count(2)).
tests(small_testcase2900, validity, [~c, ~a v ~b v ~a, a v ~b v ~a, a v a v ~b, b v ~b v b v ~c], 2000, count(2)).
tests(small_testcase2901, validity, [~c v ~a v a v b, ~c v c v b v a, ~a v b v ~b, ~a v c v a v ~b, c v ~b v a v b], 2000, count(8)).
tests(small_testcase2902, validity, [a v ~a v ~c v b, b v ~a v a, b v b v a v a, c v ~a, c v c], 2000, count(3)).
tests(small_testcase2903, validity, [~c, ~c v ~c v ~a, ~a v a v ~b, ~a v b, c v ~c v ~c v ~b], 2000, count(3)).
tests(small_testcase2904, validity, [~c v ~a v a, ~a v c v b, b v b v a v ~a, c v ~b, c v ~b v ~b v ~c], 2000, count(5)).
tests(small_testcase2905, validity, [~c v c v ~b v ~b, ~b, b v ~c, b v b v b, c v ~a v ~c], 2000, count(0)).
tests(small_testcase2906, validity, [~c, ~c v b v ~b v b, ~a v b, a v a, c v c v c v ~a], 2000, count(0)).
tests(small_testcase2907, validity, [~c v a v ~a v c, ~b, ~a, ~a v ~a, ~a v b v b v ~a], 2000, count(2)).
tests(small_testcase2908, validity, [~c v c, ~b v ~b, ~a v ~b v a, a v a v ~b, b v a], 2000, count(2)).
tests(small_testcase2909, validity, [~c v ~a, ~a v ~b v ~a v ~c, a, a v ~a, b v ~b v c], 2000, count(2)).
tests(small_testcase2910, validity, [~c v ~a v ~c, ~a v c v c, a, c v ~c v ~b, c v c v a v a], 2000, count(0)).
tests(small_testcase2911, validity, [~b v c, ~a, a v b v ~c v ~c, b v a v ~b v c, b v c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase2912, validity, [~c, ~a v ~c v ~b, b v c, b v c v ~a, c v ~a], 2000, solution([(a, f) ,(b, t) ,(c, f)])).
tests(small_testcase2913, validity, [~a v ~a v a v b, b v a, b v c, c v a v b, c v c v ~c], 2000, count(5)).
tests(small_testcase2914, validity, [~c, ~a, ~a v ~b, a v b v ~a, b v c v ~b v ~b], 2000, count(2)).
tests(small_testcase2915, validity, [~b v a v b, ~a v ~c, a v ~a, b v b v ~b v ~c, c], 2000, count(2)).
tests(small_testcase2916, validity, [~b, ~b v ~c v ~a v a, ~a v ~a v ~a, a, c v b v a], 2000, count(0)).
tests(small_testcase2917, validity, [~b, ~b v ~c, ~b v ~a, ~a v b v ~a v ~a, a v ~a v c v c], 2000, count(2)).
tests(small_testcase2918, validity, [~b, a v b, a v c, b v ~a, c], 2000, count(0)).
tests(small_testcase2919, validity, [~c v ~c, ~c v ~c v ~b v b, a v ~b v ~a, a v b v c, b v a], 2000, count(3)).
tests(small_testcase2920, validity, [a v c v ~c v ~b, b v ~b, b v b v ~b v a, c v b v c, c v c v b v c], 2000, count(6)).
tests(small_testcase2921, validity, [~c v ~b v ~b, ~b, ~a v ~c v c v ~b, a], 2000, count(2)).
tests(small_testcase2922, validity, [~c v ~b v a v ~c, ~b, ~a v ~a, b v ~b, c v a v a v ~a], 2000, count(2)).
tests(small_testcase2923, validity, [~a v ~a, a, b v ~c v a v a, c v ~c, c v b v ~a], 2000, count(0)).
tests(small_testcase2924, validity, [~c v ~c, ~c v b v c, b v a, b v c v ~a v ~a, c], 2000, count(0)).
tests(small_testcase2925, validity, [~c, ~c v a v b v ~c, ~c v c v a v ~a, a v ~c v ~a, b v ~a v ~b v ~b], 2000, count(4)).
tests(small_testcase2926, validity, [~c, ~c v b v c v ~a, ~b v ~c, ~a v c, a v b v ~a], 2000, count(2)).
tests(small_testcase2927, validity, [~c, ~c v ~c v a v b, a v ~c, a v ~c v b, b v ~b v ~c], 2000, count(4)).
tests(small_testcase2928, validity, [~c v ~a, ~a, a, b], 2000, count(0)).
tests(small_testcase2929, validity, [~c, ~c v ~a, ~b v c, b v ~b, c v ~c], 2000, count(2)).
tests(small_testcase2930, validity, [~b v ~a, ~a, a v b v ~b v ~b, a v c v ~c, b], 2000, count(2)).
tests(small_testcase2931, validity, [~b v ~c v ~a, ~b v ~c v c, ~a v ~c v a, a, a v c], 2000, count(3)).
tests(small_testcase2932, validity, [~c, ~c v ~c v ~b, ~b v ~c v ~b, ~b v a, ~a v b], 2000, count(2)).
tests(small_testcase2933, validity, [~a, ~a v b, a, b v b v ~b v b, c], 2000, count(0)).
tests(small_testcase2934, validity, [~c v ~b v c, ~b v b, c v ~a v a v b, c v a, c v c], 2000, count(4)).
tests(small_testcase2935, validity, [~c, ~b v b, a v ~c, c, c v ~b v ~a v ~b], 2000, count(0)).
tests(small_testcase2936, validity, [~c v ~c v c, ~b v ~a v b, ~a v ~c v a v ~a, ~a v a v ~a, c v b], 2000, count(6)).
tests(small_testcase2937, validity, [~c, ~c v ~c v a v ~a, ~c v ~a v a, ~b v c, b v ~a v ~a], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase2938, validity, [~c, ~b, ~a, b, c], 2000, count(0)).
tests(small_testcase2939, validity, [~b v ~a v a, ~a v a v ~a, b, b v a v a, c], 2000, count(2)).
tests(small_testcase2940, validity, [~c v ~b v ~c, ~b v ~a v ~c v ~a, ~a v b v ~b v ~c, ~a v c v b v ~a, c v ~a], 2000, count(4)).
tests(small_testcase2941, validity, [~c v ~b, ~c v ~a v c, ~c v c v ~b v ~a, a, b v ~c], 2000, count(2)).
tests(small_testcase2942, validity, [~c v ~a v ~c, ~b, ~b v ~a, ~a v ~c v ~c, ~a v a v ~a], 2000, count(3)).
tests(small_testcase2943, validity, [~c v ~b v a v ~c, ~b, ~b v ~b v ~a, c v a, c v c], 2000, count(2)).
tests(small_testcase2944, validity, [~c v c v ~a, ~b, ~b v ~c, ~a v b], 2000, count(2)).
tests(small_testcase2945, validity, [~c v ~c, ~c v a, ~a v a v c v ~c, a v c, b v ~b v ~a], 2000, count(2)).
tests(small_testcase2946, validity, [~b v a v a, ~a, b v ~a v ~c, c, c v a], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase2947, validity, [~c, ~c v c, ~b v ~c, ~a, c], 2000, count(0)).
tests(small_testcase2948, validity, [~b, ~a, b v a v c, b v b v ~a, c v c v c v a], 2000, solution([(a, f) ,(b, f) ,(c, t)])).
tests(small_testcase2949, validity, [~c v ~c v b, ~c v b v a v ~a, ~b, ~a v ~c v c v ~a, a v c v b], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase2950, validity, [~c, a v b v a v ~a, b v a v c v ~c, b v b, c v ~a v ~c v c], 2000, count(2)).
tests(small_testcase2951, validity, [~b v b v c v c, ~a v ~a v ~c, ~a v a v ~b v c, a, c v ~c], 2000, count(2)).
tests(small_testcase2952, validity, [~c, ~b, ~b v b v b v b, b v ~c v ~c v a, b v c], 2000, count(0)).
tests(small_testcase2953, validity, [~c v ~a v ~c v ~c, ~a v b, ~a v c, c v ~a v ~a v ~b, c v a v ~b v b], 2000, count(4)).
tests(small_testcase2954, validity, [a v ~b, b v ~b v ~c v ~a, b v c, c, c v c v ~c v ~a], 2000, count(3)).
tests(small_testcase2955, validity, [~c, ~b v c v ~b v ~b, b v ~a, b v a v a v ~b, c v a v ~c v b], 2000, solution([(a, f) ,(b, f) ,(c, f)])).
tests(small_testcase2956, validity, [~c v c v b, ~a v ~b, b v ~c, b v ~a, c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase2957, validity, [~b v ~a v a, ~a v b v ~a, ~a v b v b, a, b v b], 2000, solution([(a, t) ,(b, t)])).
tests(small_testcase2958, validity, [~c v ~c, ~a, a v a, b, c v ~a v b v b], 2000, count(0)).
tests(small_testcase2959, validity, [~c v ~a v ~c, ~b, a v b v ~b v a, c v ~b v ~b, c v ~a], 2000, count(2)).
tests(small_testcase2960, validity, [~b v c v c v c, ~a v a v a, ~a v b v ~b v c, a v ~a, a v a v ~c], 2000, count(4)).
tests(small_testcase2961, validity, [~c v a v ~b v ~c, ~c v b v ~b v c, c, c v ~c v b v ~c, c v ~b v a v a], 2000, count(3)).
tests(small_testcase2962, validity, [~c v ~a v a, b, b v ~a v ~b v b, b v a v c v b, c], 2000, count(2)).
tests(small_testcase2963, validity, [~b, a v a v a, c, c v ~a v a v ~b, c v c v c], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase2964, validity, [~c v b, a, a v a v b v ~a, a v c v ~c, b v ~b v c v ~a], 2000, count(3)).
tests(small_testcase2965, validity, [~b, ~b v b v ~a, ~b v c, ~a v c v a v ~c, b v ~c], 2000, count(2)).
tests(small_testcase2966, validity, [~c, ~c v ~c, ~c v a, ~c v c v ~a v c, c v ~b v b v ~b], 2000, count(4)).
tests(small_testcase2967, validity, [a v ~a v ~c v a, a v a v ~c, a v a v c, b v ~b, c v a], 2000, count(4)).
tests(small_testcase2968, validity, [~b v ~c v c, ~b v ~a v a, ~b v ~a v b, ~a, b], 2000, count(2)).
tests(small_testcase2969, validity, [~c v a v ~b v a, ~a v c, b v ~a v a v ~a, c v ~a, c v b v ~a v c], 2000, count(5)).
tests(small_testcase2970, validity, [~c v a v c, ~b, ~b v ~a v ~c v ~c, b, c v ~c], 2000, count(0)).
tests(small_testcase2971, validity, [~a, ~a v c, a v a, b v b v ~c], 2000, count(0)).
tests(small_testcase2972, validity, [~c v ~b v ~a v ~c, a, a v ~a, b v ~b, c v ~a], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase2973, validity, [~c, ~b, ~b v b v ~a v ~a, a v ~c v ~c, b], 2000, count(0)).
tests(small_testcase2974, validity, [a, a v ~c v ~b v ~a, a v ~a, b v ~b v c, b v c v ~a v ~a], 2000, count(3)).
tests(small_testcase2975, validity, [~c v ~c, ~b, ~a v ~b v ~b v c, a v b, b v c v ~c], 2000, solution([(a, t) ,(b, f) ,(c, f)])).
tests(small_testcase2976, validity, [~b, a, b v c, c v c v ~c v ~a], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase2977, validity, [~c, ~c v ~b v ~a v ~a, ~b v a v b v c, a v c v c v c, b], 2000, solution([(a, t) ,(b, t) ,(c, f)])).
tests(small_testcase2978, validity, [~b v c v c v ~c, ~a v ~c v c v c, a, a v b, b], 2000, count(2)).
tests(small_testcase2979, validity, [~b, ~b v b, a, c v a v ~a v ~c, c v c v c v c], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase2980, validity, [~c v c, ~b v c v ~a v a, a, b v c v a, c v b], 2000, count(3)).
tests(small_testcase2981, validity, [~a, ~a v b v b v ~a, b, b v b v ~a v b, c v ~a v ~b], 2000, count(2)).
tests(small_testcase2982, validity, [~a v a, a v ~a, a v b v ~c v b, b, c v c v a v c], 2000, count(3)).
tests(small_testcase2983, validity, [~b, a v ~c, b v a, c v b, c v b v ~c], 2000, solution([(a, t) ,(b, f) ,(c, t)])).
tests(small_testcase2984, validity, [~a, ~a v ~b, a v ~b, b v b, c v ~b v c v ~a], 2000, count(0)).
tests(small_testcase2985, validity, [~a, b, c v a, c v c v ~b], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase2986, validity, [~a, ~a v c v c, a v ~c, b v ~c v a v ~b], 2000, count(2)).
tests(small_testcase2987, validity, [~c, ~c v ~b v ~c, ~a v a, ~a v b, b v ~a v a], 2000, count(3)).
tests(small_testcase2988, validity, [~b v ~a, ~a v a v ~c, ~a v b, a, c v ~a], 2000, count(0)).
tests(small_testcase2989, validity, [~c v b v c v a, ~a v c v b, a, c v a v a v c], 2000, count(3)).
tests(small_testcase2990, validity, [~a, ~a v ~b, a v a v c, c, c v ~a v c], 2000, count(2)).
tests(small_testcase2991, validity, [~c, ~b v ~c v ~c v c, ~b v ~a v c, a, c], 2000, count(0)).
tests(small_testcase2992, validity, [~a v b v a v ~b, ~a v c v ~a, a, c, c v c v ~b v b], 2000, count(2)).
tests(small_testcase2993, validity, [~c, ~b v ~c, a, a v ~c v ~a v a, b v ~c], 2000, count(2)).
tests(small_testcase2994, validity, [~b v ~c v b v ~a, ~a v ~b v ~a v ~c, b, b v ~c v b v ~c, c], 2000, solution([(a, f) ,(b, t) ,(c, t)])).
tests(small_testcase2995, validity, [~c v ~b v ~b, ~b v ~b, ~a v ~c v b v a, a v ~b, c v ~c v ~c], 2000, count(4)).
tests(small_testcase2996, validity, [~c, ~c v ~b v ~a v b, a v a v a, b v ~b v ~a, c v a v ~c], 2000, count(2)).
tests(small_testcase2997, validity, [~c v b v a v b, ~b v ~b, ~b v ~a v b v a, a v ~a v ~a v ~a, b], 2000, count(0)).
tests(small_testcase2998, validity, [~b v ~c, ~b v a, ~a, ~a v ~a v c, c v ~a], 2000, count(2)).
tests(small_testcase2999, validity, [~b v a, ~a v ~b v c v c, a v a, b v b v c, c v ~c v a], 2000, count(2)).
tests(big_testcase0, validity, [~i v e v c, ~i v i v a, ~i v j v ~h v ~e, ~h v ~i v c v d v ~i v ~c v ~j v g v ~e, ~h v ~f v ~i v ~h v ~b v ~i v ~j v e v a, ~h v ~c v d v e v ~d v d, ~h v ~a v i v b v ~b v ~a v b v ~j v ~j v ~i, ~h v d v e v ~d, ~h v j v ~c v j v i v a v ~e, ~g v j v a v e, ~f v d v ~j v e v e v c v ~b v ~b, ~e v ~a v ~b v ~f v ~f v g, ~e v a v ~e v ~e v h v ~j v i v f, ~e v f v ~f v ~g, ~d v ~j v ~e v a v d, ~d v ~h v ~c v ~c v ~a v ~a v ~f, ~d v ~f v e v ~d v i v ~g v i v a v ~h v j, ~d v d v ~b v a v b v ~i v ~i v j v c, ~c v ~e v g v f v ~d v f, ~c v c v ~f v a v ~f v a v i v h v d v j, ~b v ~c v ~j v h v c v ~b v ~f v ~j v i, ~a v ~f v g v ~j v j v ~a, ~a v ~a v ~j v ~i v ~h v ~f v ~d v c, ~a v i v e, a v ~h v ~j v ~f v h v e v ~j, a v ~h v ~e v j v ~g v c v f v c, b v ~f v i v ~c, b v b v ~b v ~i v j, b v g v ~j v h v j, c v ~i v j v ~c v ~g, c v ~e v g v ~d v ~f v h v e, c v j v f v ~j v ~c v ~d v f, d v d v i v g v j v d v ~a, d v h v e, e v ~h v ~f, e v ~f v b v f v ~f v c v j v ~i, f v b v ~d v g v ~a v ~d v ~e, f v f v i v e v a v ~b v ~e, f v j v ~f v ~g v ~g v e v a v i, i v ~j v ~j v e, i v ~h v ~a v ~a v ~j v i v ~h v ~i v d, i v ~h v c v a v ~f v d v g, i v ~f v ~j v d v ~g v ~d v ~h v d, i v ~c v ~c v g v b, i v a v ~c v ~a v ~b v ~f v ~g v i, i v c v e v ~d v ~h v ~a v i v ~h v ~i, i v h v ~a v ~g v ~e v g v ~g, i v i v ~f v b v d v j v h, j v ~i v a v j v j v ~h, j v ~a v ~i v ~a v f], 2000, count(335)).
tests(big_testcase1, validity, [~j v ~i v ~a v c v e, ~j v ~h v b v ~e, ~j v ~a v ~a v ~i v d, ~i v ~e v d, ~i v ~c v d v e v b v c v d, ~h v e v c v d v ~d v ~j, ~h v i v ~d v c v ~a v h v ~i v ~b v i v ~h, ~g v ~a v e v e v ~b v e v a v ~c v ~h, ~f v ~d v ~b v ~a v f v d v g v a v h v ~e, ~f v ~b v ~j v g v ~c v ~a, ~f v b v ~c, ~f v b v g v ~a v f v ~c v h v ~f v b v e, ~f v d v ~d v b, ~f v h v c, ~e v ~g v d v ~h v ~a v b v ~h v c v b, ~e v b v c v f v f v i v ~h, ~d v ~e v ~f v e, ~d v ~a v ~f v ~f v ~i v ~i v ~c v h v ~g v c, ~d v ~a v a, ~d v a v ~f v ~c v a v ~f, ~d v b v ~i v ~f v ~h v c v ~j v ~f v ~j v a, ~d v c v ~j v ~e v ~g v ~h v ~f, ~b v ~j v ~h v e v ~d v i v f v g, ~b v ~b v g, ~b v e v d v ~f v b v ~j, ~a v a v ~f v i, ~a v b v ~b v d v ~d, ~a v c v b v ~f v ~a v ~h v ~c v ~g v g, ~a v d v f v b v h, a v ~h v i v c v ~i v ~e v h v ~d v ~h, a v j v j v ~d v ~d v ~j v b v a, b v d v e v h v ~a, c v ~j v f v ~g v g, c v ~b v c v e v ~e v i v i v g, d v d v ~e v ~c v ~a v ~e v ~h v b, e v ~j v ~b v j v ~a v g v ~c, e v ~h v ~g v ~b v ~a v i, e v ~g v b v f v ~d v d v a, e v j v ~j v ~e v ~i v e v ~j v ~e, f v ~e v h v ~b v i v a v ~d v f v ~b, f v h v ~i v h v c v a v ~d v e v ~b v ~a, g v ~g v c v f, g v ~f v ~j v ~b v d v ~b v e, g v ~d v ~d v c v ~h, g v a v ~c v e, h v ~a v ~a v a v ~h v ~d, i v ~b v h v e v g, i v d v e v ~i v g v g v a v e v ~e, i v e v c v ~j v ~i v ~i v ~j v ~g v j v ~j, j v g v d v b v ~c], 2000, count(302)).
tests(big_testcase2, validity, [~j v ~i v ~i v ~j v j v j, ~j v ~i v c v g v j v b v ~d v ~g v ~h v ~j, ~j v c v ~h v ~a v ~i v d v j v i v ~b, ~i v b v ~h v ~d v ~c v ~a v d v h, ~i v i v ~d, ~h v ~e v ~f v ~a v c, ~h v ~c v ~i v ~e v d v ~h, ~h v c v ~c v h v ~e v i v ~e v ~j v b, ~h v e v b v ~h v c, ~g v ~c v ~j v h v e v c v h v ~j v d, ~g v ~b v a v b v ~f v ~f v b, ~f v ~j v j v ~j v d v ~h v b v ~d v ~i, ~f v c v b v ~d v ~a v ~b v c v a v ~b, ~f v c v i v ~b v ~a v ~f, ~e v ~g v j v j v ~c v ~c v ~g v ~h v e, ~e v ~b v ~d, ~e v a v ~i v h v b v i v b v d v ~f, ~e v a v i, ~e v b v ~c v ~j v ~e v ~j, ~e v c v f v a v c v d v d v ~d v ~b v ~f, ~c v b v ~b v d, ~c v i v ~a v ~a v ~c v i v j v ~a v i, ~b v a v i v ~a v a, ~a v h v ~c, a v ~i v ~a v ~d v e v ~j v g v f v g, a v ~c v ~h v ~h v ~e v ~j v ~b, a v h v a v h, c v ~c v ~f v ~b v a v ~a, c v ~b v ~h v ~f v ~a v a v ~b v ~g v ~d, c v b v ~c v b v e v a v ~e v ~f v ~c v ~c, c v f v ~e v ~d v ~a v ~g v ~b v ~c v ~b, d v a v ~j v b v j v j v i, d v h v i v ~d, e v ~i v ~c, e v ~g v ~b v ~i, e v b v ~a v ~f v ~f v ~j v ~g v i v ~g, e v c v f v i v g v ~g v ~i v ~j, e v g v ~d, f v ~h v ~h v ~d v e v h v i v ~e v ~j v ~a, f v ~c v f v f v h v c, f v f v ~j v ~c v ~e v a v e v j v ~g, g v ~h v e v h v a, g v e v i v ~j v e, h v ~h v ~i v ~a, h v ~b v e v a v ~f v f v ~e v j v ~i, h v j v c v ~d, i v ~a v ~g v ~b v ~a v g v f, j v ~h v ~i v ~g v ~a v c v ~i v c v ~c, j v b v c v ~f v ~j v ~h, j v g v d], 2000, count(136)).
tests(big_testcase3, validity, [~j v f v ~b v d, ~i v ~f v c v ~f v a v f, ~i v a v ~b v ~c v i v h v ~i, ~i v b v ~c v ~e v ~g, ~h v ~f v j v ~j v ~e v ~g v ~e, ~g v ~j v c v ~h v ~h v e v i, ~g v ~i v g v e v ~b v g v ~c v ~c, ~g v ~h v f v ~b v ~i v f v f v d, ~g v ~c v b v ~b v ~b v ~e v e v g v f v e, ~g v ~a v ~j, ~g v ~a v d v ~h, ~g v h v i v b v ~i, ~f v ~f v ~b v ~a, ~f v a v ~a v ~a v ~i v f v ~a, ~f v a v c v ~d v ~a v ~f v i v f, ~e v f v c v j v f v h v ~b v ~d, ~e v g v ~b v ~e, ~e v h v ~d v b v ~c v ~c v b v d, ~c v d v ~g v a v ~f, ~b v ~d v ~e v e v ~i v ~i v ~j v f v ~a, ~b v ~a v ~c v ~c v a v i v ~c v h, ~b v e v ~b v ~h, ~a v ~j v i v ~b v j v ~j v ~d v ~h v a, ~a v ~a v ~a v j v ~i v ~c v ~h, ~a v d v j v h v ~d v ~j v f v ~f v e, ~a v e v ~i v ~h v ~h v d v e v ~c v b, a v ~d v ~i v i v a v ~f v f v f v ~i, a v ~c v f, a v f v ~i v ~i v ~c v h v ~e v d v d v ~d, a v h v ~d v ~i v ~h, b v ~j v b v f v h v a v ~d v ~b v c v ~b, b v ~g v h v c v ~a v j v g, b v d v ~d v ~f, b v i v j v ~c v d v ~g v b v f, c v ~d v a v ~e v d v h, c v ~a v i v ~i v ~a v ~f, c v g v c v ~a v j, d v i v i v ~j v ~d, e v ~j v ~e v ~b v f v a v a v ~f v ~f v ~d, e v ~g v ~a, f v ~j v ~d v ~h v e v e v g v ~i v ~f v f, g v f v ~d v h v ~d v b v d v ~d v ~i v a, g v f v ~c v h v g v ~g v ~c v g v a v ~g, g v h v a v f v b v j v c, g v j v ~f v e v b v h v e v a, i v c v f v e v ~h v ~a v ~f v ~e, i v j v h v d v ~f v ~g v ~d v c v ~d v h, j v ~h v ~a v i v d v ~f v ~i v d, j v ~c v ~g v d v ~a v g v i v ~f v f v a, j v j v g v i], 2000, count(305)).
tests(big_testcase4, validity, [~j v h v ~d v ~h v ~j, ~i v ~d v j, ~i v ~c v ~f v ~f v ~i, ~i v ~c v i v c v ~g v ~j v ~f v e v ~e v a, ~i v g v a v j v j v g v e v ~a v ~e, ~i v g v d v ~i v ~c v f v ~f v ~g v ~f, ~h v ~a v ~j v ~g v ~d v ~i v b v h, ~g v g v e v ~g v ~a v a v ~a v ~b v ~f, ~g v i v ~j v ~a v g v ~h v j, ~e v ~i v g v h v ~b v ~c v ~h v ~j v ~f, ~e v ~h v ~a, ~c v ~e v ~b v b v ~h, ~c v d v ~b v j, ~b v ~g v ~i v ~h v ~c v e v a v ~a, ~b v ~b v ~j v ~c v ~e v ~a v j v j, ~b v b v a v ~b v i, ~b v e v ~g v ~f v ~i v ~i v ~e v ~f v ~f, ~b v f v ~b v ~b v ~g v ~d, ~a v d v ~b v j v j v ~d v ~j, ~a v j v a v ~h, a v a v c v j, a v b v ~e v d v j, a v g v e v ~g v g v ~h v ~b v f v d, a v i v ~h, b v ~h v ~b v g v g, b v ~h v a v ~f v ~h v c v h v ~e, c v ~e v ~a v ~b v ~g v ~b, c v ~a v ~b, c v e v ~j v c, c v e v ~c v ~d v ~a v d, c v i v ~e v a v ~g v h v f, d v g v e v ~d v e v ~b v ~j v ~i, d v g v h v b v ~f v a v ~a v d, e v c v a v j v h v ~g, f v ~j v e, f v ~f v ~d v ~g v ~e v c v ~e, f v ~f v g v ~h v ~j v a v e v b v ~e, f v ~a v ~b v ~j v ~j v j v h, g v ~d v j v ~e v ~i v ~d v ~b v f v j v ~g, h v ~g v ~h, h v ~e v e v ~j v ~h v ~f v ~h v ~f v ~j, h v f v ~h v a v d v ~b v a v i, h v g v j, h v h v ~c v d v ~c v a v g, h v h v b v ~b, i v ~c v ~i v i v i v ~j v j v ~e, i v ~a v ~d v d v ~d v ~a v i v ~c v h, i v c v j v ~d v g, i v e v ~h v ~i v j, j v ~b v ~f v ~h v f], 2000, count(183)).
tests(big_testcase5, validity, [~j v ~g v h v ~d v ~e v ~d v h v ~j v h v ~d, ~j v ~a v h, ~i v ~d v c v ~e v a, ~i v i v ~f v h, ~h v ~h v ~h v f v i v b v e, ~h v ~b v ~d v c v g v g v d v ~i, ~h v b v ~g v ~h v a, ~h v c v ~c v c, ~h v d v ~g, ~g v ~b v a v e v c v j, ~g v ~a v c v ~i v g, ~g v a v a v ~g v e v a, ~e v ~d v c v ~i v a v ~a v d, ~e v d v ~b v ~i v ~e v d, ~e v h v ~a v ~e v ~j v e v b v ~e v d, ~e v i v ~g v f v g v i v c, ~d v ~h v i, ~d v ~f v c v d v ~c, ~d v b v c v ~e v ~j v ~b v ~f v ~g v ~g v h, ~b v i v ~i v ~h v ~g, ~a v h v c, ~a v j v ~i v ~a v ~i v h v ~f v ~i, a v b v e v d v ~c v a v e v j, a v f v ~h v ~f, b v ~g v a v ~e v ~a v ~e v ~e v d v ~c v ~j, b v ~g v f v ~d v e v ~d v f v c v b v ~d, c v ~h v ~i v ~a v ~f v i, c v ~f v ~e v ~g v ~d v ~a v f, c v i v ~g v ~j v ~i v ~g v ~g v i v ~b, c v i v a v f, c v j v ~c v ~g v i v c v h v b, d v ~h v ~e v ~j v ~d v ~a v h, d v ~c v ~e v g v ~j v ~g v g v c v c v h, e v ~d v ~j v i, e v ~d v ~a, e v d v g v ~e v ~f v ~a v b v h v ~b, e v h v ~e v ~g v ~b v ~e v ~c v ~e v d v i, f v ~c v ~h v ~i v ~e v ~h v ~b v ~g v d v ~c, f v ~c v c v ~d v e, f v b v b v e v ~j v f v ~j v d, g v ~a v i v ~a v j v c v c v f v j, h v i v a v g v ~a v a v a, i v b v b v b v ~e v b v ~d v ~i v ~f v b, i v e v h v ~e, i v g v a, j v ~i v h v ~i v ~j v ~c v g v h v j, j v ~a v ~d v c v e v f v ~e v b v f v ~b, j v e v d v ~d, j v f v e v ~h v h, j v i v ~i v ~e v ~f v g v b v b], 2000, count(235)).
tests(big_testcase6, validity, [~j v d v c v e, ~i v ~j v ~c v e v h v ~g v ~d, ~i v ~g v h, ~i v ~e v ~f v g v b v ~j v c, ~i v ~c v ~f v ~c v ~i, ~i v i v ~d v b v g v ~i v ~f, ~h v b v ~d v b v c v ~a v e v a, ~g v c v ~a v f v h v i v ~c v ~a, ~g v d v ~i v h v ~a, ~g v d v ~f v d v ~c v c v ~h, ~g v g v a v ~g v g v e v h, ~g v h v ~c v ~j v ~d v ~f, ~f v ~a v f v e v ~a, ~f v e v e v c, ~f v f v e v f v ~e v d v i v ~f, ~f v j v ~i v c v i, ~e v ~i v ~h v ~i v b v ~h v a v f, ~e v ~g v ~a v e v e v ~b, ~e v a v ~c v ~i v f v ~f v d v b, ~e v b v f v ~h v a, ~e v e v j v e v h v i v h v ~i, ~d v ~b v c v ~i v ~d, ~d v ~a v ~j v d v ~e v g, ~d v h v ~g v e v ~g v i, ~c v ~h v g v ~d v i, ~c v d v ~h v h v ~i, ~c v f v ~e v c v ~d v b v g v ~d, ~c v h v ~a v d v d v a v ~i v d v g, ~b v ~c v e v i v ~d, ~b v d v ~a v ~d v g v ~e v ~h v ~b, ~a v ~a v b v a v ~j v f, a v ~c v ~b v e v h, b v h v ~d v ~c v f v ~i, c v ~b v j v ~i v ~b v i v ~e v a v ~d v ~h, e v ~i v ~h v ~b v ~j v ~d, e v h v ~g v ~e v d, f v a v ~a v h, f v e v ~i v ~d v f v ~f v i, g v ~g v i v f v ~f, h v ~e v ~d v ~c v b v ~e, h v ~e v a v h v e, h v d v e v g v b v j v ~b v ~i, i v ~e v ~j v f v ~a v j, i v e v ~f v ~b v ~e v ~j v ~e v ~j, i v f v ~d, i v j v g v ~a v ~h v ~d v a v g v ~h, j v ~c v ~d v ~c v ~j, j v a v ~j, j v b v ~f v i v e v ~g v ~d, j v d v f v i v b v ~i v ~f v ~i v ~i], 2000, count(396)).
tests(big_testcase7, validity, [~j v ~f v ~f v f v f v ~d v b v h v ~j, ~j v ~a v h v ~h v e v j v ~d v j v ~c, ~j v a v ~j v ~e v ~h v ~f v e v d, ~j v i v ~g, ~i v ~c v ~b v a v c v ~d v d v ~c, ~i v ~b v e v ~c v ~f v g v ~a v ~h, ~h v f v ~a v i v ~b v ~b v ~j v e v h, ~g v ~g v ~f v ~c v ~e v ~b v j v e, ~g v c v ~f v ~c v ~f v j v ~j v f v ~c v a, ~g v e v ~d v b v h v b, ~f v ~j v ~f v ~h v c v f v g, ~f v ~e v f v j v ~i v ~f v c, ~e v a v ~c v g v g v ~b, ~e v d v ~c v e v ~e, ~d v f v b v ~j, ~c v ~h v a v f v ~g v f v e v c v ~e, ~c v ~c v g v c v b v ~e, ~c v a v c v a v c, ~b v ~a v f v b v ~d v f v ~i v ~h, ~b v f v ~d v ~a, ~a v f v f v b, ~a v j v ~j v ~f v d v a, a v ~a v ~c v ~a v ~i v b, a v d v j v e v ~i v ~a v d v j, a v j v i, b v ~b v d v ~i v ~c v b v h v d v c, b v d v ~j v ~h v c v c v ~h v ~a v ~e v ~j, b v f v ~d, c v b v ~f v g v j v ~c v ~g, c v b v b v i v ~f, c v h v c v ~i v ~i v ~b v ~d v f v ~i, d v ~c v ~i, d v ~a v ~i v f, d v f v d v b v d v c v ~e v d v ~i, e v ~e v ~b v ~j v g v ~j v b v ~d v h, e v ~b v d v h v g v i v j v i v ~b v a, e v ~a v g v e v ~j v g v ~h v b v e, e v j v ~f v g v ~a v ~g v g v ~a v ~f v f, g v ~d v g, g v h v ~e v ~c v ~c v d v ~d v h v b v ~f, h v ~e v ~h v a v ~a, h v b v b v d v ~a v j v j v ~e v ~i v ~g, h v b v c v ~g v f v ~j, h v d v i, h v e v b v ~g v f v a v ~f, h v i v f v ~d v b, i v ~h v f v e v i v ~c v b v ~g v g, i v ~f v j v ~h v j v i v j v ~h, j v ~h v ~i v ~h, j v f v ~h v f v ~c], 2000, count(139)).
tests(big_testcase8, validity, [~j v d v ~f v h v j v f, ~j v d v ~b v c v a v e v ~j v ~f v ~d, ~j v g v ~j v ~h v g v ~j v ~e v h v b, ~i v ~c v ~h v ~c v f, ~i v a v h v ~b v a v ~c, ~i v a v i v ~c v ~d v j v ~a v ~c, ~h v ~j v ~b v ~j v j v ~g v g v a v ~g v b, ~h v ~d v h, ~h v j v h v a, ~g v ~e v ~b v ~g, ~f v ~e v e, ~e v ~d v c v d, ~e v ~a v ~a v e v ~d v ~a, ~e v c v ~f v ~i v e v ~j v e v ~f v d, ~e v h v e v h v a v ~g v ~b, ~e v i v g v ~a v c, ~d v ~h v j, ~d v ~g v i, ~d v ~e v i v j, ~d v c v e v ~h v ~h v ~i v c v f v j, ~d v g v g v ~a v ~b v ~d v a v f, ~c v ~i v i v a v a v i v ~h v ~j, ~c v ~f v ~e v f v ~e v ~g v ~e v f v ~g v c, ~c v c v b, ~c v j v e, ~b v f v f v ~g, ~b v g v ~j, ~b v i v ~d v a v i v h v h v ~e v g, ~a v h v i, a v ~h v i v ~d v ~c v f v h v i v ~b, b v ~c v ~h v j v g, b v ~a v ~c v ~j v a v i v g v ~h v ~g v a, b v d v f v f v ~e v b v h v ~i v e, b v g v ~c v ~i v b v h v a v ~g v b v d, c v ~c v g v c v a v d v c v d, d v ~b v f v i v ~f v b v e v d, d v i v ~i v ~f v ~a, d v j v e v b v ~j v ~a v ~c v c, e v ~b v ~f v ~b v e, f v a v b v ~j, f v e v ~f v f v a v ~j, g v ~f v f v ~i v g v i v ~h, g v e v ~b v ~g v h v i v ~h v g v ~i v ~g, i v ~i v d v b v ~j, i v b v ~j v ~f v ~a, i v c v a v ~b v e, i v j v ~g v ~h v ~e v ~f v i v a v a v b, j v ~i v f v ~g v h v e v d v ~j, j v ~c v j v e, j v ~b v a v c v ~g v g v d v g v ~i], 2000, count(253)).
tests(big_testcase9, validity, [~j v ~a v ~h v e v ~c, ~j v b v f v ~d, ~j v j v ~j v f v ~f v d v ~f v ~a, ~i v e v ~f v b v ~g v ~c v ~e v ~j, ~h v ~c v b v h v g, ~h v ~a v g v j v h v ~j v ~d, ~h v h v ~e v ~a v b v ~i v e v ~i v ~j v ~c, ~g v ~d v i, ~g v b v e v ~f v ~d v g v ~a v i v ~e v c, ~f v ~f v c v ~a v ~b v j v ~a v ~h v g v i, ~f v ~e v e v ~a v g v ~a, ~f v ~d v e v e v ~e, ~f v a v ~c v ~d v ~e v ~h v ~h v c, ~e v ~b v a v b, ~e v h v ~j v b v e v ~a, ~d v ~g v ~e v ~h v ~e v ~c v g, ~c v ~j v j v b v ~e v ~h v f v d, ~c v ~a v ~a, ~c v a v ~f, ~c v b v f v ~j v ~b v f, ~c v e v a v ~g v ~f, ~c v f v a v h v a, ~b v a v ~h v c, ~a v ~g v ~e v f v ~j v ~g v ~i v h, ~a v ~f v i v ~h v j v ~e v g v j v g v c, ~a v ~d v ~h v ~d v e v ~j v h, a v f v ~e v ~j v ~d v a v ~f v ~f v i, a v f v ~a v ~f v a v b v ~i v ~e v ~b v ~g, b v ~f v ~a v f v ~d v ~g, d v ~h v ~g v ~e v f v d v ~h, d v ~g v ~g v ~j v b v ~c v a v ~e v b v i, d v ~a v h v ~e v d v ~j v ~g v e v ~b, d v a v e v d v i, d v i v ~j v f v b v ~c, e v ~b v ~i v ~e, e v ~a v ~j, e v ~a v ~h v h v j v a, e v i v ~e v f v ~g, f v ~i v ~j v ~b, f v ~i v i v ~g v ~g v d v h v ~a v ~i v a, f v ~f v g v ~f v c v d v i v ~f, f v ~b v i v h v f v h v h v a v ~b v ~a, f v f v ~e, g v ~d v ~f v d v ~g v ~d v ~f v h v a v j, h v b v ~b v ~h v ~i v ~d v a v b v ~h v ~d, i v ~i v i v e v ~a v a v b v ~e v ~e v j, i v ~h v ~i v e v ~i v i, i v b v h v a v e v d v ~f v b, j v ~b v i v f v ~a v ~b v ~d v e v ~f, j v h v ~j v b v a], 2000, count(211)).
tests(big_testcase10, validity, [~j v b v d, ~i v ~c v ~g v ~j v ~i v ~e v ~c, ~i v h v ~i v ~h v ~b, ~h v ~i v ~j v ~a v ~j v ~f v f, ~h v b v ~e, ~g v ~b v f v ~j v ~c v ~f v e v b v g, ~g v ~a v e v ~f v e, ~g v a v e v e v ~d v a v ~i v ~c, ~g v f v e v ~j, ~g v g v ~f v ~d v c v g v ~d, ~g v j v ~c v ~f, ~f v a v g v c v ~f v d v a v ~e, ~e v ~b v e v ~h v f, ~e v a v ~i v ~e v ~d v ~g v a, ~e v b v e v c v c v ~d v ~f v ~e v g, ~c v ~g v ~d v b v g, ~c v ~f v ~f v ~g v ~d v j v ~a v ~a, ~c v ~e v ~d, ~c v ~e v b v i v ~i v ~f v ~h, ~c v f v ~a, ~c v g v g v h, ~b v ~d v ~j, ~b v b v j v g v ~b v ~a, ~b v i v ~i v ~h, ~a v ~i v ~d v ~j v g v g v i v a v b v i, ~a v ~d v ~i v i v i v i v ~h v ~a v ~e v ~d, ~a v ~d v d v b v ~h v i, ~a v c v h v h v j v ~f, a v ~i v ~j v i, a v ~h v b, a v g v ~d v ~g v ~c v d, b v b v b v e v j, b v d v ~c v ~j v ~g v i v ~d v g v c v ~f, c v ~j v e v g, c v ~j v i v h, c v ~e v h v ~h v ~h v e v h, d v ~e v a, d v f v ~i v ~h v ~i v g v ~a, e v ~g v e v ~f v a v j v ~j v d, e v ~c v ~j v h v ~b v ~b v ~a, e v a v ~f v c v ~i v f v ~e v f v a, f v ~f v a, f v d v ~c, f v g v ~e v i v ~a v ~g v ~f v ~h, f v i v d v i v ~i v ~j v ~d v f v ~a v b, h v g v a v g v ~b v ~b, j v ~j v ~j v ~d v g v a v ~f v e v ~g, j v ~f v h v c v ~h v b v g v i, j v ~b v f v ~h v ~i, j v j v i v c v ~i v e v f v i v ~b], 2000, count(126)).
tests(big_testcase11, validity, [~j v h v ~a v ~d v i v j v h v ~a v j, ~i v ~b v b v f v i v ~f v e, ~h v ~c v c v ~h, ~h v e v ~a, ~g v d v ~c v ~a, ~g v j v c v i v j v j v ~g v c, ~e v ~j v ~f v ~a v ~a, ~e v e v j v e, ~e v g v ~f v ~j v i v ~d, ~c v ~h v ~j v a v ~h v i v ~h v ~g v ~e v c, ~c v ~e v g v ~c v ~d v ~j v ~g v ~h, ~c v ~d v j v g v ~d v ~d v c v a, ~c v ~a v ~a v ~f v c v j v f v f, ~c v h v f, ~b v ~j v d, ~b v ~d v ~d v ~c v j v ~i v f v ~c, ~b v c v f v ~f v ~h v h v ~c v g v ~i, ~b v j v b v e v g, ~a v ~j v ~e v g v j v b v ~a v ~d v ~j, a v ~i v g v ~i v ~d v ~c v a v ~j v c, a v ~b v ~i v ~d v f v ~d v ~j v h, a v c v i v ~f v c v i v ~f v ~f, b v ~i v ~i v j v ~b v ~f v g, b v ~f v ~c v ~b v ~b v ~c v ~d v a v ~i, b v a v ~c v g v e v a v j v g, c v ~d v ~c, c v c v ~a v ~i v i v ~e v i v ~d v ~i, c v f v ~c v f v ~c v ~d v b, c v h v ~g v b v ~b v b v g v ~h, d v ~h v ~e v b, d v ~g v f v ~c v i v ~d v ~j v c v a v j, d v ~c v ~c, d v a v b v ~g, e v ~i v a v g v b v g v ~d v f, e v ~e v ~e, f v ~c v ~c, f v c v i, g v ~h v ~g v ~e v g v ~h v f v a v ~h, g v ~h v f v i v j, g v ~e v g v ~a, h v j v ~d v ~i v b v ~c, i v ~h v e v ~c v ~b v ~d, i v a v f v a v f v ~b v ~f v ~i, i v a v i v f v h v ~i v ~b v ~f, i v b v d v a, j v ~h v ~c v ~i, j v ~e v ~e v ~c v ~e v ~g v ~c v c v ~f, j v ~e v e v ~f v ~d v ~f v j v ~d, j v ~b v ~e v ~c, j v g v h v ~g v ~f], 2000, count(193)).
tests(big_testcase12, validity, [~j v ~c v h, ~j v d v ~i v b v h, ~j v g v g v d v ~c v g v h v f v h v ~c, ~h v ~i v ~d v e, ~h v e v ~e v ~f v ~e v ~b v b v b v c, ~h v f v ~h v i, ~g v ~g v g v ~i v h v ~i v ~a v ~b v e v i, ~g v ~d v ~g v ~h v a v e v ~i v ~e v b, ~g v f v ~f v f v ~i v a v e v ~e, ~f v ~h v ~f v ~h v e v ~e v b v ~i, ~d v ~f v i v c v ~e v ~f v ~j v ~b v ~b v b, ~d v ~e v g v d v ~i v ~h v ~d v e v ~i v ~f, ~d v ~a v ~d v e v j v ~f, ~d v a v c v j v e v ~c v ~d v e v g v d, ~c v ~e v ~j, ~c v a v d v c v e v i v ~e v ~d, ~c v b v ~g, ~c v d v h v ~c v ~d, ~b v ~i v ~c v ~d v f v ~e v c, ~b v ~i v d v h v ~g v ~c v ~a v d v ~c v c, ~b v c v ~i v b v a, ~b v h v f, ~a v ~a v c v h v e v ~h v ~f v ~d v ~g, a v ~e v ~h v ~a, a v i v g v ~c v d v e v c v g, a v j v ~i v b v ~h v ~h, b v e v a v j v b v ~f v ~a v ~b v j v ~i, b v g v j v ~b v ~f v a v ~a v h v j, c v ~h v h v ~b v h v ~h v a v d, c v e v ~c v ~d, c v g v h v ~a v ~e v j v ~e, d v ~e v ~a v ~b v e v ~c v ~c v c, d v ~d v ~i v ~g v j, d v ~c v ~j v ~g v ~i v ~i v j v ~a, d v a v g v d v ~j v ~c v ~d, e v ~e v f v ~i, f v ~e v a v j v g v ~h v ~d v ~a, f v c v j, g v ~c v h v a, g v b v ~j v j, g v c v ~i v ~g v g v c, h v ~i v ~c v c, h v ~h v g v ~b, h v a v j v ~h v ~j, h v b v g v d v ~h, h v d v d v ~a v i v ~a v c v ~j, i v ~g v e v ~e v ~b v ~i, i v f v a v ~e, j v ~h v ~c v h v j v a v a v ~g, j v h v ~b v ~i v ~h v f], 2000, count(347)).
tests(big_testcase13, validity, [~j v ~f v ~a v ~h v g v ~i v ~c v f, ~j v ~a v ~g v ~e v c v ~e v ~i, ~j v i v j v c v ~e v ~e v j, ~j v j v ~i v f v i, ~j v j v h v h, ~i v ~j v ~h v a, ~i v ~d v a v ~e v e v ~d v i, ~i v ~b v d v i v ~c, ~i v b v ~h v c v j v j v f v ~i, ~i v c v ~h v ~c v ~g v ~b v f, ~h v h v ~i v ~f v ~b v ~h v ~a v ~c v ~i, ~g v ~h v ~e v ~g v c v b, ~f v e v ~a v ~f v ~a v ~i v h, ~e v ~c v ~g v i v d v c v ~i v ~g, ~e v f v f v ~f v ~a v ~i v h v a v ~a, ~e v f v h v a v ~i v j v g v ~b v c, ~c v d v d v ~i v ~f, ~b v ~i v j, ~b v ~a v c, ~b v b v f v c v i v ~j v d, ~b v g v ~g v ~i v c v ~e v h, ~b v i v j v ~a v f v ~a v c v j v ~c, ~b v j v c v j, ~b v j v i v f v ~c v ~c v ~d v b v g, ~a v ~f v ~e v ~a v e, ~a v ~a v ~f v j v ~a, a v e v c v ~b v d v c, b v ~c v e v c v ~c v ~e v ~b v a, c v h v ~i, c v i v ~i v ~e v ~i v i, c v j v j v i v ~h, d v ~j v g v h, d v ~g v b v a v h, d v ~b v a v ~h v ~f, e v ~f v ~b v b v ~b, e v ~c v ~b v b v d v ~j v i v ~c v g, e v d v b v i v j v ~g v ~e v ~h v c, e v e v ~d v d v h v ~g v g v ~i v i, f v ~b v ~j v g v ~j v i v ~e v ~i, g v ~j v c v ~c v f v f v c, g v ~a v ~g v i v d v c v ~a v a v ~j, g v c v ~c v ~f, g v d v d v ~b v ~d, g v f v d v e v g v c v a v ~c v ~f, h v ~e v ~c v d v e v a v ~c, h v ~e v j v h v h v ~i v j v ~h v ~f, h v ~c v h v j v i, h v d v i v b v ~i v g v c, j v ~i v i v f v ~i v a v ~j v i v j v ~f, j v ~c v c v ~a v ~g], 2000, count(346)).
tests(big_testcase14, validity, [~j v ~g v e v j, ~j v ~f v b v ~i v ~i v ~e v f v ~b, ~j v ~a v h v c, ~j v g v b v i, ~j v i v ~d v ~j v ~f, ~i v ~g v f v ~j v ~b v ~g v h v ~a, ~i v b v h v ~e v f v i v ~f, ~i v i v e, ~h v h v ~c v b v ~b v ~e v d v ~b v j, ~g v c v ~j v ~g v ~h v d v ~e v ~d, ~g v c v ~f v ~a v ~b v j, ~g v i v i v i v a v b, ~f v ~j v b v e v e v ~j v h v d v f, ~f v ~j v c, ~f v j v ~j v h v h v ~i v b v c v ~f v ~h, ~e v ~h v ~h v g v ~b v ~c v a v ~a, ~e v ~f v j v ~e v i, ~e v h v ~c v ~g v e v ~a v a v ~i, ~d v h v ~e v ~h v ~j v ~e v j, ~b v ~i v e v d v ~e v i v ~a v ~e v h v i, ~b v ~e v ~h v ~j v ~d, ~b v h v ~a v i v d v f, ~a v ~d v g v g v ~a v f, ~a v i v ~f v i v ~e, a v ~i v ~h v f v e v b v b v e, a v c v i v ~a v g v ~f v ~j v ~j v ~g, a v e v ~c v h v a v ~c, a v j v ~h v a v b v c v f v ~g v e v ~e, b v ~j v c v ~c, b v ~g v g v a v ~b v ~j v h v ~h v ~f v ~j, b v ~e v e v ~i, b v ~d v f v ~i v b v ~h v j v d v a, c v ~d v d v f, c v ~c v ~g v ~h v i, c v ~c v c v ~i v c v ~d v ~h v a, c v ~c v e v ~a v f v f, c v ~a v ~f v c v ~c v c v ~c v ~e, e v ~g v ~i v b v g v ~f v g v j v g v i, f v ~i v j v i v j v b, f v c v d v ~g v i, f v c v j v ~h v d, f v g v ~g v d v ~i v ~f, f v h v ~j v b v ~c v ~e v ~f v ~e v f v ~c, g v ~i v ~j v ~d, g v g v ~d v a, h v ~g v d, h v ~b v ~c v b v ~c v e, h v a v ~f, j v a v ~d v i v ~d v c, j v h v f v e v j v g v ~i v ~c v ~f v a], 2000, count(331)).
tests(big_testcase15, validity, [~j v ~j v c, ~j v i v ~b v ~f v ~h v ~e v d v ~j v ~a, ~i v j v i v ~g v ~e v ~f v j v g v f, ~h v ~i v d v i v ~f v h v i v ~g, ~h v e v ~c v a v i, ~g v ~d v ~d v g v f v j, ~g v f v c v ~j v g v g, ~f v d v a, ~f v f v f v ~h v ~h v ~d, ~f v h v a v ~g v ~a v f v ~g v ~i v g v j, ~e v ~c v g v c v d v ~f v b, ~e v ~a v ~i v ~e v ~i v ~j v d v a v d v e, ~e v ~a v ~e v e v f v ~h v g, ~d v ~b v ~h v d v j v h, ~d v ~a v ~c v ~h v ~c v ~b v ~h v ~b, ~d v a v ~e v ~a v g v ~e, ~d v i v f v h v ~b v e v ~e, ~c v ~f v ~a v i v i v f v e, ~c v ~e v i v c v g v b v b v d v ~g v ~e, ~b v ~e v g v j v ~j, ~b v ~e v j v ~d v ~f v d v e v ~h v ~h v ~i, ~b v b v d v b v b, ~b v f v i v d v ~h v d v ~a v h, a v ~c v ~e v ~h v a v j v g v ~g, a v ~c v ~d v ~d v h v ~a, a v d v h v c v f v ~e v ~j v ~e, b v ~e v b v e, b v ~d v ~h v d v a v ~f v ~b v ~j v f v e, b v d v g v ~g v h, c v ~c v ~i v h v ~d v ~h v f, c v ~b v g, d v ~j v ~d, d v e v a v ~f v ~b v ~e v d v j, d v h v i v ~d v h, d v j v e, e v c v ~j, f v ~h v ~j v g, f v j v e v j, g v ~e v ~c v j v ~d v ~f, g v ~b v ~c v i v b v b, g v b v d v i v j v d v b v c, i v ~h v ~g v d v c v ~h v ~c v ~g v ~a v ~c, i v ~c v f v g v ~c v ~a v ~d v g v ~d, i v ~b v h v ~b, i v e v ~c v h v f v ~c v ~d, i v f v f v ~f v h, j v e v ~g v ~j, j v f v g, j v g v c v ~e v c, j v i v ~j v ~e], 2000, count(280)).
tests(big_testcase16, validity, [~j v ~j v a v ~g v ~f v ~h v i v ~b, ~j v ~h v ~e v ~b v e v h v ~i v ~j v ~a v i, ~j v ~c v d, ~j v g v j v ~d v e v ~h v a v ~b v c v ~j, ~j v i v f v ~b v ~e v j, ~i v ~i v j v i v ~d v ~h v ~j, ~i v ~h v e v j v a v ~c v a v ~b, ~i v ~f v i v ~e, ~i v g v j v b v ~a v ~a v g v i v ~d v f, ~h v ~e v e v j v i v ~f v ~f v b v c, ~h v d v ~h v i v e v ~d, ~h v e v c v b v ~c v a v ~i, ~h v h v a v ~g v e v ~i, ~g v ~j v a v e v ~e v c v ~h v ~f v ~g v j, ~g v ~a v ~e v ~e v b v ~i v e, ~g v j v ~d v ~i v ~j v c v b v ~g v ~d v ~h, ~f v ~e v j v ~j v g, ~e v ~e v ~e v ~e, ~e v j v ~d v ~a v ~f v j v b v ~b v ~a, ~d v ~d v e v g v ~f v ~g v h v g v g v ~b, ~d v h v ~f v a v ~a v ~j v ~b, ~c v ~i v ~h, ~c v ~h v h, ~c v ~f v h v g, ~c v d v ~j, ~c v i v ~h v ~b v ~j, ~b v ~a v i v d v ~j v i v e v c v ~e, ~a v ~b v e v ~g v ~a v ~b v a v ~d v j v c, a v ~j v ~a v g v ~i, a v ~a v ~e v ~e v g v ~d v f v ~d, a v a v i v h v ~j v ~f, a v g v b v h v ~a v ~b v ~i v ~e v h, a v i v c v ~d v ~i v g v ~f, b v e v ~e v ~e v b v i v j, c v e v ~e v j v g v e v ~h v ~d v d v i, d v ~c v ~g v j v c v ~h v ~j v c, d v a v ~b v e v ~e, d v a v ~a v ~g v h v j v ~g, d v c v ~f, d v d v a, e v e v ~a v ~i v c, f v ~a v ~f, g v ~b v b v j v j, g v c v ~d v f v i, g v f v e v ~e v ~d v ~j v c v d v a v j, h v ~i v ~a v ~a, h v ~i v i v ~i v ~f v g, h v c v d v ~i v h v ~c v ~h v c v b, i v ~b v i v ~e, j v d v c v b v ~c v ~e v b v j], 2000, count(163)).
tests(big_testcase17, validity, [~j v ~g v ~i v ~i v g v e v e v ~a v ~f, ~j v ~e v ~f, ~j v ~e v ~f v ~h v h v ~g, ~j v ~b v c v ~g v c v ~g, ~j v f v ~g v ~j v f v g v c v c v a, ~i v ~i v e v c v f v b v c v ~g v ~j, ~i v b v ~i v j v ~d v ~d v ~d v ~c v ~a v ~d, ~i v g v ~b v ~g, ~i v h v j v i v ~h v ~a v ~b v j v ~h, ~h v c v c v b v ~a v f v ~a v ~d, ~h v h v ~h v j v ~f v ~f v ~d, ~f v b v e v ~c v a v ~c v ~i v c, ~f v c v c v ~i v h, ~f v f v i v j v ~g v ~a v ~e, ~f v g v ~c v j v ~h v b, ~f v i v ~j v ~g v ~f v ~j v ~h v g v ~f, ~f v i v a v c v b v g v e, ~e v c v ~e v g v j v i v ~i v e, ~d v ~g v j v ~f, ~d v a v ~b v f v ~c v ~d v b, ~c v ~h v j v g v c, ~c v ~e v c v f v ~g v ~i v ~j v ~g v ~g v g, ~c v b v h v e v j v ~f v ~e v c v h v ~g, ~b v ~h v d v h v a v g v j v ~i, ~b v ~f v g v j v g v ~a, ~a v ~h v ~a v ~h v ~c v ~c v d, ~a v ~g v ~d v ~e, ~a v ~b v e v ~a v c v ~i v ~h v d, a v f v ~f v j v ~f v j v ~g v ~e v ~e, c v ~g v f v ~f v c v e v ~j v ~e v ~i, c v ~a v ~j v g v ~j, c v d v j v ~a v ~d, c v j v ~h v i v e v j, d v h v h v ~f v ~f v ~a v ~h, d v i v ~d v c v j v ~b v c v ~f v d v ~b, e v ~i v d v i v c v b, e v ~b v h v d v i v e v j, e v ~a v b v j v c v f, e v a v ~g v ~h v ~j v g v h v f v d, e v b v ~f v g v j v h, f v ~h v j v g, f v ~f v i, g v ~f v j v a v g v ~j v ~e v ~i v b, g v ~c v c v ~h, h v ~c v ~b v f, h v b v ~g v ~f v j, h v b v e v ~g v d v ~f v ~a v b v ~g v f, h v g v ~d v ~g v ~c v h, i v ~h v ~g v ~f v g v ~f v ~j v ~c, i v ~e v b v ~e v h v ~f v g v i v ~c v f], 2000, count(386)).
tests(big_testcase18, validity, [~j v c v f v ~d v b v b v c v ~g, ~i v ~j v j v h v ~g v ~d v ~b v b v d, ~i v ~b v ~c v b v j v f, ~i v ~b v h v a v b v c, ~i v b v h v ~g v ~d, ~h v ~j v d v c v ~e v ~g v c v j v f v j, ~h v ~j v e v ~j v ~i v c v j v ~i, ~h v b v h v g v ~d v ~e, ~g v ~h v ~i v ~f v j v g v ~e v ~c v a, ~g v h v b v j v i v ~e, ~g v h v g v ~h, ~g v j v j, ~f v ~i v ~d v c, ~f v ~e v h v b v ~d v ~h, ~f v ~c v ~h v f v ~c v d, ~e v h v a, ~d v c v j v ~f v ~b v j v ~b v g v i, ~b v ~e v ~e v h v ~h v i v ~c v ~f v ~e, ~b v ~d v ~j v b v b v ~f v f v ~i v ~d, ~a v ~i v b v ~c v ~j v e v ~c v ~b v ~i, ~a v ~f v ~h v g v ~d v ~e v d, ~a v ~a v i v d v ~j, a v ~b v h v h v f v ~g v ~g v ~d, a v d v c v f v ~g v h v ~d v ~a, a v i v j v a v i v a v ~e v h v i, a v j v ~f v ~h v ~g v h v ~e v i, a v j v ~c v h v e v ~d v i v g v ~i, b v ~i v a v ~j v ~f v ~g v ~a v ~b, b v d v e v e, c v ~f v i, c v c v ~b v ~d v ~c, d v ~j v c v ~f v i v ~f v ~h v ~f, d v ~c v h v f, e v ~e v g v c v a v ~e v j v i v e v ~a, e v ~a v c v ~d v h v e v f v ~b v i v d, e v d v e v ~i v ~j v ~g v ~e v c, f v ~f v g v ~h v g v h v ~f v ~b v ~i, f v c v f v g, g v ~a v ~g v ~d v ~g v ~a v i v ~e v i v ~h, g v a v ~c v c v j v ~i v g, h v ~g v ~e v ~h v h v b v ~j v h, h v ~a v f v b v ~d v ~a v ~b v ~d v f, i v ~i v b v e v ~a, i v ~c v ~b v ~d v c v j, i v ~c v f v b v a v ~c v i v ~i, i v i v i, j v ~b v ~i v j v ~f v h v a, j v ~b v ~h v ~f v g, j v a v e v ~f v b v ~g v ~g v a, j v i v ~b v b v d v ~c v e], 2000, count(156)).
tests(big_testcase19, validity, [~j v ~j v c v b v j, ~j v ~i v ~h v c v f v c v j v ~a, ~j v ~h v ~d v ~j v a v ~f v ~d v ~e v j, ~j v ~b v j v ~i v ~d v ~f v a v ~c v b v ~c, ~j v b v g v h, ~j v f v ~b v ~b v j v c v ~b, ~i v b v h v a v ~g, ~i v h v ~j v c v a v b v f v ~h v ~e v ~i, ~f v ~j v ~g v ~i v ~d v ~g v ~e v ~e, ~f v a v ~e, ~e v ~e v g, ~e v ~e v g v ~i v ~d v b v e v ~c v ~e v c, ~e v e v f, ~d v ~g v ~f, ~c v ~f v ~e v e v j v b v ~i v j v f v a, ~c v i v ~i v d v h v ~e v ~h, ~b v ~h v c v i v ~a v ~b v ~i v e v a v ~a, ~b v ~d v i v ~e v ~g v ~e v ~a, ~b v ~b v a v d v a v ~d v ~c v j v f, ~b v d v j v h, ~b v f v b v h v ~f v f v ~g, ~a v ~h v c, ~a v ~c v i v ~a v ~h v ~i, ~a v ~a v i, ~a v g v j v ~i, a v a v h v ~a v c, b v ~j v ~h v c v ~g, b v ~e v h v ~e v ~e v f v i v ~g v f, b v ~a v ~f v i v c v ~b v f v ~f v ~b v f, b v d v ~g v ~d v i v a v d, b v f v g v f v ~a v ~j v ~e, c v ~i v j v ~g, c v ~f v j v ~e v i v d, c v ~e v d v a v b v e v h, c v ~c v e v e v ~d v ~a v g v a, e v ~b v ~b v ~j v ~i v ~g, e v h v i, f v ~j v ~f v ~i, f v ~d v ~i v h v d v ~a, f v ~d v ~b v e, f v ~b v i v ~e v ~d v d v ~e, f v ~a v ~h v i, f v ~a v c v ~e, f v f v a v f v ~a v a, g v ~c v h v c v j v ~a, g v c v b v ~j v c v ~j v ~e v h, h v ~f v ~g v g v ~j, h v e v ~g v ~c v h v c, i v ~c v ~e v ~b v c v g v ~h v e v ~d, i v b v b v ~g v ~h v ~h], 2000, count(171)).
tests(big_testcase20, validity, [~j v ~a v ~j v b v e v ~b v i, ~j v i v ~d v ~c v d v ~a v ~g v b v f, ~j v i v ~b v ~i v d v ~g v ~d, ~i v b v ~a v ~g v ~d v c v c, ~i v d v a, ~i v h v b v ~i v e, ~i v i v g, ~h v ~f v a, ~g v ~i v i v ~b, ~g v ~c v ~e v i v i, ~f v ~d v ~f v g v b v c v e v a, ~e v ~g v h v ~d v f v ~b v ~d v g v a, ~e v b v ~j, ~e v i v d, ~d v ~g v a, ~c v ~c v d v ~h v b, ~c v b v i v f v h v ~i v a v ~e v f, ~b v ~h v b v h v j v i v ~f, ~b v ~b v ~i v ~i v ~d v ~j, ~a v ~j v ~j v ~b, ~a v ~b v i v e v a v ~e v g v ~f v ~i, ~a v i v ~j v e v ~h v e v i, a v ~j v h v ~b v f, a v ~d v ~a v ~e v ~b v ~d v ~d, c v ~j v f, c v ~h v ~h v ~h v e v ~i v ~g v ~d, c v b v ~b, c v h v f v ~i v ~e, d v ~f v f v j v d v d v j, d v ~d v a v a v ~a v ~e v a v h v ~f v ~j, d v e v d v b v ~i v ~e v c v h v d v ~h, d v f v b v ~g v g v b, e v ~h v g, e v ~c v ~i v ~d v ~f v b v ~d v ~j v ~a v h, e v ~c v ~f v ~a v g v i, e v ~c v i, e v d v b v b, f v ~a v ~f v ~c v d v f v ~d v ~b, f v i v d v i v ~h, g v ~j v ~a v ~c v j, g v g v ~f v d v g v ~d, g v j v ~j v ~a v ~h, h v ~h v e v ~d, h v f v ~f v f v i v ~b v h v ~i v ~g v ~d, h v i v ~d v ~g v d v ~h v ~i v ~i v ~j, i v a v i v f v ~d v ~i, i v b v a v ~c v d v i v ~e v ~b, j v ~i v c, j v ~g v ~d v ~a v ~h v ~h v h v b v a, j v j v h v ~b v ~e v ~h v ~b], 2000, count(120)).
tests(big_testcase21, validity, [~j v a v ~i v d v ~e v ~e, ~j v a v ~b v i v j v h, ~i v j v ~e v ~f v d v ~a v ~h v b, ~h v ~g v ~f v f v j v ~c v ~c v ~c v e, ~h v a v a v g v ~g v ~f v ~g, ~h v a v e v ~g v ~d v ~f, ~h v j v ~j v j v ~j v i v ~i v ~b v a, ~g v g v a v ~g v c, ~f v d v ~i v ~f v ~c v b v ~e v d, ~f v f v c v j v ~i v ~a v g v i v ~d v ~g, ~f v i v a v g, ~e v ~d v ~g, ~e v j v i v ~g, ~d v ~g v ~e v ~c v g v f v e, ~d v ~g v a v j v c, ~d v ~e v ~e v ~a v ~i v e v ~j v i v f v c, ~d v ~b v a v ~d, ~d v i v ~f v h, ~b v ~j v ~e v f v c v ~i, ~a v ~g v g v ~d v j, ~a v ~f v ~h v ~c v ~i v f v e v ~e v e v d, ~a v ~b v d, ~a v ~a v ~a v i v ~b v c, ~a v d v h v d, ~a v g v ~j v ~b v ~a v ~f v ~b, a v ~e v b v ~a v i v j v ~g, a v b v a v d v ~c v d v ~e v ~c v ~h v d, a v g v e v g v ~e v g v g v g, b v ~b v ~h v j v e v f v ~e v b, b v a v ~d v ~b v ~g v h v f v ~g v e, b v g v e, b v h v e v ~e v ~f v i v ~f v h v ~c v ~b, b v j v a v d v c v f v f v ~j v b v b, c v b v j v ~b, c v c v a v ~c v ~i, d v ~e v ~d v b v ~b v ~d, d v ~d v j v j v ~a v c v ~b v ~d v d v ~i, d v ~a v ~h v ~j v d, d v j v ~i v ~b v ~e v ~b v c, e v ~f v ~a v ~h v ~j v j v ~h, e v ~a v h v ~i v ~b v i v e v ~i v c, f v ~b v ~c v ~a, f v b v d, f v g v g v j v a, g v ~e v ~j v e v a v d v ~b, g v ~d v ~h v ~h, h v b v ~f v ~i v ~e v ~d, i v ~f v i v ~b v ~i v ~f v i v f v ~g, i v ~e v ~d, j v b v ~a v b v ~b v ~f v a v i v ~g v ~j], 2000, count(165)).
tests(big_testcase22, validity, [~j v ~e v c, ~j v ~d v e v g v ~i v i v ~f v d v ~b, ~i v ~j v h v ~e v ~d v ~h v f, ~i v ~d v c v ~e v f v ~h v ~b v ~d v a, ~i v j v ~b, ~h v ~j v d v f, ~h v ~h v j v ~b v g, ~h v ~d v ~e v e v ~c v a v ~g v ~b, ~h v ~a v ~i, ~h v d v i v ~f, ~g v ~b v ~c v ~e v ~j v ~a v ~a, ~f v ~g v ~j v j v d v b, ~e v ~b v ~g v ~j v ~f, ~e v ~a v h, ~d v ~b v ~c v ~b v ~a v ~g, ~c v ~h v h v j v ~b v a v ~c, ~c v ~a v f v ~i, ~c v a v ~d v d v a v c v g v ~d, ~c v c v a v a v ~f v c v d v ~c v f v ~a, ~c v j v j v j v a v ~f v ~c v ~g v j v ~e, ~b v h v a v h v ~f v ~h v ~a v ~f, a v ~i v ~a v i v c v e, a v ~d v e v c v ~g, a v ~a v ~d v ~b, a v a v b v ~i v g v j v ~a v ~a v ~a, a v b v ~a v i v ~j, a v g v ~d v ~c v ~e v a v ~c v ~e v e v ~e, a v h v e v ~j v ~d v d v ~e v ~b, c v ~j v ~h v ~g v f v ~c v ~h v ~g v ~h, c v ~e v ~c v ~j, c v g v f v ~j v d v ~h v ~c v ~g v f v f, d v ~e v a v ~j v ~h, d v a v ~c v ~d v ~d, d v a v i v i v ~j v g v ~j v ~e v ~a v ~g, d v a v j v j v a v ~b, e v ~j v ~b v f, e v ~g v ~i v ~i v d v h, e v c v ~h, e v h v e v a v f v ~h v ~a v e v g, f v ~c v ~d v e v ~f v ~g v a v ~c v ~i, f v b v i v f v ~d, f v c v ~i v ~f v ~a v c v ~a, f v g v ~a v g v h, g v ~g v ~c v h v ~e v ~a v ~a, g v e v h v c v e v ~a v ~i v ~g v g, g v g v j v ~e v ~a v ~h v ~d, h v c v ~d v e v g v ~h v i, j v ~d v b, j v b v ~d v e v c v e v ~c v d, j v h v h v ~i v e v f v ~e], 2000, count(211)).
tests(big_testcase23, validity, [~j v ~f v ~g v ~a v h v ~j, ~i v ~h v j v a, ~i v ~b v ~a v h v ~d v ~d v i, ~i v d v ~g v c v ~b v ~j v ~f v ~f v d, ~i v d v i v ~d v c v ~f, ~h v ~j v a v ~f v g, ~g v ~i v c v ~h v ~i, ~g v ~g v c v ~d, ~f v h v ~j v f v ~f v h v ~i v ~f, ~e v ~c v b v ~c v g v ~a v ~e v ~e v ~d, ~e v c v g v ~f v ~i v c v ~a v ~f v i v ~d, ~e v f v ~j v ~a v ~j, ~e v h v ~i v ~e v i v f v ~c v ~e, ~d v ~i v ~g v ~a v i v i v a v ~b, ~d v ~i v ~f v ~g v g v h v a v c, ~c v ~c v ~j v b v g v d, ~c v g v ~a v ~f, ~c v i v ~j v d v b v ~b v ~a v ~j v d v g, ~b v ~h v ~f v j v a v ~e v a v c v h, ~b v g v h v ~d v ~i v g, ~a v i v ~g v ~e v b v c v ~h, a v ~h v ~f v a v d v ~d v ~g v ~h v ~d v ~h, a v ~h v ~b v ~g v b v ~j v a, a v ~h v d v ~e v ~g v b v ~b v ~b v e, b v i v ~j, b v i v ~h v ~a v i v i v b v a, c v ~j v g, c v ~e v ~b v ~f v ~f v c v e v g v h, c v b v ~b v f v h v b v ~d v ~g v ~j, c v f v ~a v h v ~j, c v h v ~a v ~j v e v ~g v ~f v j v b, d v ~j v f v ~a v a v d, d v ~j v i v f v ~a v ~h v ~d v g v b, d v b v c v g v i v ~b, e v ~d v g v i v b v ~b v ~e v g v ~d, e v ~b v g v ~j v i v g v e v j v ~g, e v j v ~i v ~f v g v d, f v ~c v ~f, g v ~a v b v ~e v ~d v ~e v ~a, g v c v i v g, g v e v ~d v b v a v f v ~j, h v ~e v b v ~d v ~b, h v j v a v ~c v ~j v ~j v ~j v ~e, i v ~g v i v j v ~f v i v ~f v ~f, i v ~b v ~f v a v ~a, i v g v c v e, j v a v h v f v ~b, j v b v ~a v ~a v ~h v ~f v a v ~c, j v b v d v h v a v c, j v d v f v h v c], 2000, count(290)).
tests(big_testcase24, validity, [~j v ~d v d v f v ~b v a, ~j v a v ~c v f, ~j v h v ~e v ~f v b v i v c v ~j, ~i v ~f v d v ~h, ~i v ~b v ~a v ~i v c v ~h v a v g v a, ~i v f v ~j v ~h v d v i, ~h v ~j v b v ~i v g v h v ~f v a, ~h v ~i v i v c v ~i v ~g, ~h v ~h v ~g, ~g v b v ~j v b v ~d, ~f v ~g v d v ~h v ~g v ~e v ~c v ~a v ~h v ~j, ~f v ~d v ~g, ~f v ~b v i v d v ~g v ~c v ~a v ~a, ~f v c v ~e v ~i v c v j v g v g v ~g v ~h, ~e v ~f v j v ~e v ~e v ~b, ~e v b v ~e v h v d v ~h, ~d v d v ~b v ~c v j v ~f v h v h v d v ~b, ~c v ~j v c v ~e v ~i v d v ~i v ~e v ~g v d, ~c v ~i v g v e v ~g v f v d v ~c v ~a, ~b v ~g v e v d v ~c v i v c v ~d v j, ~b v ~a v b v ~g v f v ~a, ~b v i v ~i v g v c, ~a v ~j v ~h v ~d, a v ~b v f v ~h v d, a v c v ~b v f v ~f v ~h, a v d v ~h v e v c v ~b v ~j v ~i, b v ~h v h v ~a v g v ~e v j v g v ~c, b v ~f v ~e v ~d v b, b v ~e v ~c v b v e v ~b v ~c v ~f v ~e, b v e v ~g v ~c v b v ~g v ~e v h, c v ~c v e, c v ~b v ~j v ~d v ~c v h v ~g v ~b v e, c v f v j v ~a, c v i v d v e v f v ~h, d v ~g v h, d v ~a v ~i v ~e v f v ~h v ~i v i v f v ~d, d v j v ~i v c v b v g v f v ~g, f v ~i v e v e, f v ~h v ~e v i, g v g v i v ~d v ~h v i v j v ~d, h v ~c v ~d v ~e v a v j v ~b v c, h v c v ~g v ~i v ~b v e v g, h v f v ~i v ~b, h v f v c v ~b v ~i, i v ~g v ~h v d v d v e v c v i v a v i, i v b v ~c v h v a v d v j v ~a, i v c v ~d v f, j v ~g v ~e v a v b v ~e v ~f v f, j v c v ~j v ~c v i v e v c v ~e v e v ~i, j v j v b v j v ~c v b], 2000, count(183)).
tests(big_testcase25, validity, [~j v c v j v b v ~a v ~j v d v ~a v j v j, ~j v d v ~c v ~h v ~e, ~j v e v ~a v ~e v d v c v g v ~e v ~f, ~i v ~f v ~b v f v i v e v i v ~g v h v h, ~i v e v d v h, ~i v h v j v a v ~b v ~j v d, ~h v ~d v f v ~a v i v ~a v ~c, ~h v i v a v ~i v f, ~g v ~g v e, ~g v ~c v i v ~i, ~f v i v ~f v ~f v d v ~h, ~e v ~c v ~f v ~e v ~h v a v ~b v ~j v ~c v j, ~e v a v ~d v ~j v a v a v h v ~g, ~c v ~e v ~e v i v c, ~c v ~b v b v ~d v ~f v i, ~c v b v b v a, ~c v b v g v ~b, ~c v f v ~e v e v ~e v g, ~b v ~g v ~g, ~b v ~c v h v i v ~h v ~f, ~b v ~b v ~g v a v e v e v ~g v h v ~a v ~i, ~b v c v i, ~a v b v e v i v a v a, ~a v h v ~c v d v a, b v ~f v b v a v a v a v i v a v ~h, b v h v a v ~g v ~g, c v ~i v b v ~j v g v i v b v ~h v b v ~b, c v ~i v c, c v ~i v h v ~f v h v ~a, c v ~g v i v ~a v ~a, c v a v ~h v ~b v ~h v j v ~b v ~a, c v i v i v a v a v a v ~e v h v ~f v j, c v j v ~d v b v ~f v b v ~f, d v ~e v ~a v e v ~a v ~i, d v g v c v ~f v e v ~h v ~i v d v d, e v ~e v c, f v ~g v i v b, g v ~c v ~c v h v b, g v c v ~d v c v i v c v ~j v ~g, h v ~j v j v ~b v ~d v j, h v h v ~f v ~h v e v d v b v ~d v ~i v b, i v ~h v ~b v ~c v a v h v ~a v b v ~e, i v ~d v ~b v j, i v ~a v ~h v h v d v c v ~f, i v d v ~f v c v ~c v ~i v ~i v b, i v e v h v d, i v e v h v i v a v b v f v d v b v j, j v a v ~f v g v ~i, j v a v a v ~e v c v ~e v e v i v ~i, j v b v ~a], 2000, count(120)).
tests(big_testcase26, validity, [~j v ~j v ~d v ~g v f v a v j v j v j, ~j v ~i v j v b v i v ~f v c v a v i v f, ~j v ~f v ~a v f, ~j v ~f v e v ~c, ~j v ~a v ~i v ~d v h, ~j v h v g v ~f v ~h v ~e v a v ~a v b v ~d, ~i v ~g v g v ~d v ~i v a v e v i v e v ~h, ~i v i v b v c v f v a v d v j, ~i v j v e v ~d v i v c, ~h v ~d v ~e v c v ~c v c v j v g v b v ~i, ~h v b v g v ~a v c v c, ~g v ~i v f v f v ~a v g, ~g v d v ~h v f v ~c, ~g v i v ~a v b v ~i v e v ~g v a, ~g v j v i v d v j v c v ~g v i v ~d v j, ~f v ~i v j v ~d v a v c v g v a v ~h v a, ~f v ~g v h v i, ~e v h v c v ~f v i v f v ~c, ~d v i v ~h v e v b v ~f v a v ~j, ~c v h v h v j v i v ~f v ~c v ~b v ~f, ~b v ~g v h v i v ~f, ~b v ~c v d v ~d v i, ~b v h v ~d v ~i v ~f v g, ~a v ~h v b v ~h v ~b v ~h v g v ~b, a v ~f v h v f, a v ~f v j v b v d v g v ~f, a v g v ~b v ~c v c v e, b v ~e v ~e v i v ~h v ~c v ~g, b v ~c v g v ~g v g v c, b v g v ~g, b v j v ~e v ~j, c v ~g v g v ~e v e v h, c v ~d v ~j v d v d v h v g v a v b, c v ~d v ~a v ~a v ~i v ~e v c, d v ~f v g v ~g v ~d v ~b v b v c, e v ~f v ~e v ~c v e v f v ~b v ~b v ~j v a, e v ~b v i v h v e, e v f v b v ~h v h v i v f v h, e v j v ~i, f v ~h v c, f v g v j, f v h v ~a v d v ~g v ~g v ~f, f v j v a v ~h, g v ~j v ~e v i v i v g v ~h, g v ~c v f v ~a v e v ~g v ~h v a v e v e, g v d v h v ~b v ~f v d v i v ~e v h v h, g v h v i, h v d v ~h v ~j v f v ~c v ~i v e, j v c v i v d v ~d v h v ~e, j v f v c v ~i v a v j v e v j], 2000, count(349)).
tests(big_testcase27, validity, [~j v ~f v g v ~h v h v ~j v h, ~j v ~e v ~g v b v ~d v ~h v d v a v ~b v ~f, ~j v a v ~f v ~j, ~i v ~c v j v a v ~g v j v j v e, ~i v a v ~h v ~a v a v b v ~h v a v a, ~h v ~i v ~g v d, ~h v ~i v f, ~h v i v h v h v ~f v c v ~d, ~g v ~c v ~b v ~d v d v ~h v j v ~e v ~b, ~g v b v e v i v ~c, ~f v ~i v c v b v a, ~f v b v ~j v ~d v a v ~b v c, ~f v i v ~a v ~b v d v ~c v e, ~e v ~g v b, ~e v e v f v ~a v a v ~e, ~e v h v ~i v ~g v c v ~f v j v ~i v ~d v ~b, ~d v ~g v i v g v g, ~d v ~d v ~a v d v ~c v ~a v ~e v j v ~d, ~d v c v d, ~d v d v ~h v ~j v ~h, ~d v e v ~f v ~j v i, ~d v g v f v ~h v e v ~i v e v ~e v j, ~c v ~h v ~i v g v f, ~c v c v ~i v ~h v e v f v e v e, ~b v ~e v ~c v i, ~b v b v ~a v f, ~b v j v ~h v f v ~d v a v a v c, ~a v d v b v ~c v ~f v ~c, a v ~i v f v a v e v ~e v ~d, a v d v d v b v b v h v d v ~d, a v e v ~i v i v a v g v i v ~c, b v ~c v ~g v ~d, b v i v a v i v ~g v h v ~j v ~j, c v ~b v ~e, c v ~a v ~h, c v h v i v ~a v f v g v ~e, d v ~f v ~d v ~d, e v ~j v d v ~e, e v d v ~h v f v ~j v ~h v d v i v ~g v ~d, f v ~i v ~d v ~j v c, g v ~i v ~h v h v ~j v ~h v ~j, g v h v ~a v h v ~b v ~g, h v b v c v a, h v h v c v ~c v e, i v ~e v ~f v d, i v f v ~h v j v ~h v ~a v ~d, j v ~i v ~i v g v g v ~h, j v ~g v g v g v ~e v i v b v c v ~e v e, j v ~c v ~f v ~a v ~a, j v d v ~a v ~f v a v ~i v f v ~f], 2000, count(269)).
tests(big_testcase28, validity, [~j v ~f v d v e, ~j v f v ~a, ~j v f v c v ~f v ~b, ~j v i v c, ~i v h v ~f v c, ~h v ~i v ~i v g, ~h v ~g v ~e v g v ~g v e, ~g v f v b v i v g, ~g v h v a v f v d v ~f v ~b v ~h v i v ~g, ~f v ~a v ~i v ~c v i v d v d, ~f v c v e v ~g v c v e v ~j v ~f, ~e v ~d v h v j v ~c v b v f v ~e v f, ~e v a v ~b v ~e v ~g, ~d v ~g v e v ~i v d v ~f v c v a v ~g v ~j, ~d v ~f v c v e, ~d v f v ~a v ~h v ~d v i v ~h v ~j, ~d v h v b v ~e v a, ~d v j v ~a v g, ~c v ~j v h v j v a v f v ~b, ~c v ~f v ~c v ~b v ~b v ~a, ~c v g v h v j v a v ~i v h, ~c v h v a v ~g v ~h v c, ~b v ~b v j v ~b, ~b v g v g v i v ~e v c v ~h v ~g, ~b v h v ~b v a v ~i, ~a v ~e v ~c v ~h v ~i v a, ~a v ~d v ~c, ~a v e v h v ~d v ~c v ~h v f v a v i v f, a v ~d v i v ~j v i v h v c v i, a v f v d, b v b v ~d, c v f v b v ~c, d v g v ~j v ~d v ~h, d v i v ~f v f v e v b v b, e v ~j v ~b v ~g v ~a v ~h v ~i v h v b, e v ~h v ~g, e v ~h v g, e v ~a v ~b v ~j v ~j v ~f v ~c v e v ~h v ~j, e v d v ~h v f v ~b v a v ~e v i v a v ~g, e v f v h v d v i v ~a, f v ~b v a, f v c v g v ~a v j, f v f v ~e v ~c v ~e v ~e v ~j, g v f v e v j v j v ~a v ~i v ~b v ~a v h, h v ~h v ~j v j, h v ~g v ~f v b v ~a v g v i v ~e v ~h v ~f, h v g v ~c v j v ~d, j v ~b v ~g v ~h v i v d, j v ~b v ~f v ~j, j v h v d v ~f v f v ~d v ~d v ~h], 2000, count(72)).
tests(big_testcase29, validity, [~j v ~j v ~a v ~e, ~j v ~g v i v g v j v ~i v f v ~b, ~j v c v ~i v h v ~h v g v ~i v c v ~h, ~j v i v ~b v f v ~e, ~i v e v ~h v ~g v i v ~f v ~c v d v j, ~h v e v e v ~j v ~b v h, ~g v ~i v ~e v ~j v ~f v ~i v ~c, ~g v f v ~b v i v f v e v ~b, ~g v g v b v ~h v i v ~f v f v ~f, ~g v j v e v ~c, ~f v e v i v c v ~d v ~e, ~f v j v b, ~e v ~i v i v e v ~j v b v ~d v f v ~a, ~e v a v ~c v b v ~a v ~b v ~j, ~e v j v ~d v ~b v e v j v a, ~d v ~g v ~i v i v b v ~f v ~e v ~c, ~b v ~h v i v c v ~d v b v a v ~d v d, ~b v ~d v ~i v i v ~a v i v ~b v ~f v f, ~b v ~c v ~i v ~a v ~c v j, ~b v ~a v j v ~c v ~e v ~g v g v ~c, ~b v b v ~d, ~b v h v ~d v a v j v e v ~c, ~a v ~h v ~c v j v ~c, ~a v ~b v ~b v e v ~f v d, a v ~f v i v h v h v b v ~h, a v ~d v ~d v ~g v c v ~h, a v ~d v h, a v e v b v ~b v ~h v ~d v a, b v ~a v j v ~e v ~j v e v ~b, b v a v ~f v e v j v ~f v ~g v h, b v b v ~b, c v ~b v b v j v g v ~b v c v ~b v g, d v ~a v j v h v f, d v g v ~j v g, e v ~i v h, e v ~c v ~h v ~d, e v f v j v e v h, g v ~j v ~i, g v f v e v ~g v b v c v ~b v a, g v j v j v h v ~j v e v ~i v ~g, h v ~j v h v ~h v ~b v f v ~e v ~d v ~a, h v ~b v b v h v ~f, i v ~g v j v b v ~a v ~j v f v ~c, i v g v h v ~b, i v i v i v c v a v ~j v f v ~j v a, i v j v b v ~f v ~h, j v ~j v ~i v f v ~j v g, j v e v ~g v ~g, j v h v ~g v ~i v ~i v ~a v ~h v e v d v ~a, j v j v ~e v ~d v ~d v a v e], 2000, count(221)).
tests(big_testcase30, validity, [~j v ~b v b v b v ~e v ~i v ~g v ~a v h, ~i v ~b v d v g v ~j v ~i, ~i v a v ~g v ~a, ~i v f v a v ~f v ~a v b v ~f v g, ~i v g v ~b v f v ~a, ~h v ~i v ~h v c v ~g, ~h v ~d v d v ~d v c v ~c v ~d v f v a v j, ~h v ~b v g v a v d v c v g v d, ~h v ~b v i v g v ~d, ~h v b v d v ~a v ~j v ~a v c v ~j v ~f v h, ~h v g v ~d v ~h, ~g v j v ~i v ~h, ~g v j v j v c v ~e v ~g v b v ~d v f, ~f v ~h v ~f v a v i v h v ~i v ~h v b v a, ~f v ~c v ~b, ~e v i v f v ~e v e v ~e v c v ~e v ~c v ~i, ~d v ~f v ~i v ~e v ~e v ~e v a, ~d v d v ~a v f v e v ~d v ~f v ~d v ~b v ~d, ~c v ~f v ~b v d v i v ~g, ~c v ~d v f, ~c v f v b v ~i v c v ~g v a v a v ~e v i, ~b v ~d v f v f v ~j v ~b v c v ~g v f, ~a v ~i v ~b v ~c v c v ~j v b v f, ~a v ~c v ~b v h, a v e v ~h v j, a v e v ~b v c v ~a v f, b v ~h v ~j, b v f v a, b v h v c v ~e, c v ~j v j v e v ~h v a v ~g v ~j, c v ~d v ~c v h v j v f, d v ~e v ~d v ~a v ~a, d v b v h v ~i v ~h v c v c v a v b v ~g, d v g v d v ~h v h v ~a v ~g v a v g, e v ~j v ~b v c v b v h v ~h v j, f v ~b v g v ~d v ~i v ~c v c v ~e v ~g v g, f v g v c v ~f, f v i v j v g v i v c v e v f v ~g v c, g v ~h v ~a v a v a v d v ~g v e v ~a, g v ~b v ~b v ~e, g v ~a v ~d v ~i v ~e v ~j, g v d v ~i v ~j v ~c v ~c v ~d, h v ~j v a v ~a v e, h v b v ~d v ~e v b v f v e v ~d, h v i v ~c v e v ~c v a v i v b v ~f v ~j, i v ~a v d v ~b, i v g v ~d v ~i v ~c, j v ~d v ~d v g, j v ~d v d, j v a v j], 2000, count(184)).
tests(big_testcase31, validity, [~j v ~g v ~g v ~h v j v ~a, ~j v ~c v ~g v ~e v ~a v ~e, ~i v a v h v ~f v f v ~c v g v b v ~d, ~i v c v ~a v c, ~h v ~j v ~b v ~e v h v e v g v ~h v b v ~a, ~h v ~c v c v e v e, ~g v ~g v ~d v j, ~g v h v ~b v b v ~j v ~a v ~f, ~g v h v j v f v ~e v ~f v ~h v ~g v b v ~f, ~g v i v ~c v ~a v i v g, ~g v j v ~c v d v h, ~f v c v ~j v ~f v ~j v g v ~a, ~f v d v ~b v ~e v i v i, ~f v h v j v g v a v e v ~f v j v b, ~e v ~g v c v ~h v h, ~e v a v ~f v i, ~e v d v ~a, ~e v j v j v e v ~e, ~c v ~h v ~i v i v g v d v ~h, ~b v ~j v a v ~h v ~j v ~d v ~g v c, ~b v ~c v ~j v ~b, ~b v ~c v g v h v b, ~b v ~c v i v i, ~b v ~a v ~h v ~e v ~h v ~j v ~e, ~b v a v d v ~d v ~i v ~j v d v ~c v ~b, ~b v b v ~g v ~f v d v ~j v ~i v a v ~i v ~f, ~b v f v e v j, ~b v i v f v e v f v j, ~b v j v ~a v ~f v j v b v ~f, ~a v a v ~b v a, ~a v b v i v ~j v ~h v d, ~a v d v ~c v c v ~e v ~a v c v ~d v j, ~a v f v b v i v d v ~b v e, a v ~h v e v ~j, b v ~c v ~i v b v j v ~a v ~f v i, c v ~b v ~h v ~d v ~a v ~h v i, d v ~e v ~i v g v g, d v c v ~f, e v ~j v j v e v a v ~f, e v ~d v ~j v h v h v g v e v ~g v ~a v ~f, e v h v ~j v ~j v e v ~f v e v ~f v ~g v ~j, f v ~a v c v ~f, f v e v e v g v ~j v i v a v d v ~i v ~e, g v ~j v ~a v e v ~f v i v ~j v g v ~j, g v ~j v j v g v ~j v ~j v ~b, g v d v ~b v ~c v ~h v ~a v ~e, h v ~g v b v ~e v ~h v ~e v h v ~b v ~i, i v ~g v g v c v ~h v e v j, j v ~f v ~c v i v i v ~i v ~d v f v g, j v g v j v j v h v a v ~e v ~i], 2000, count(260)).
tests(big_testcase32, validity, [~j v ~d v e, ~j v ~b v ~j v h v g v c v ~j v a, ~j v i v h v h v ~i v ~f v g v ~f v f, ~i v ~c v ~i v ~j, ~i v e v ~g v ~j, ~i v f v d v i v i v g, ~i v g v ~e v ~g v b v ~f, ~i v j v i v ~a v ~e v ~j v ~j v g v ~h, ~h v ~c v ~i v e v e, ~g v ~f v ~a, ~f v f v ~b, ~e v c v j v ~h v ~i, ~e v d v a v ~f v a v ~h v ~e v ~j v a, ~e v h v ~h v d v ~g v ~i v c v ~c v ~f v ~f, ~d v ~d v ~i v ~d v b v ~c v ~b, ~d v ~a v ~h v ~e v ~f, ~c v d v b v d v d, ~c v e v ~f v e, ~c v h v ~h v c v g v ~h v h, ~b v ~f v j v ~a v ~d, ~b v a v h v ~i v ~a v ~d, ~b v b v a, ~b v f v d v c v ~c v ~g v g v c v g v g, ~a v ~b v ~c v i v b, ~a v ~b v c v ~f v ~j v ~g, ~a v h v ~c v ~i v j v h v ~j v ~j, a v ~e v ~b v ~b v d v i v j v j v ~e, a v ~e v a v ~h v b v ~j v ~d v e v f v d, a v f v d v ~c v ~d v ~h v ~j v ~f v j v ~j, b v ~i v h v ~f v g v f v h, b v ~g v ~d v ~g v g v c v ~b v a v h v ~i, b v f v e, c v b v ~e v ~i, c v e v ~g, c v i v ~c v a v ~h v d v ~e v ~b v ~c v e, c v j v d v g, d v ~b v j v ~c v ~f v ~f, d v ~a v b v ~e v ~f, e v ~b v e v f, e v c v ~j v h, e v d v j v j v ~a v b v ~a, e v f v ~b v ~a v g, e v f v c v g v ~c v e v a v i, e v i v a v j v f v ~c v ~a v c v ~d v b, f v c v j v ~g v ~g v d v j v ~e, f v i v ~g v e v i v ~d, h v ~g v a v f v i v j v d, i v ~g v j v ~b v ~d v d v g v e, i v j v b v ~d, j v ~a v j], 2000, count(160)).
tests(big_testcase33, validity, [~j v ~f v d, ~i v ~h v j v ~i v i, ~i v ~g v ~c, ~i v c v ~b v ~h v ~j v ~d v e v h v ~e, ~i v j v ~j v j, ~h v ~j v i v j, ~h v ~g v ~d v ~f, ~h v ~e v ~g v ~j v ~j v d v h v h v a, ~h v e v i, ~h v h v b v f v i, ~g v ~e v i v ~a v ~a v ~c v i v ~d, ~g v d v a v ~e v ~e v b v b, ~g v f v ~e v g v ~f v b v ~g, ~f v ~d v ~i v ~c v ~j v ~i v ~j v j, ~f v j v ~d v ~f v ~e, ~e v ~h v j v ~e v d, ~e v ~d v ~i v ~e v ~a v ~b v i v ~i, ~e v ~c v j v ~g, ~e v ~b v ~c v ~h v ~j v b v ~h v g v d v ~e, ~d v ~g v ~a v ~c v ~a v a v ~e v d v ~h, ~d v ~c v i v ~e v ~h v d, ~d v b v a v ~i v b v ~b v ~h v ~f v j, ~d v f v d v g v ~e v e v c v ~d v ~i v j, ~b v ~b v ~h, ~a v ~e v ~c v ~h v h v ~c v d v ~j v ~f v g, ~a v f v ~i v ~f v ~f, a v ~c v ~a v ~a, a v d v ~e v g v b v j, c v ~a v b v ~j v ~j v b v ~j v f v ~e, c v b v e v ~a v ~h v ~f v g v d v a, c v g v ~b v ~a v ~a v ~b v c, d v ~j v b v ~i v a v e v c v ~j v h v ~a, d v ~c v e v a v f v h v g, d v f v b v c v h v ~j v e v ~c v ~j, e v ~b v ~c v ~d v d v h v ~c v d v ~f, e v f v b v ~d v ~i v ~f v h v ~d, e v g v ~d v d v ~b, e v g v j v ~j v a v d, f v ~f v ~h v ~a, f v ~b v a v ~f v d v a v ~g v ~b, f v a v ~h v ~b, g v i v ~h v ~d v j v ~d v ~h, g v j v ~h, h v ~h v e v e v ~i v d, h v ~f v ~h v f v d v ~i v f v ~f v d, h v c v g v ~j v ~d v j, h v i v ~d v b v ~b, i v ~i v ~a v ~i v ~f v d v d v ~e v i, j v ~c v ~i v ~a v ~i v h v ~g, j v ~b v ~h v e v h v j v f v a], 2000, count(341)).
tests(big_testcase34, validity, [~j v ~j v h v ~h v ~i v b, ~j v ~b v ~a v ~e v i v j v ~c v b v j v h, ~i v ~h v g v b v ~h v a v c v g, ~h v c v ~i, ~h v c v d v b v a v ~f v j, ~g v ~j v ~j v g v ~c v a v ~e v ~e, ~g v ~j v ~i v ~i, ~g v ~j v ~a v c, ~g v ~f v ~a v ~h v e v b, ~g v e v ~f, ~f v ~c v d v h v d, ~f v c v ~a v i v f, ~f v j v g v ~i v i v ~f v i v d, ~e v ~f v c v c v a v a v c v ~d v a v f, ~e v ~e v j v ~d v ~j v ~a v ~f v ~i v ~f v ~c, ~e v c v g v ~i v ~a v ~g v ~g v ~d, ~e v h v f v i v ~f, ~e v i v ~e v a v ~d v e v a, ~d v ~g v h, ~d v ~c v ~e v ~c, ~d v c v c v ~f v ~g v ~d, ~d v i v ~g v ~f v ~i v i v f v i v e v ~b, ~c v a v ~f v ~f v ~c v i v a v ~b v a v ~e, ~b v ~d v ~b v a v j v e v ~b v h, ~b v h v d v e v ~h v ~h v ~e v h v j, ~a v e v a v e, a v ~j v h v ~j, b v ~h v a, b v ~e v ~i v ~g v c, b v ~d v b, c v ~f v ~a v h v ~f, d v ~j v ~a v ~i, d v ~e v a v ~c v ~i v c, e v ~j v ~j v ~a v ~a v ~e v f v ~i, e v ~i v j v ~d v ~c v i v ~d v h v ~c, e v b v ~d v ~c v f, f v ~f v ~d v ~a v ~f v ~i v ~f v c, f v ~f v c v b v ~f, g v ~c v ~d v c v ~j v ~e, g v c v c v ~h v ~d v ~e v ~h v ~g v d, g v h v ~c, g v i v a v b, h v ~i v g v i v ~f v c v i v ~e v ~i v h, h v ~g v j v h v f v a v ~d v j v ~j v d, i v ~a v ~j v f v h v ~d, i v g v ~e v d v ~a v ~f v ~d v b, j v ~j v ~j v i v ~c v g v c v ~i v ~g, j v ~j v ~a v c v ~g v i v ~i v b, j v ~b v f v f v ~c v g v ~i, j v g v e v ~a v b v ~b v h v ~g v ~b v ~a], 2000, count(208)).
tests(big_testcase35, validity, [~j v ~h v h v j v ~e v c v h v f v ~e v ~b, ~i v ~h v a v a v a v g v ~c, ~h v ~b v j v ~g v f v ~h v i, ~h v e v ~g, ~h v j v ~i v ~b v ~e v ~a v d v f, ~h v j v h v j v h, ~g v ~h v ~j v ~h v j, ~g v b v d v ~a v a v f, ~g v f v ~b v b v b v ~i v ~c v ~f, ~g v g v c v ~j v b v ~i v b v ~g v ~f, ~f v c v g v ~b v c v g v e v ~d, ~e v ~g v d v ~c v ~c v c v ~d v ~i, ~e v ~a v ~e, ~e v d v ~d v j v g v ~c v ~d, ~d v ~j v h v ~c v ~h v a v f, ~d v ~b v i v ~g v ~a v h v ~i, ~d v e v ~f v ~d v j, ~d v e v ~e v ~e, ~d v h v ~h v c, ~b v ~f v ~j v ~h v j v f, ~a v ~j v ~d, ~a v ~j v d v d v ~d v ~c v ~c v ~e v e v j, ~a v ~d v ~h v f v ~a, a v ~e v ~e v i v ~c v c v ~f v h v ~h, a v ~a v ~h v c v b v ~i v c v f v e v g, a v f v ~d, a v h v a v e v j v ~f v i, b v ~f v ~a v c v ~f, c v ~b v ~b, e v ~g v c, e v c v b v ~g v ~j v e v ~a v c, e v e v f v h, e v g v ~d v ~b v ~j, e v i v d v ~a v ~b, f v ~i v ~a v ~j v g v e v ~a v ~c v ~d v c, f v d v e v ~b v d, g v ~f v g v ~c v ~j, g v j v ~h v a v c v ~h v b v h v ~i, h v ~j v a, h v ~h v ~c v ~j, h v ~f v ~f v e v f v j v h v ~f v ~a v d, h v e v d v ~c v h v f v j, i v ~c v ~a v a v d v i v i v g v ~h, i v ~b v g v h v ~g v ~b v ~h v ~b, i v h v g v f v h v b v ~j v e v f, j v ~c v ~g, j v ~c v ~b v ~b v i, j v c v e v ~f v ~b v b v c v g v ~b, j v e v b v c v ~a v ~d v ~a, j v f v b v e v ~i v ~g v h v ~b], 2000, count(95)).
tests(big_testcase36, validity, [~j v ~a v ~d v ~g v g v i v f v e v a, ~j v ~a v ~b v ~j v ~e v e v ~b v ~c v ~c, ~j v b v a v ~f v d v ~a v ~j v ~h, ~j v g v a v b v ~h v d, ~i v ~e v f v ~a v i v ~j v ~a v ~c v d, ~i v ~e v g v ~g v h, ~h v ~h v ~a, ~h v d v ~i, ~g v ~c v g, ~f v ~i v ~b v ~h v e v ~a v f v h, ~f v a v ~g v ~j v ~c, ~e v ~g v ~d v ~h v b v g v c, ~e v g v ~d v f v j, ~d v ~j v h v ~f v ~c v ~g v e v ~h v ~b v j, ~d v ~h v b v j v ~i v ~j v ~g v ~i v ~g, ~d v ~f v j, ~d v ~c v ~f, ~d v a v ~d v ~e v ~c v h v ~c v ~e v ~h, ~d v a v ~c v ~d v g v ~c v ~h v d v f v j, ~d v a v g v ~a v f v ~i v ~b v g v g, ~d v f v ~d, ~c v ~d v b v d v ~a v e v ~a, ~a v ~f v j v ~d v ~a v ~g, ~a v c v j v h v h v ~b v ~b v ~c, a v ~b v ~f v ~e v a v ~a v g v ~c, a v ~a v ~j v g v d v g v j v j v i v ~g, b v ~i v ~d v ~g, b v ~h v j v h v c v ~c, b v ~a v h v e v h v d v h, b v d v ~c v h v ~a v ~d v ~d v ~b, b v e v ~j v ~b v ~b v c, b v j v h v ~e v f v h, c v ~e v a v c v g v e v j, c v a v c v a v j v ~c v ~e, d v ~i v ~c v g v j v ~i v d, d v ~b v a v ~h v f v ~h v ~c v ~d v h v ~g, e v ~g v g, e v ~d v ~h v f, e v b v ~c v g v d, f v a v ~f v ~d v ~d v c v ~b v ~d v ~b, g v ~d v ~e v b v a v ~c v a, g v ~a v j v ~a v ~c v a v ~g v b, g v b v ~g v i, h v ~f v ~j v c, h v ~e v j v f v ~h v ~g v ~d v ~g v b, h v ~a v b v c, i v ~d v c v f, i v ~a v i, i v e v a v d, j v a v ~f v i v ~i], 2000, count(130)).
tests(big_testcase37, validity, [~j v ~i v a v ~j v h v ~g v g v h, ~j v ~d v a v b v ~c v e v c, ~j v a v f v i v j v c v ~e, ~j v g v a v ~h v b, ~i v j v ~b v ~c, ~h v ~i v ~b v ~j v ~c, ~h v ~e v h, ~h v ~c v c v ~e v f v ~c v h, ~h v ~b v ~e v ~j v ~i v ~i v ~i v ~c v d, ~g v ~i v ~b v ~e v a, ~f v ~j v ~g v ~g v ~g v ~a v ~i v d, ~f v ~j v ~e v h, ~f v ~g v ~g v i v ~d v c v e v ~e v ~b, ~f v b v a v ~g v i v ~j v d, ~e v b v ~a, ~e v e v i v c v ~b v ~a v b, ~d v ~h v h v ~j v a v ~b, ~c v ~f v h v ~a v ~g v j v ~g, ~c v ~a v ~b, ~c v ~a v d v ~g, ~b v ~i v ~f, ~b v ~i v f v ~b, ~b v ~d v ~a v d v ~e v ~h, ~b v ~c v g v a v ~e v ~f v ~g v ~j v g v c, ~b v ~a v i v ~a v f v f v ~a v c v h v ~i, ~a v ~g v e v c v ~h v d v i v a, ~a v g v ~a v g v a v ~b v ~b v ~g v j, ~a v g v j v ~g v a v e v ~h v ~j v e v e, ~a v h v e v f v ~f v a, a v ~c v e v ~b v ~h v ~e v i v ~j v i v i, a v ~a v ~j v b, b v ~d v b, b v b v ~c v f v a v ~h v i v b, c v ~e v ~b v j v b v ~a v h v b v ~i, c v g v ~b, d v ~h v f v d v i v g, d v ~d v i, d v c v i v ~a v a v j v i v e v ~b, d v e v ~j v j v ~h v d v ~d, e v ~i v f v ~b v c v ~c v h v d, e v ~c v ~g, e v ~b v ~h v j v ~i v ~h v d v ~e v e v ~g, g v ~j v ~j v e v ~e v ~h v a v ~a v b v ~i, g v ~e v b v h v e v b v ~j v ~b v ~h, g v h v h, h v ~j v j v ~b v i v f v ~g v ~d, i v ~i v ~e, i v ~c v i, j v ~g v ~d v ~i v ~e v ~f v e v ~e, j v ~f v ~a v ~i v g], 2000, count(126)).
tests(big_testcase38, validity, [~j v a v ~e v ~b v ~j, ~i v ~j v i v a v c v ~d v e v ~c v ~i, ~i v a v ~a v ~e v ~a v ~g v j v ~i v d v a, ~i v b v ~f v b v ~g v d v ~a v j, ~h v ~c v ~a v a v f v f v b v g v a v j, ~h v ~a v a v ~f v ~c v ~c v ~c v ~g v ~a, ~h v h v i v ~e v a v ~h v g v ~d, ~g v ~h v i v h v ~a, ~f v ~c v d v f v d v b v ~a, ~f v f v f v ~h, ~f v h v b v a v ~e v ~b v c v e v a v g, ~e v ~g v ~f v e v g v ~g v ~e v ~h, ~e v a v h v g v b v ~g, ~e v d v c v g v ~e v g v a v i, ~e v g v j v i v g v i, ~d v ~j v c v ~b v b v e v ~j v i, ~d v ~e v ~b v g v a v ~g v ~h v b v a v j, ~d v ~d v ~c v ~d, ~d v ~c v ~g, ~d v i v ~c v g v ~f v ~b v a v ~b v ~e, ~d v j v e v ~g, ~c v ~j v ~b v ~b v j, ~c v ~j v c, ~c v ~c v ~a v c v ~g v f v ~b v ~h v f v e, ~c v j v a v ~a v ~f v ~f, ~a v ~d v ~d v g, b v ~i v j v ~b, b v ~g v ~b v e, b v ~g v i v ~i, c v ~i v c v f v ~f v ~f v b v h v ~d, c v ~c v a v a v g, c v f v h v a v h v ~e v c v a v ~b v g, c v g v i v h v g v ~i v ~c v ~c v i v ~f, d v ~c v ~f, d v ~b v c, d v ~a v e v h, d v b v ~i, d v c v h v ~d v a v ~i v ~e, d v i v e v ~g, e v ~f v f v ~c v ~i v j v ~d v f v ~a v g, e v ~c v ~j, e v b v ~e, e v h v j v ~b v ~g v ~e v d v ~b, f v ~e v g v ~j v ~i v ~i, f v ~b v ~c v e v ~a v b v ~h, g v ~j v ~i v g v ~f, g v ~a v ~a v ~d, g v j v ~h, i v ~f v b, i v d v ~g v j v ~a v ~j v ~d], 2000, count(146)).
tests(big_testcase39, validity, [~j v g v ~i, ~j v j v e v ~g v e v a v h v ~f v h v ~h, ~i v a v a v ~d v i v ~h v ~f v ~j, ~h v ~i v ~g v c v ~d v b v e, ~h v f v ~j v ~g v f v a v i v ~h v ~i v ~f, ~g v ~i v ~e v i v ~f v j v ~h, ~g v ~i v ~a v a v ~g v b v d v f v g, ~g v ~h v h v ~d v h v e v a, ~f v ~f v g v j v a v i v c v b v ~c v ~a, ~f v a v a v ~a v ~e v d v e v g v f v ~g, ~f v c v ~a v e v c v ~j v ~g v d, ~f v h v e v ~a v ~d, ~e v a v ~i v ~a v e v ~j v ~c v ~c, ~e v f v ~i v e v ~e v ~f v e v ~i v b v a, ~e v h v ~j, ~d v ~g v ~a v d v i v g v ~d, ~d v ~a v e, ~d v i v ~b, ~c v ~i v ~f v ~c v g v ~b, ~c v ~h v f v d v ~i v j v j v ~e, ~b v b v h v b v c v f, ~a v ~c v ~e v c v c, ~a v c v ~e v h v e v ~i v ~c, ~a v e v ~h v j v a v b v b v ~d v f, a v f v ~f v ~a, b v ~b v ~j v ~a v j v i, b v ~b v d v g, b v i v d v b v ~f, c v ~f v c v g v ~h, c v ~d v c v g v b v i v a v ~a v h v ~i, c v e v c v d v ~h v f v ~g, d v ~d v a v ~a v d, d v ~c v ~h v ~c v j v ~j v c, d v ~b v f v ~i v c v f v ~g v ~h v ~a v ~i, d v ~a v c v d v ~f v g v ~i v ~i, e v ~h v i, f v ~g v ~j v ~j v ~a v ~a v a v ~h v i v ~i, f v ~d v ~e v ~b v b v d v j v ~g v ~h, f v d v ~c v i v d v f v ~d v ~a, g v d v d v ~g v ~b v ~c v ~f v c, h v ~i v h v ~f v ~b, h v ~e v ~j v j v ~f v ~b v h v ~g v ~g, h v e v h v h v i v f v ~d v b v h v ~f, h v f v ~e v d v ~h, i v ~h v h v d v ~f v d v a v ~d v f, i v h v e v ~d v c v ~a v ~f, j v ~f v ~d v ~j v a v b v i v e v ~a v d, j v ~f v ~c v b v ~h v f v b, j v a v j, j v f v i v ~d v f v c], 2000, count(243)).
tests(big_testcase40, validity, [~j v ~a v ~b v c v b v ~d v a v ~g v ~i, ~j v e v i v ~b v e, ~j v g v c v ~i v h v f v f v ~b v ~a v ~g, ~i v f v ~b v b v ~c v g v ~b, ~h v ~c v e v a, ~h v b v i v h v e v h v ~f, ~g v f v ~b v ~b v i v ~c v ~d, ~g v h v ~a v d v ~j v ~g, ~f v ~g v b, ~f v ~d v ~f v j v a, ~f v i v f v ~a v ~f, ~e v ~i v h v b v a v ~h v ~a v ~f, ~e v ~d v j v ~b v b v ~a v ~e, ~d v ~i v ~c v b v i v f v ~b, ~d v ~b v b v ~h v e v ~b v f, ~d v e v ~f v c v ~c, ~c v ~i v ~b v e v ~h v ~d v ~g v e v g, ~c v i v ~h v d v ~i, ~b v ~c v ~h v ~j v ~c v g v i v ~h, ~b v g v ~b v ~g v ~c v ~a v ~g v a v f v d, ~b v i v d v ~f v c v ~g v i, ~a v ~h v c v ~j v ~i v ~b v a, ~a v e v ~e, a v ~g v ~a v ~a v ~d v j v ~g v i v h, a v e v h v ~j v ~h v ~a, b v ~b v ~h v ~g v c, b v ~a v g v e v d v ~d v ~i v i v b v f, b v g v ~i v ~i v ~e v c v ~b v ~i v ~c, c v ~d v ~g v e, c v f v ~i v d v ~h v ~d v g v a v ~a v ~e, c v f v ~a v c v j v a v ~g v i v i, d v ~h v i v ~d v ~d v ~c v f v ~d v ~d, d v ~g v ~g v ~h v h, d v ~f v g v f v e v f, d v b v d v ~h v ~c, d v c v ~d v ~d v c v j v ~j v d v ~g, d v h v ~i, e v ~j v h v i v ~f v ~d v j v ~i, e v ~c v ~d v e v ~d v ~a, e v g v ~h v a v f v b, g v ~j v a v ~c v a v ~i v g v i v ~i, g v ~c v ~i v d v f v h v a, g v a v i v g v ~g v ~e v g v ~i, g v i v c v j, h v ~j v ~j v i v ~i v b v c v ~h v c, h v ~a v ~j v g v ~e v h v ~i, i v ~d v ~g v d, j v a v ~a v d v ~c, j v h v i v ~e v i v g v ~j v ~b v a, j v h v j], 2000, count(319)).
tests(big_testcase41, validity, [~j v a v ~d v ~h v f v j, ~i v ~h v ~h v ~b v h v ~d v g v ~d v h, ~i v ~b v c v ~c v d v j v f, ~i v a v ~d, ~i v e v ~i v ~e v ~f, ~h v ~h v e v ~g v f v g v ~f v e v f, ~h v ~g v ~g v ~d v e v d v f v g v ~h, ~h v ~d v f, ~h v ~b v e v c v j v h v b v ~h, ~h v a v g v ~f v j v ~g, ~h v f v b, ~g v ~h v a, ~g v h v c v ~e v ~c v c v b, ~f v ~g v ~d v j v ~e v ~c v ~b, ~d v ~j v ~i v ~g v g v f v ~c v b v e v b, ~d v ~b v ~d v a, ~d v b v ~f v ~g v ~a v i v ~e, ~d v f v ~f v j v ~h v a, ~c v ~e v ~f v h v ~c v f v ~h, ~c v a v f, ~a v ~g v b v ~c, a v ~i v ~g v ~h v i v ~b v ~b v ~d v j, a v ~g v g v ~b v ~d v h v j v i v b v ~i, a v ~f v ~g v ~b, a v d v ~a v ~d v h v ~h v ~i v i v ~i, b v ~g v a v g v ~a v c, b v ~a v d v f v e v c v ~j v ~e v ~h v ~j, b v e v d v ~j v b v a v ~g, b v h v f v ~i v f v j v ~f v ~d, b v h v h, c v ~b v f, c v a v ~f, d v ~e v ~i v ~f, d v ~b v h, d v g v j v ~g v ~f v ~f v g v c, d v i v d v f v j v ~d v g v h v ~h, e v ~j v a, e v ~i v ~j, e v ~e v ~b v b v ~e v g v ~e, e v ~d v ~c v d v ~i, e v ~b v ~g v d v i v a v ~c v c v ~g, e v b v a v i v ~i v ~e v ~g v ~f v f v ~d, f v d v f v b v h v f v h v i, f v e v e v ~g, f v i v g v ~a v f v j, i v j v ~j v c v ~e v f, j v ~b v ~f v g v ~i, j v f v h v ~d v ~c v i, j v j v ~a v g v ~c, j v j v d v ~a v f v b v ~e v ~a v ~d], 2000, count(106)).
tests(big_testcase42, validity, [~j v ~j v e v e v ~b v i v ~f, ~j v ~c v ~d v ~d v c v ~d, ~j v a v c v ~d v c, ~i v ~d v ~h v h v ~g v j v g v ~f v ~i, ~h v c v h v j v ~e v h v ~d v ~e v ~h v a, ~h v e v ~e v ~f v ~d v b v e, ~g v ~j v c v h v j v ~j v ~a v ~d, ~g v c v a v a v c, ~e v ~h v ~i v i v f, ~e v ~b v ~a v f v ~d v b, ~e v h v ~c v ~f v e, ~d v b v e v ~c v i v ~d v ~e v ~h, ~d v c v e v ~g v ~f, ~c v ~i v f, ~c v ~e v ~h v ~f v j v ~j v ~d v ~b v ~g v f, ~b v ~j v ~b v f v g v ~c, ~a v j v ~f v ~c v f v ~d v f v e v ~b, a v ~g v ~a v ~h v ~j v ~c v e v ~e v j, a v d v f v g v d v ~a v ~i v d v ~g, a v d v g v e, a v e v i, b v ~e v ~d v f v e v j v c v h v b, b v ~c v h v ~i v ~g v a, b v i v ~j v ~c v ~f v ~c v ~g v a, c v ~j v ~d v ~b v f v b v ~c v j v f, c v ~j v b v d v j v b v e, c v ~f v e v ~b v ~b v g, c v c v ~d, d v ~g v h v g v c v ~j v h v ~i v i, d v ~d v ~b v ~f v ~j v ~h, d v ~c v ~f v b v f v ~b, d v i v ~g v ~a v ~h v i v ~b v ~g v ~g v f, e v ~i v a v ~i v a v ~e v j, e v ~i v d v b v b, e v ~b v b v g v a v ~h v ~d v ~j, e v f v c v i v i v e v ~i v ~c v e, f v ~j v ~d v ~f, f v ~e v a v ~b v e v ~e v c v ~a v ~b v ~j, f v ~a v ~f v ~c v h v a v c v a v ~i v ~h, f v c v f v j, f v e v a v ~e v ~g v ~f v ~d v ~c, f v i v ~h v j v ~e v c v h v ~b v ~d v f, g v b v ~j v h v ~i v ~c v ~f, g v b v ~b v g, g v d v ~e v i v c v ~c v ~d, h v ~e v ~c v c v f v ~c, h v i v ~c v ~c v f v ~a v ~g v ~e v ~h, i v ~f v ~b v ~e v c v h v ~f, i v i v ~d v ~b, j v b v h v ~c v ~j v ~b v ~h v ~h v h v ~c], 2000, count(312)).
tests(big_testcase43, validity, [~h v ~h v ~h v a v ~c v j v ~b v ~j v ~a, ~h v ~b v ~e v ~e v a v ~i v c v ~g v f v ~i, ~h v a v ~g v ~e v ~d v ~a v b v ~f v ~i, ~h v i v f v c v ~j, ~h v j v ~d, ~g v ~e v ~b v j v i v f v b v ~c v ~b, ~g v c v c v g, ~f v ~d v ~h, ~f v f v c v e v h, ~f v g v ~f v a, ~e v ~b v a v ~d v ~d v ~e v h v g v ~c, ~e v i v ~i, ~e v j v a v j v ~e, ~d v ~a v e v h v e v ~c v ~e v ~j v ~c v ~b, ~d v c v ~d v g v ~a, ~c v ~b v d v ~b v f v ~g v f v d v ~j v d, ~c v b v ~c v b v d v g v ~e v e, ~c v c v ~d v h v a, ~a v ~h v a v ~e v ~e v j v ~g v ~h v b, ~a v ~f v f v h, ~a v a v ~d v j v ~g v g v ~d v f v f, a v a v ~d v d v ~a, a v c v ~j v ~i v e v ~j v e v ~d v c v g, a v c v e v ~c v ~g, a v h v ~b v ~j v i v ~a v ~d v ~f, b v ~i v ~e v c v d v h v b, b v e v ~f v d v b v ~h, b v h v ~c v ~j, b v j v ~a v ~a v ~i v ~f v h v h, c v a v ~i v b, c v i v ~d v ~g v ~f, d v ~b v ~a v f, d v ~a v c v d v ~i v ~g v ~b v ~e v f v ~e, d v g v ~d v ~a v ~i v ~a v ~c v ~b v ~d, d v g v i v ~g v j, e v ~g v i v ~e v j v e v j v ~c v ~j v g, e v ~f v ~c v ~a v d, e v ~e v ~c v ~j, e v a v ~e v ~f, e v a v f, f v ~e v j v ~e, f v ~d v ~b v ~i v f v j v j v f v ~e v ~h, g v ~e v ~i, g v b v b v ~j v h v f v ~b, h v ~j v ~j v c, h v ~g v e v j v ~j v ~b v ~g, h v d v b v e v g v d v ~e v ~c, i v ~d v a v e v c v c v ~b v f, j v ~c v ~f v g v a v d v ~g v h, j v i v ~h v f v ~j v f], 2000, count(182)).
tests(big_testcase44, validity, [~j v ~a v f v ~d v d v ~a, ~j v b v a v ~j v ~j v f v ~c v a v j, ~j v h v ~j, ~h v ~h v g v f v d, ~h v b v ~d v f v ~h v ~a v ~f v d v ~h v b, ~h v d v a v b v g v ~h v ~j, ~g v ~j v a v f v ~i v ~c, ~g v ~j v g v ~d v ~j, ~g v ~h v ~h v ~b v c v d v h, ~g v e v ~d v ~e v i v ~e v ~i v ~j, ~f v f v d v ~i v ~g v a, ~f v j v a v g v a v d, ~e v ~c v d v j, ~e v ~a v f v ~a v ~c v ~h v g v ~g v e, ~e v a v b v b v c v b v ~a v ~h v ~b, ~e v f v ~h v ~c v ~f v ~a v ~h, ~c v ~b v c v ~h v e, ~c v c v ~b v ~j v j v ~c v g v h, ~c v i v ~j, ~c v j v ~f v ~f, ~b v ~i v b v e v a v e v ~e v ~b, ~b v ~g v ~e, ~b v b v h, ~b v c v ~j v ~b v ~c, ~b v j v ~g v ~c v b v j v ~h v j, ~a v ~j v h v e v ~g v f v ~d v g v j, ~a v a v a v c v a, ~a v d v g v d v ~a v j v f v d v b v j, ~a v j v h, a v ~i v ~f v ~f v ~e, a v c v ~d v g, b v ~c v c v ~a, b v g v f v h v ~f v e, d v ~c v a v ~h v d, d v j v ~a v e v f v ~j v ~j, e v ~i v a v ~b, e v ~b v ~f v b v ~j v d v ~j v ~h v ~e v b, e v ~a v ~i v j v f v ~e v ~g v c v ~j, f v ~g v a v i v ~b, f v g v ~j v ~j v d v f v ~f v g v ~i v ~j, f v g v ~c v ~c v ~b v ~e v ~i v ~f v d v g, g v ~b v ~j v c v ~e v ~e v g v ~d, g v ~b v ~d v g v ~b v c v ~c v ~c v ~b, h v e v ~g v h v ~g, i v ~i v a v ~d v ~d v a v ~b, i v ~b v f v ~j v f, i v b v ~c v i v a v h, i v c v ~f, i v e v ~b v e v i, i v i v c], 2000, count(123)).
tests(big_testcase45, validity, [~j v ~j v ~e v ~b v ~i v ~h v c, ~j v ~e v ~f v b v c, ~j v ~a v c v ~f v i v e v ~j v ~f, ~j v f v i v b v ~i v d v i v g v ~b, ~j v g v ~j v g v a v ~c v d v ~i v g v ~g, ~i v ~e v d v d v a v ~b v d, ~h v ~e v ~a v g v ~e v i, ~h v d v a v a v ~j v ~d, ~g v b v a v e v j, ~f v ~c v ~b v d v a v ~h, ~f v ~a v ~i v e v i, ~f v j v h v ~d v e v a v ~h v a, ~e v ~h v g, ~e v ~g v a v ~j v ~i v g, ~e v ~f v ~g, ~d v ~h v ~h v a v a v e v ~g v h v f, ~d v ~f v ~b v f, ~d v ~a v d, ~d v a v g v a v h, ~d v e v f, ~d v g v ~j v ~d v a v e, ~c v ~d v c v c, ~c v f v h v e v g v ~b v c v ~f v ~a, ~b v ~b v ~c v j v b v ~i v j v i v h, ~b v a v j v g v ~c v e v b v ~h, ~a v ~e v ~h v ~g, ~a v a v b v ~a v ~f v ~f v d, a v ~h v i, a v ~b v ~h v ~f v ~b v ~b, a v g v ~h v a, b v ~h v ~g v j v d v ~e v g v ~d, b v ~g v d v g v ~b v h v ~e v d, b v ~c v ~d v h, b v ~a v ~i v ~c v ~e v b v ~b v ~d, b v g v ~g, d v c v ~d v ~g v ~g, d v f v c v d, e v f v ~i v ~e v g, e v f v i, e v h v b v ~d v d v ~f v ~j v h v f v j, f v ~e v ~b v ~f v d v ~b v a v ~h, g v ~b v c v ~b v i, g v ~a v j v f v ~j v ~d v h v ~h, i v ~g v c v b v j, i v ~e v a v ~b v ~a v ~a v e v ~g v j v a, i v ~b v ~d, i v ~b v ~d v a v ~c v g v g, i v e v ~d v ~a v ~e v ~h v f v a v b, i v f v c v e v h v ~e v ~e v b v ~i v f, j v b v ~e v ~j v ~d v ~i v c v ~f v ~g v i], 2000, count(233)).
tests(big_testcase46, validity, [~j v ~h v ~c v e v ~d v e, ~j v ~g v ~i v ~j v ~e v b v ~j v ~e, ~j v ~f v ~b, ~j v ~e v c, ~i v ~a v a v a v ~g v i, ~i v j v e v ~f v ~a v h v b v ~j v ~a v ~f, ~h v ~f v g v ~d v j v ~b v g, ~h v ~a v ~b v ~c v ~h v ~b v a, ~h v a v ~a v b v c v ~b v ~c, ~g v c v ~j v ~j v f v ~i, ~f v ~j v ~j v h v j v d v ~d v e v ~f, ~f v ~b v i v g v ~j v c, ~e v ~a v a v e v ~a v ~g v ~b v ~a, ~d v e v c v i v ~c v j v j, ~c v ~f v ~f v ~j v ~f v ~e v ~c v ~a, ~b v a v ~i v ~j v b v ~h v j v g, ~a v ~j v f v g v d, ~a v ~g v ~h v ~f v ~b v g v i v f, ~a v ~d v ~a v d v ~a v i v d, ~a v c v b v ~i, b v ~d v g v i v g, b v ~a v ~f v c v a v ~d, b v j v ~g v ~j v ~e v ~i v i, c v ~h v a v ~d v ~g v ~h, c v ~f v ~a v e v ~e v ~h v f, d v ~d v f v b v ~f, d v c v ~j v e v d v c v ~a v ~d, d v e v h v g v ~d v d v f v d, d v i v b v a v ~h v e v d v e v i, e v ~g v g v ~f v ~c v ~c v d v j v ~g v b, e v ~b v ~f v ~h v f v a v ~i v g, e v e v ~c, f v ~e v g v ~b v i v c v ~e, f v ~d v d v i v j v ~c v ~g v ~f, f v i v ~b v ~h, g v ~h v ~e v ~g v ~a v g v g v g v ~f v ~b, g v a v b, h v ~e v c v f, h v ~d v ~c v ~c, h v a v ~f v j v ~f v ~h v ~j v i, h v c v ~e v ~b v ~g v ~i v ~g v j, h v c v ~d v f v j v ~g v i, h v c v d v ~j, h v d v b v a v ~j v ~c v i v ~c, h v e v i v ~h v ~f v ~a v ~b v c, h v j v ~g v f v ~d, h v j v ~c v i v ~g, i v g v g v g v a v ~h v j, j v d v a v c v i, j v i v d v e v i v e v c v j v b], 2000, count(189)).
tests(big_testcase47, validity, [~j v ~f v ~b v d v ~j v ~c v ~b v ~g v ~d, ~j v ~c v j v ~i v ~c v ~f v ~j v h, ~j v f v ~g v ~j v ~i v ~a, ~i v e v b v ~d v ~i v c v ~e v h v ~b, ~i v h v ~b v i v ~e v d v ~e v g, ~i v i v ~e v ~j v ~a v b, ~h v ~i v i v a v g v ~h, ~h v ~f v ~b v a v g v j v d v e, ~g v ~j v c v ~a v ~e v ~b, ~e v ~j v ~g v e v ~d v ~b v c v j v ~c, ~e v ~j v d v g v ~c v ~j, ~e v ~e v ~g v ~e v ~e v ~e v h, ~e v ~c v a v ~a v e v j v ~f v ~i v e, ~e v ~b v a v ~h v b, ~e v d v e, ~e v f v ~b v a v ~g v j v d v ~f v j v h, ~e v j v ~a v ~i v g v ~g v ~c v ~a, ~d v ~c v ~i v c v c v j, ~d v b v ~g, ~d v f v g v ~e v h v e v b v ~b v d, ~c v c v ~b v ~h v ~f v a v c v ~e v ~g, ~c v i v f, ~b v c v ~b, ~b v d v ~f v e, a v i v h v ~f v ~g v ~j v ~e v g v i, b v ~i v d v b v g, b v ~g v ~a v f, c v ~f v ~d, d v ~e v j v a v g v ~i v j v ~i v h v h, d v f v f v ~a v ~b v ~j v i v h v ~j, e v ~h v ~d v ~c v ~g v i v b, e v ~f v ~b v ~b v d v a v ~e, e v h v ~d v ~e v a v b, f v ~i v ~j v e v e, f v ~b v ~c v ~c v a v ~h v b v g, f v d v ~d v f v c v ~j, g v ~j v ~j v d v ~e, g v ~i v h, g v ~a v h v ~a v e v ~c v h v ~a v ~h, g v e v ~d v b v b v ~f v i, h v ~e v d, h v b v f v g v ~f v ~j v g, i v ~i v ~a v e v ~g v ~b v ~h v ~a, i v ~i v h, i v ~h v ~j, i v a v ~e v j v h v ~i, j v ~j v a, j v ~i v a v d v ~c v ~b, j v ~a v h v ~b v c v h v d, j v h v b v ~e v h v i], 2000, count(177)).
tests(big_testcase48, validity, [~j v e v b, ~i v ~g v ~f v ~i v a v ~a v c v ~b, ~i v ~g v g v g v i v b v ~h v i, ~h v ~j v ~e v ~c, ~h v ~e v c v b v ~j v g v j, ~h v ~b v b v ~e, ~g v ~a v ~g, ~g v h v ~g, ~f v b v b v a v ~j, ~f v b v d v ~d v d v ~e v ~h, ~f v b v f v h v ~c v ~a, ~e v ~j v f v ~a v a v f v b, ~d v ~f v ~a v ~e, ~d v ~a v c v j v a v g v h v g v ~g, ~c v ~d v ~f, ~c v f v ~h, ~b v ~h v ~d v ~h v c v h, ~b v b v ~b v ~b v c v b v ~f v ~h v b, ~b v b v j v i v e v d v ~e v i v j v ~h, ~b v g v a v ~i v ~e v ~b, ~b v g v g, ~a v ~f v c v ~d v e v j v ~a, ~a v d v d, a v ~c v ~a v ~h, a v h v d v ~e v j v d, b v b v ~h v ~j v d, b v g v ~c v ~c v ~g v ~b v ~e v j v e v ~b, c v ~b v d v ~g v ~d v ~f v ~c v d v ~a, c v g v j, e v ~j v ~e v ~a v a v ~f, e v ~j v ~d, e v ~i v ~d v c, e v ~f v ~h, e v ~a v i v ~i v a, e v d v ~a v i v h v d, f v b v h v a v b v ~f v ~j, f v g v ~a v i v j v j v ~i v ~b v f v j, f v g v b v f, f v g v j v j v g v i v ~e v f v c, g v ~c v j v g v ~d v ~c v ~e v f v ~a, g v ~a v ~e v i v e v j, g v h v b, h v ~d v ~f v ~b v ~e v ~e, h v c v ~i v d v e v ~i v ~h v ~b, h v f v ~c v ~j v ~i v d, i v f v h v ~h v ~f v d v ~h v ~a v g v ~c, j v ~a v e v i v ~j v ~c v ~j v d v ~a v ~a, j v a v a v ~f v ~j, j v c v ~e v a v ~e, j v g v ~e v ~a v ~h v ~b], 2000, count(24)).
tests(big_testcase49, validity, [~j v ~e v ~h v i v a v d v g, ~j v c v ~h, ~i v i v ~i v c v ~j v ~a v ~d v a v h v i, ~h v ~j v j v ~j v e v ~a v ~h v h, ~h v j v ~e, ~g v ~f v ~c v ~g v d v b v ~f v d, ~g v ~d v ~i v j v ~i v h v g v a, ~g v e v ~a v ~a v a v j v ~i v g, ~g v g v ~i v ~d v f v c, ~f v ~i v ~b v h v ~j v d v ~b v i v ~i v ~c, ~f v j v h v ~b v g v ~j v ~d v ~g v ~h, ~e v ~e v f, ~e v c v b v b, ~e v e v ~d v j v j v g v ~b, ~e v g v e v a v d v f v ~d v ~g v ~a v f, ~d v ~g v ~i v ~d v j v ~a v d v ~h, ~d v ~d v ~i v b v ~f, ~c v ~i v ~b v f v ~d v ~f v ~e v g v ~d v ~d, ~b v ~g v b v j v f v ~h, ~b v ~g v j v ~b v ~f v ~a v ~e v b v ~c v c, ~b v ~c v h v a v ~a v ~e v f v f v c v ~h, ~b v g v ~d v ~f v g v ~j v e v c v e v c, ~a v ~i v j, ~a v ~a v f v ~g v ~e, ~a v j v h v i v ~a v h v ~j v b v ~b v j, a v f v g v ~a v ~g v g v ~a v f, b v i v e v j v d v ~f v b v f, c v ~h v ~g, c v ~f v ~e, c v ~d v f v ~c v f v ~d v d, d v ~a v ~j, d v e v ~f, d v i v f v ~a v h v i v ~i v ~b v ~j v j, e v e v j v ~b v c v f v ~h v b v c v j, e v f v a v g v ~d v c v ~b, e v j v j v b v b, f v ~g v h v ~c v e v ~b v ~a v e v i, f v ~f v ~a v j v ~i v ~d v ~f v ~g v c, f v ~e v ~e v g v c v ~b v ~g v c v ~a, f v h v c v ~h v a v i, g v ~j v ~g, g v ~h v ~c v e v ~c v e, g v g v b v b, h v f v e, h v h v f, h v j v ~f v h v ~i v ~a v ~i v ~i v f v a, i v ~d v a v ~e v f v h v f, j v ~e v d v ~g v a, j v a v ~d v a v ~f v i v c v h v b v ~c, j v b v ~i v f v a v ~a v h v ~a v j v ~h], 2000, count(101)).
tests(big_testcase50, validity, [~i v ~b v ~c v h v ~d v h v j, ~h v ~f v g v i v i v ~a v h, ~h v ~d v e v i v ~g v ~a v ~a v ~b v f v f, ~g v ~i v ~a v e v ~j v ~d v ~e v ~h v ~a v g, ~g v ~e v h v ~h v e, ~g v c v ~a v ~h v ~j, ~f v ~f v i v ~f v ~i v ~g v b v ~d, ~f v f v c v ~e v f v e v e v ~c v g v ~b, ~e v ~d v ~a v j v g v h v b v ~f v ~h v g, ~e v ~d v c v ~d v ~a v ~d v ~f v ~e v ~j, ~e v ~c v i v d v ~f v ~a v ~g v ~d v f v i, ~e v ~b v h v ~j v ~b, ~e v a v g v d v ~g v ~f v ~c v i, ~e v b v i v ~c v d v ~e, ~e v c v ~d v f v j, ~e v j v a v ~j v ~c v a v ~c v ~i, ~c v a v c, ~c v e v ~j v d v j v d v i v ~f, ~c v j v ~i v c v c v a, ~b v ~h v j v a v ~c v ~e v ~f, ~b v ~g v ~g v a v c, ~b v ~e v g v c v ~a v a v ~c v ~g v f v b, ~b v ~c v d v ~c v ~g v ~d v a v ~f v g v ~b, ~b v c v ~h v g v a v i v ~c, ~b v i v ~d v g v ~d v c, ~a v ~j v i v ~e v ~j v ~a v a v ~j v f v ~g, ~a v ~i v h v a v ~c, ~a v d v j v b v ~j v b, a v ~j v b v ~j v g, a v a v j v ~a, b v ~g v ~e v ~f v ~c v d v ~f v e v h v h, b v ~f v d v ~f v i v ~f, b v ~d v e v d v a v ~f v a v j v i v j, b v d v i v i v ~a v d v g, b v i v ~j v ~f v c v e v ~a v ~g v d v ~h, b v i v ~i v c v ~i v ~i v ~i v ~a v a, c v j v ~g v c v ~b v e v ~c v ~j v i, d v a v f, d v e v ~h v ~g v j v ~b, e v c v j, f v b v ~a v j v e v ~c v ~a v ~g v ~j, f v i v ~a v ~b v ~j v f v i v ~d v ~d, g v ~e v d, g v ~a v ~b v j v i v j v i, g v j v ~i v ~c, h v ~g v f v ~d v ~f v d v i v ~e, h v f v ~b v i v h, h v h v ~d v i v j v ~j v ~d v h v ~a v g, j v ~h v i, j v d v ~h v f v ~g v i v d v ~h v ~b v d], 2000, count(312)).
tests(big_testcase51, validity, [~j v ~g v ~e v a v ~i v ~b v ~i v h v ~d v ~i, ~j v ~b v b v ~i v h v g v i v j v ~g, ~j v f v d v c v f v ~i v f v h v e, ~j v f v f v ~b v c v ~e v ~b v b, ~i v ~a v ~b v e v ~d v b v ~e v j v f v ~j, ~i v a v ~a v d v h v f v b, ~i v d v ~b v ~d, ~i v i v ~h v d v ~d v ~d v g v ~a v ~e, ~h v ~g v g v g v ~g v b v g, ~f v ~i v ~h v d v j v g v j v f v a, ~f v ~g v i v j v a v e, ~f v a v ~g v h v i, ~f v h v ~i v ~b v ~i v d v ~e v ~g v ~g v c, ~e v ~j v a v g v ~f, ~e v ~c v a v ~e v g v b v c v ~i, ~e v a v ~g v ~b v ~d v i, ~e v d v ~h v a v i v ~i v ~h v b v c v a, ~e v d v j, ~d v ~g v h v ~h v ~e v b, ~d v ~f v f v f v ~b v ~g v h v ~e, ~d v c v d v ~a v ~i v ~d v d v ~d v ~j v d, ~d v d v ~g, ~d v g v j, ~c v ~c v ~h v j, ~c v h v ~a v ~f v b v j v h, ~b v ~c v j v ~d v ~b v b v h v a v ~g v f, ~b v ~a v a v j v ~i v ~f v ~j v ~b, ~b v i v i v i v g v d v ~a v ~d v ~d, ~b v j v c v ~j v ~b v h v ~c, ~a v e v ~c v ~h, b v ~a v ~a v ~j v h v ~i v ~c, b v g v ~j v h v ~j v ~h v j v ~h v g, b v i v ~j v d v ~a v ~e, c v ~f v ~d v f v h v ~d v ~b v i v ~g v ~e, c v e v ~e v ~c v ~i v ~d, c v j v i v ~i v h, d v ~e v ~a v h v ~j v ~h v j v f, d v f v i v a v ~b, d v h v ~d v ~e, e v ~i v ~h v j v ~c v b v f v ~h v ~g v j, e v ~i v f v ~j v c v ~j v ~a, e v ~e v ~j v g v e, f v f v b v ~b v e v h, g v ~j v d v j v d, g v ~h v h v e v d v d v f, g v g v ~j v ~h v g, g v i v e v ~b v g v ~d v i v f, i v c v f v ~j v d, j v ~a v i, j v h v a v ~j v ~g v ~e v c v c v ~h v ~c], 2000, count(363)).
tests(big_testcase52, validity, [~i v ~g v i v ~c v ~c v ~f v d v h v ~a v ~f, ~i v ~c v ~e v b v e v d v ~i v ~b v ~a, ~i v c v d v d v ~g v ~g v ~g, ~h v ~j v ~i v ~a v ~i v ~g v a v ~a v i, ~h v a v ~d v c, ~g v ~a v ~e v b, ~g v a v h v d v ~h v c v f v d v ~h v h, ~g v c v ~c v ~h, ~g v d v ~j v h v ~i v f, ~g v h v c v ~f v ~a, ~g v j v ~a v ~e v ~b v ~f, ~f v ~d v ~f v b v ~e v ~c v g v ~b v ~d v e, ~e v ~h v b v ~f, ~e v ~g v h v g, ~e v j v d v ~h v ~e v a, ~d v ~j v ~h, ~d v ~d v ~c, ~d v j v b v ~g v ~f, ~c v ~i v ~b v i, ~c v i v ~d v i v ~i, ~b v e v ~b v g v g v ~h v g v ~g v f, ~a v ~g v ~f v g v ~g v h v i, ~a v a v a v e v ~h v e v ~g, ~a v h v ~c v h v ~e v g, ~a v i v ~h v a, a v ~h v ~f, a v ~e v ~h v e v g v ~g v ~d, a v ~e v ~f v ~h, a v ~d v ~h, b v ~e v ~h v a v d v ~a v ~j v ~f v b v ~b, b v ~b v ~d v d, c v ~j v ~g v ~j v ~e v ~c v h v ~c, c v ~j v b v ~g v c v d, c v a v j v ~b v ~i v ~h v ~g v ~f, c v c v i v ~f, c v j v b v h, d v ~f v c, e v ~f v ~f v ~f v f, e v ~b v ~e v d v h v c, e v ~a v j v a v d v c v i v ~e v g v ~g, e v g v ~i, e v j v ~c v ~h, e v j v b v ~h v ~f, g v ~i v j v e v ~c, g v ~b v a v f v h v ~f v g, g v f v a v d v j v b v ~e, g v j v ~b v ~e, h v ~g v ~b v e, h v j v c v ~d v ~c, i v i v ~d v e v ~b v e v j v f v f v j], 2000, count(187)).
tests(big_testcase53, validity, [~j v b v a v j v ~g v f v ~g v j v i, ~j v h v h v a v i v ~d, ~i v ~i v ~f v c v e, ~i v b v d v a v h v ~a, ~h v h v ~j v i v ~e v i v ~i v g, ~g v ~c v ~a v b v b v g v ~j v ~e v h v h, ~g v c v f v f v ~g v h v i v ~e, ~g v d v ~b v ~e v ~j v e v i, ~g v h v i v d v j v ~d v ~g v c, ~f v ~j v ~d v ~i v ~i v ~j v ~h, ~e v a v ~a v a v c v ~h v ~b v d v g v ~f, ~d v ~a v b, ~d v b v i v g v e v ~g v d v ~i v ~a v ~j, ~d v d v g v ~a v d v c v e, ~d v e v j v ~i v e v ~g v i v c v ~h v f, ~d v i v g v ~c v ~e v ~g v a v h, ~c v ~h v j v e v ~a v ~i v a v d v ~d v ~e, ~c v a v ~j v i v i v ~g v c v b, ~c v a v ~e v i v ~j v b v ~a v c v d v i, ~c v c v ~i v g v e, ~b v ~g v ~e v b v e v ~d v i v a v i, ~b v c v i v ~i v ~i v f v c v e, ~a v ~i v a v e v f v ~j v g v ~e v ~f, ~a v j v i v ~a, a v ~j v i, a v ~g v ~h v e, a v ~d v ~e v d v ~i v ~d, b v ~g v h v g v ~b v d, b v ~e v ~j v c, b v ~a v g v h v ~h, c v a v ~h v ~c, c v b v ~i v h v ~a, d v ~d v b, d v j v ~i v ~e v ~d v g, e v ~c v ~i v b v g v ~f v ~g v j, e v ~c v ~h v ~e v ~f v c v ~i v d v d, e v ~b v ~i, e v h v ~a v d v ~d v ~h v ~a, e v i v f v b v ~c v ~h, f v d v a v ~e v ~f v h v b v ~b v j, g v ~i v d v c v ~a v e v ~i v ~g v ~f v f, g v ~h v c v g, g v g v ~j v d v f, g v i v i v ~d v ~e, h v ~h v ~g v d v ~d v ~j v ~f v ~c v f v ~i, h v ~c v c v ~b v a v ~i v ~g v ~c v ~g v ~f, h v ~a v f v ~h v h v c v ~i v ~i v ~e, h v a v j v i v c v e v ~g v ~b v e v ~d, i v j v ~j v ~e v g v f, j v f v i v ~f v ~h v e], 2000, count(334)).
tests(big_testcase54, validity, [~j v ~f v ~c v a v ~b v a v f, ~j v ~c v ~b v ~a, ~i v ~c v e v ~j v b v ~e v ~j v ~a v c, ~i v ~b v d v a v ~j v ~d v ~j v ~i v ~b, ~i v h v ~i, ~h v d v ~i, ~h v f v ~b v ~d v ~a, ~g v ~j v c v ~c v e v j v f v ~d v ~d, ~g v ~g v ~d v b v ~a v ~d v h, ~g v h v ~g v h v a, ~g v h v a v ~d v ~b v g v ~i, ~f v ~j v ~i v g v e v i, ~f v ~i v f v b v ~e v i v i v a v ~c, ~f v f v ~g v ~f v c, ~f v h v g v ~a, ~e v h v ~i v c v ~g, ~d v ~j v c v i v i v i v ~c v d v ~j, ~d v ~g v c v i v h v b v f v ~a, ~d v e v ~b v b v b, ~d v i v ~a v b v ~a v f v ~a v d v ~d, ~d v j v ~j v g v b v ~h, ~c v ~f v ~b v ~g v d v d v c v a, ~c v ~d v c v ~f v ~j v ~g v ~d v ~i, ~c v ~c v c, ~c v f v ~i v b v ~e v ~i v ~i v e v d v ~f, ~a v b v e v ~a v g v a v ~a v ~a, ~a v d v ~h v c v e v g, a v ~h v ~a v ~f v ~e v d v ~h v c v e, a v c v ~f v ~g, a v f v ~c v ~d v ~b v ~i v f, a v j v c v g v a v a v a v c, b v ~g v d v ~c v d v d v b v e, c v ~h v ~a v ~g v b v g, c v c v ~f v f v ~i, c v h v ~f v ~a v g v f, d v ~f v d v ~d v ~i v ~h, d v e v ~f v ~h, d v i v g v ~h v ~j, e v ~h v h v d v ~c v g v ~j v ~j, e v c v b v ~f v d v f v ~j, e v h v c v ~h v e v i v ~b v ~j v a, g v ~a v c v ~d, g v a v ~a v f v ~c v ~c v a, g v d v d v b v ~b v j v i v h, i v j v j v ~e v f v ~i v ~e v ~e, j v ~d v ~g, j v f v f, j v j v ~h v b v h, j v j v ~d v a v ~g v ~a v b v ~b v j], 2000, count(194)).
tests(big_testcase55, validity, [~j v ~b v ~g v g v i v ~e, ~j v ~b v i v h v f, ~j v e v ~g v d v i v g v ~b v j v ~d, ~j v j v ~c, ~i v ~j v ~e v i v ~f v ~c v ~g v ~h, ~i v ~d v d v ~g v c v f v d v c v ~f v f, ~h v ~f v ~b v f v j v ~g v i v ~g v j, ~h v e v i v ~i v a, ~g v ~d v ~d v ~e v ~j v i v g, ~g v ~b v f v ~j v g v ~c v g v ~h v f v ~i, ~f v ~a v ~f v ~c v ~f v ~f v ~g v e v ~h v ~c, ~e v ~j v c v ~d v ~f v ~a v ~a v d v d v a, ~d v ~i v j v ~d v ~b v ~b, ~d v ~d v ~j, ~d v e v d v e v c v c v h v ~d v ~b v ~h, ~c v ~f v g v c v ~i v ~a v ~c, ~c v h v ~d v d v ~d v ~a v ~f v ~a v ~a, ~b v e v ~c, ~b v h v ~j v ~c v ~j v a v g v j v f v ~g, ~b v h v ~c v ~d v e v ~c v ~g v ~e, ~a v c v ~i v ~g v b v ~g v a v ~g v ~i, ~a v c v b, b v ~i v ~d v h v ~e v b, c v ~i v ~a v ~h v ~i v j v e, c v a v g v f v ~c v f v ~d, c v c v b, c v d v ~b v g v ~b v ~e v d, c v h v ~c v c v ~h, d v ~j v ~f v ~i v ~e v ~b v ~h, d v ~e v ~d v a v e v ~j, d v g v f v d v d v f v ~e v ~c, e v ~b v i v ~b v ~c v ~d v ~c, e v b v ~g, f v ~g v a v h v ~a v i v a v j v i v ~i, f v ~c v ~f v ~j v c v g v ~a v ~h v ~f, f v b v i v h v i v ~j v ~h v ~b v ~f, g v ~c v h v ~c v e v ~j v ~j v i v ~e, g v c v c v b v d v i v d v ~g v ~h v c, h v ~g v ~g v ~h v d, h v ~d v ~j v g, h v ~a v d v ~j v ~j v a v d v g, h v e v ~e v b, h v e v h v g v j v ~h, h v g v j v f v j v b v ~b, h v i v ~j v ~g, i v ~i v g v ~h v ~d v ~c v b, i v h v f v ~c v i, i v j v d v ~b v a v j v ~d v ~a v g v j, j v a v ~j v j v g v ~c, j v b v ~j v f v ~d], 2000, count(266)).
tests(big_testcase56, validity, [~j v i v a v ~h v ~j v d v ~j v ~i v i, ~i v ~h v f v ~f v f, ~h v ~f v g v i, ~h v ~c v f v j v ~c v ~b v ~d, ~h v ~a v ~j v d v ~d v b v a v d, ~h v i v ~a v ~j v d v b v a v ~d v ~j v ~d, ~h v j v ~a v f v ~d, ~g v c v b v i v f v ~f v ~b v ~b v ~e v j, ~g v e v g v ~g v ~a v e, ~f v ~c v ~d v e v ~h v ~c v ~c v ~h v ~e, ~f v f v j v j v h v ~d v ~f v ~g v ~j, ~e v b v ~i v e, ~e v i v g, ~e v j v e v i v c v ~f v a v f v ~a v ~j, ~d v ~j v e v d v e, ~d v ~i v ~i v a v ~c v a v j v g v h, ~d v ~i v ~e v b v ~j, ~d v ~f v ~g v ~c v ~i, ~c v ~g v ~g, ~c v ~e v i v ~g v j v h v ~g, ~c v ~b v ~b v ~i v h v ~h v d v d v i, ~c v ~b v h v j v ~j v ~g, ~c v b v ~e, ~c v e v j v ~j v f, ~b v h v e v d v c v c v ~a v j v ~j, ~a v c v ~i, ~a v g v ~b v ~i v ~g v h v c, a v ~g v ~i v ~h, a v ~e v g v g v f v ~g, a v c v j v g v f v j v ~a v ~c, a v h v ~d v ~i v c v ~i v ~a, a v j v d v c v ~j, b v b v ~c v f v ~d v ~b v d v ~b, b v e v ~i v g v b, b v f v f v e v j v e v b v ~d v ~h, c v ~c v ~e v b v i v ~d v ~i v ~g v h v ~f, c v g v e v d v f, c v j v ~b v ~e v d v ~b v e v f v a, d v ~j v ~j v ~e v ~i v a v h v j v ~e v ~j, e v ~i v ~j v b v ~d v e, e v ~b v ~j v ~c, g v ~c v ~f v a v c, g v ~a v ~h v ~i v ~h v f v a, g v h v h v ~b, h v f v ~c v g, h v i v ~d v ~j v c v e, i v f v j v j v ~a, i v h v ~j v ~e, j v ~g v i v ~b v ~i v ~h v b v ~f v ~c v i, j v ~e v ~d v ~e], 2000, count(163)).
tests(big_testcase57, validity, [~j v d v c v b v ~c v ~d, ~j v f v c v b v b, ~i v ~a v ~i v ~e v e v f v ~a v e v j v e, ~h v ~h v ~i, ~h v b v ~e v j, ~h v f v ~i v c v a v ~e v ~c v ~e, ~g v f v ~e v d, ~f v ~j v ~i v ~g v ~i, ~f v ~g v ~e v ~j v f v g v ~j v ~i v b v i, ~f v f v ~c v b v ~a v d v ~h v ~c v ~f, ~e v ~h v d v ~c v ~d v ~c v ~b, ~e v ~a v g v ~i, ~e v a v ~c v c v i v h v ~g v ~j v g, ~e v g v ~j v h v h, ~d v ~g v ~e v f v ~j v e v ~e, ~c v ~d v e v ~b v b v ~h v ~e v b v g v ~e, ~c v ~c v ~d v ~b v ~c v e v i v b v ~g, ~b v ~e v ~f v c v j v f, ~b v e v a v ~j v ~i v f, ~a v ~b v ~j v e v d v ~a v e, ~a v j v c v j v ~g v d v ~e v ~j v b v g, ~a v j v j v j v f, a v ~j v c v d, a v ~h v b v ~j v c v ~j v ~c, b v ~g v ~c v ~d v ~f v ~d, b v ~g v d v c v f v c v c, b v f v ~i v g v g v ~c v b v j v i, b v g v g v ~i, b v i v ~b v e v ~e v a, d v ~b v d v ~b v f v h v g v a v ~c v c, d v a v a v b v f v a v f, d v e v ~j v ~e v h, d v e v ~e v ~j v j v f v ~a, e v ~b v a v ~i, e v b v ~a v ~h v ~b v ~f v i v a, e v f v ~e v i v j v ~i v f v j, f v ~h v c, g v ~f v ~e v ~b v i v i v ~e v c v a v e, g v c v ~g v ~c, g v i v h, h v ~c v ~e, h v g v a v i v ~i v ~i v ~j v d v h, i v ~h v c, i v ~e v ~b v f v ~f v h v g, i v h v ~b v ~c, i v i v a v ~a, j v ~b v ~c v ~c v ~a v b v h v ~h v ~b v d, j v a v h v ~j v j v f v ~c v i, j v f v ~j v ~j v b v ~h v ~e v ~i, j v i v a v d v ~a v ~a v ~j v j v f v i], 2000, count(165)).
tests(big_testcase58, validity, [~j v h v ~g v d v f v ~d, ~j v j v a v f v b v b v ~d v a v ~d v i, ~i v ~j v a v f v ~e v ~e v g v a, ~h v ~b v ~e v ~f v ~d v f v ~c v ~c v ~b v ~f, ~h v b v ~f v j v ~a v ~a v c, ~h v i v b v ~f v ~i v e v j v ~c v ~d v e, ~g v ~g v ~h v e v b v d v a v f v j v h, ~g v c v h v ~i v d, ~g v f v ~c v a, ~f v ~d v ~i, ~f v ~a v ~h v ~e v a v i v i v ~b, ~d v ~h v ~i v i v ~d, ~d v ~g v ~i v ~d, ~d v ~g v ~a v d v b v ~e v ~c v g v d, ~d v ~c v ~i, ~d v c v d v ~j v ~h v j, ~d v e v b v ~c v ~b v a v j v e v e, ~d v j v b, ~c v ~f v a v g v a, ~b v ~i v ~h, ~b v ~e v i v ~a v j v ~f v ~a v ~g, ~b v ~c v ~b v f v e v ~j, ~b v g v ~c v i v ~d v d, ~b v i v g v c v d v ~j v g v ~a, ~a v ~j v i v a, ~a v ~f v ~i v c v ~i v ~b v j v ~j v g, a v ~h v ~d v ~c v ~d v ~d v c v ~j, a v b v ~b v h v ~b v ~h v g v ~h v d v b, a v i v ~g v d v d v e v a v ~a v c v ~i, b v ~e v ~c, c v ~b v f v ~h v ~d, c v a v ~e, c v c v ~i v a v c v ~g v ~h, d v b v f v f v j v ~a v ~j v ~f v ~c, e v ~f v h, e v b v ~i v h v ~h v ~d v h v ~i, f v ~c v ~b v g v i v f v ~j v f v ~a, g v ~h v ~e v ~d v ~b, g v ~c v b v ~j v ~d v g v b v a, g v j v e v d v j v b v g v ~g, h v ~g v j v e v ~c v d v ~d v b v ~f v ~h, h v ~b v ~h, h v ~b v e v f v g v ~c v j, h v j v ~a v ~a v ~g v ~g v ~a v d v ~e v ~c, i v ~f v j v b, i v ~b v ~j, i v e v f v b v f, i v i v c v ~i v f, j v ~f v a v c v ~a v i v ~c v ~j v a, j v j v j v ~h v ~d v ~h v d v h v g v e], 2000, count(165)).
tests(big_testcase59, validity, [~j v ~f v h v ~g, ~j v g v f v ~a v g v j v ~h v h v ~d v ~a, ~i v ~b v ~d v i v c v ~a v d v b, ~h v ~i v g v d v ~b v b v ~b v ~i v j v ~e, ~h v ~g v i v f v d v f v g v b, ~h v d v ~h v ~d v j v ~g v h v ~e v ~i, ~g v ~j v c v ~e v ~j v ~i v d v ~h v j, ~g v ~j v e v a v i v ~i, ~g v ~i v g v f, ~g v ~f v ~i v j v j, ~g v ~b v ~a v f v ~i v e v b v ~j, ~g v g v h v ~c v j, ~g v h v a v ~b, ~f v ~c v ~b, ~f v i v ~i v ~g v b v ~h v c v ~g, ~d v ~j v ~a v ~a v ~e v ~e v b, ~d v ~c v ~h v f, ~d v ~c v e v f v ~b v c, ~c v ~b v ~g v ~b v ~c v ~i v ~f v ~c v e, ~c v c v f v i v ~d v h v h v f v ~f, ~b v c v ~i v ~c v i v ~f v ~c v b v g v ~b, ~a v ~f v d v b v c v ~j, ~a v ~e v j v ~f v ~b v ~j, ~a v a v ~a v ~h v ~c v ~g v ~g v ~f v ~h, ~a v i v d v d v ~j v b, a v ~i v a v f v d v e v ~g v j, a v ~h v a v ~i v e v i, a v ~g v j v c, a v f v f v i, a v j v ~e v c v ~g v ~g, b v ~b v ~a v ~c v i, b v ~b v c v ~f v ~j v ~j v i v ~a v h v j, b v b v b v ~g v ~g v ~h v ~a v g v ~j v ~b, c v ~h v ~g v ~h v ~h v d v c v e v ~h v ~g, c v f v h v a v ~e, c v g v a v b v ~i, d v ~e v e v ~j v ~c v ~e v ~h v j, d v a v g v h v ~b v ~b, e v b v ~j v ~i, e v g v ~b v ~f v c v ~h, e v i v ~b v a v a v ~a v j v ~j, f v ~f v ~c v ~h v ~a v ~e v e v h v d, f v ~c v ~d, f v h v g v j v ~f, h v ~j v ~j v ~e, h v ~f v ~i v a v b v ~g v d v ~e v ~f v c, h v c v j v h v b v ~g v ~h v c v f v ~c, i v ~e v h v ~e v ~g v ~f v ~c v ~f, i v h v h v h, j v f v b v ~i v c v ~h v d], 2000, count(247)).
tests(big_testcase60, validity, [~j v ~d v b v g, ~j v ~b v f v j v ~d v c v ~h v ~g v ~a v a, ~j v ~a v ~c, ~j v d v j v ~d, ~i v ~g v ~g v h v i, ~i v a v c, ~i v c v a v e v b v ~j, ~i v e v a v ~f, ~h v a v ~c v j v d v ~g v d, ~f v i v ~b v c v b v ~f v c, ~e v ~h v ~f v e v g v ~d v ~c v ~g v ~h, ~e v ~a v ~g, ~d v ~j v ~e v e v e v ~j v d v ~d, ~d v ~i v ~i v a v f v ~e, ~d v ~c v ~j v ~e v ~b v a v ~c v ~c v b, ~d v ~b v ~d v e v ~f v e v ~d v ~e v ~h, ~d v f v f, ~d v h v ~d v d v ~c v ~g, ~d v j v ~f v ~i v i, ~c v ~f v ~d, ~c v a v ~g v ~b v e v ~a v d v b v ~a v ~j, ~c v c v ~c v f v ~d v j v ~d, ~c v d v ~i v ~e v b v ~e, ~c v g v e v b, ~c v h v ~i v b, ~b v ~d v e v ~f v a v ~b v d v ~h, ~a v ~i v ~j, ~a v c v ~d v c, ~a v d v ~g v i v c v ~f v ~h, ~a v f v j v ~h v ~d v ~d v ~b v ~g, a v ~h v ~e v f v i, a v ~e v ~e, a v a v ~f v ~j v ~a, a v g v ~j v b v ~c v ~f v ~d, b v ~a v h v ~j v ~i, b v a v ~c v ~h v c, c v ~a v b v ~i v ~e v c v ~i, c v e v c v e v d v i v ~a, d v ~j v ~c v ~i v ~c v ~c v e v ~b v ~h v g, d v a v g v ~f v e v d v ~f v ~e, e v ~h v ~e v e v ~h v i v ~i v b, f v ~a v a v e v e v d v j v ~a v b, f v ~a v j v ~h, g v ~h v a v b v ~b v ~d, g v c v ~d v c v i v f, h v ~b v ~i v ~b v ~f v ~a v b, h v g v f, i v ~i v j v ~g v ~d v ~b v f, i v ~g v i v b, i v f v ~a v g v ~f v ~f], 2000, count(86)).
tests(big_testcase61, validity, [~j v ~j v ~b v ~g v ~f, ~j v ~h v ~j v ~a v i v b, ~j v c v a, ~h v b v d v j v ~j v ~g v ~g, ~h v j v ~e v ~i v g v ~e, ~g v j v e v f v ~d v ~a, ~f v ~i v ~b v ~h v ~f v h v d, ~e v c v ~i v ~b v j, ~e v d v ~j v ~h v a v b v ~e, ~e v j v ~a v ~d, ~b v ~i v g, ~b v a v ~c v b v ~j v ~e v e, ~b v b v g v ~h v b v h, ~b v e v ~j v f, ~a v ~f v ~a v ~c v i v c v g v i, ~a v g v e v ~e v c v h v ~i v ~a, a v ~i v ~j, b v ~h v ~j v ~g v ~g v a v ~e v c, b v ~h v h v ~b v ~g v b, b v ~g v ~i v c v e v a v ~f v i, b v c v ~b v ~b v j v ~h v d v ~i v ~d v c, b v j v ~b v g v ~i v ~b v ~e v ~b v g v ~f, c v ~e v ~c v ~e v i, c v b v ~b v b, c v e v ~e v g v e v f v ~b v ~c v ~j v ~f, c v h v i, d v ~c v f v g v ~i v ~d v i v ~e, d v b v a v ~a v j v j v a v c v c, e v ~j v j v a v ~h v ~a v ~g, e v ~f v h v j v e v j, e v ~d v ~c v f v f v ~h v g, e v ~a v a v b v ~g v ~i v ~f, e v ~a v b v ~a v ~f v ~c v ~e, e v h v j v ~f v h v ~f v ~i, e v i v ~h v ~e v ~c v ~g v c v ~e, e v i v f v ~g, f v a v ~e v ~a, f v f v ~i v ~d v ~c v ~j, g v ~e v d v ~i v ~c v ~h v h v i, g v g v ~d v ~b, h v b v b v g v g v ~a v d v c v a, h v f v j, i v ~b v ~d v ~g v h v ~j v c v ~i v ~h, i v ~a v ~e v ~c v j, i v f v ~i, j v ~j v ~a v ~j v ~f v ~e, j v ~e v ~b v ~f v ~c v ~e v ~h v ~h, j v ~d v ~h v j v ~h v ~j, j v d v d v ~g v a v j v ~d v d, j v f v ~f v ~j], 2000, count(274)).
tests(big_testcase62, validity, [~j v ~e v ~a v ~g, ~j v g v a v ~g v ~e v j v d v ~g v h v i, ~i v f v ~b v g v ~i, ~i v g v c v ~c v f v g v ~j v e, ~i v h v ~i v ~g v f v b v c v a v ~j v b, ~i v j v f v d v f v a v ~e v ~c v ~e v h, ~h v ~h v j v ~e v ~d v i v ~j v ~b v e, ~h v a v i v ~g v h v h v ~i v c v h v a, ~f v ~j v ~g v ~f v d v g, ~f v ~c v c v ~j v i v ~e v b v f, ~f v ~a v c v c v ~h v g v ~b v ~h, ~e v i v ~f v g v ~d v ~j, ~d v ~b v h v ~d v ~h v ~j v ~e v ~f v c, ~d v c v e v d v a v a v e, ~d v d v ~b v ~f v ~c v ~j v f v d v ~c v b, ~c v ~f v f v ~h, ~c v ~d v ~h v b v j v j v ~e v g v d v ~h, ~b v ~a v g v ~h v ~g v i v f, ~b v a v ~d, ~b v d v ~j v g v ~h v ~a v ~c, ~a v ~j v ~d v e v j v g v c, ~a v ~j v ~b v b v e v ~h v f v ~g v ~f, ~a v e v c, ~a v i v ~i v f v e v ~f v c v ~g, a v ~g v h v c v e v ~j v ~i, a v f v ~j v ~d v ~i v ~h v ~g v h, b v a v ~e v ~e v g v ~j v ~c v ~i v ~d, b v d v ~i v e v ~a v j, b v j v ~i, c v ~g v c v ~i v e v b v j, d v ~f v a v e, d v c v e v f v e v ~c v d v g, d v h v ~d v ~a v j v ~c v c v c v e v ~j, d v h v ~b v ~b v b v h v ~b v ~i v ~e v j, d v h v b v e v g v c v ~i v ~d v ~i v a, e v ~g v i v ~i v ~h, e v ~e v ~d v j v ~h v ~h v ~a v d v ~d v e, e v ~a v g v ~a v c v ~i v e v j, e v j v b, g v ~d v ~b v f v g v ~h, g v ~a v a v ~j v ~d v e v g v ~i v c v ~b, g v b v f v a v ~h, g v e v i v a v ~f v ~b v ~d v h v c v ~j, h v ~j v ~a, h v ~c v ~j v ~h v c v b v ~e, h v e v a v ~a v e v b v ~c v ~b v ~h, h v j v ~d v ~g v ~h v c v j, i v c v d v ~b, i v e v ~e v ~j v a v ~c v ~i v ~h v ~d v ~g, i v j v c v ~b v ~b v a v ~b], 2000, count(309)).
tests(big_testcase63, validity, [~j v ~h v g v j v a v h v f v ~d v ~i, ~j v ~a v i, ~i v a v ~e v e v d v ~h v e v i v ~c, ~h v ~a v a, ~h v b v f, ~h v e v ~d v d v g, ~h v e v f, ~g v ~b v ~c, ~f v ~j v e v h v ~d v e v g v b v h, ~f v ~g v a, ~f v ~a v ~b, ~f v c v d v ~a v g v f v j v i v ~j v d, ~f v i v ~j v ~d v g, ~e v a v ~c v ~f v ~i v j, ~e v a v e v ~j v a v a v b v ~a, ~d v ~e v ~i v ~e v e v h v ~h v d v ~j, ~d v ~a v ~d v ~h, ~d v ~a v b, ~d v g v f v i v e v ~g v ~h v ~f, ~c v ~c v c v ~e, ~c v e v g, ~b v ~f v f v f v ~a v ~f v a, ~b v a v ~j v ~e v j, ~b v e v ~b v c v h v ~d v ~d, ~a v f v h v d v a v c, ~a v j v ~b v ~j v d v c v g v ~h v ~f, a v g v ~i v ~a v ~c v ~b, a v g v ~f, b v e v e v ~c v f v ~g v b v g v ~e, c v ~j v b v c v c v ~i v a v ~i v ~b v c, c v c v f v ~i v ~e, c v i v b v g v ~f v ~j v ~h, d v ~d v ~h v ~d v i v ~d v ~d v ~e, d v ~c v d, d v ~a v ~g v ~e v ~i v ~h v f v ~d, e v ~f v ~f, e v j v ~b v d v d v b v ~d v ~h v a, f v ~a v i v d v ~d, g v ~h v ~d v ~i, g v ~d v c v ~f v i, g v ~c v ~g v ~i v ~g v ~f v ~a v ~d v ~e v ~f, g v j v d v ~f v i v a v j v ~d v ~g, h v ~j v ~b v j v c, h v ~i v c v c v ~h v ~a, h v ~e v ~d v a, h v ~d v ~g v j v ~h, h v c v ~g, i v ~j v ~i v ~a, j v ~h v ~f v ~c v i v ~b v c v ~j v b v ~b, j v a v ~c v i v f v d], 2000, count(53)).
tests(big_testcase64, validity, [~j v ~j v e v f v g v ~g v i v e, ~j v e v e v ~j v i v g v ~g, ~i v ~h v ~d v ~d v ~i v e, ~i v i v e v b v ~d v ~j, ~h v ~g v ~c v ~c v a v c v b v i v ~i v g, ~h v c v ~c v ~a v i, ~h v j v ~h v ~f v a, ~g v f v g, ~g v j v ~e v ~e v d, ~f v ~e v d v e, ~f v ~b v g v h v ~c v ~i v b v d v ~f, ~f v f v d v ~a, ~f v g v ~a v ~d v ~b v ~g, ~f v i v ~i v f v ~e v j, ~e v ~c v ~h, ~e v ~b v h v ~b v ~c v g v ~h v ~b, ~d v ~h v d v ~e, ~c v ~d v ~e v ~a v d v f v ~h v i, ~c v ~d v e v ~c v b v i v ~c v ~j v i v f, ~c v g v a v ~b, ~a v ~g v h v ~j v ~b v ~d v ~d v ~f v ~j v a, ~a v ~d v a v ~a v ~d v f v ~j v ~d, a v ~g v ~d v ~a v ~f v ~a, a v i v ~a v ~d v ~d v ~c v ~e v ~c v ~d, a v i v b v e v ~a v e, b v ~d v f v j v ~f v g v e v ~h, b v a v a v h v ~f, b v g v ~c v ~c v a v c v c, b v i v d, c v ~f v ~e v f v ~i v j, c v c v ~e v d v c v ~j v ~i, d v ~a v i v d v ~h v ~f v g v f v j, d v g v a v e v ~i v g, d v j v j v ~c, e v ~b v c v j v ~j v h v ~h v ~h v ~h v f, e v b v d v ~f v c, e v d v ~j v ~g v ~d v g, e v j v ~b v ~e v ~f v ~h v e v ~c v ~a v ~f, f v e v h v b v g v ~i v ~a v a v ~f, g v ~i v h v ~h, g v ~e v ~j v ~b v f v a v ~c v ~j v a v d, g v a v ~b v a v ~h, h v ~g v ~e v ~a v ~c v h v ~h v ~i v e, h v ~e v b v d v h v ~i v ~h, h v b v h v d v ~e v ~e v ~h v j, h v i v a v ~i v b v a, i v a v i v f, i v f v ~j, j v ~c v e v g, j v ~a v a v j v ~f v g], 2000, count(341)).
tests(big_testcase65, validity, [~i v ~j v h v ~f v ~c v ~f, ~i v ~g v a v g v ~b v d v ~b v j v j v ~f, ~i v ~c v a v ~j v ~b v e v ~c v ~g v ~d v ~a, ~i v ~c v h v ~h v ~b v ~g v ~j v ~e, ~i v ~a v ~d v i v h v e v e v ~j v j v ~i, ~i v d v c v ~d v i v h v ~a v h, ~h v e v ~a v i v f v i v ~c, ~h v f v ~g v ~i v ~a v f v e v f v ~j, ~g v ~d v ~f v a v a v ~f v g v ~j, ~g v ~d v e v ~b, ~g v b v b v ~i v ~e v ~c v ~h, ~g v d v j v ~c v ~a v b, ~f v a v ~j v b v g v i v ~i v ~j v ~h v ~a, ~f v g v d v ~i v ~c v g, ~e v ~b v ~b v e v b v ~a v ~e v f, ~e v h v f v ~f v a, ~d v ~h v d v ~j v ~d v ~d v ~b, ~c v ~j v b v ~h v c v ~h v a v ~g v ~e v e, ~c v ~i v c v ~i v b v j v d, ~c v ~g v ~e v ~f v ~f v ~b v h v a, ~c v ~g v ~b v ~a v ~j v ~h v d v j v ~i v a, ~c v ~g v j v ~c, ~c v ~b v c v ~h, ~c v f v ~b v ~g v f v ~f v i v ~f v c v a, ~b v ~e v ~d v ~h, ~b v a v ~i v f v h, ~b v e v ~a v e v i v ~b v d v a v c, ~a v ~c v ~j v ~g v ~c v ~c, a v b v h v ~a v h v ~i v ~j v ~b v c, a v i v b v b v ~a v f, b v ~h v b, b v g v b v ~j v ~a, c v ~e v j v b, c v h v c v d, d v ~a v ~j v ~d v ~j v ~b, d v ~a v ~g v ~g v ~a v f v ~c v ~f v ~j v ~f, d v g v b v f v ~j v ~i v a, e v ~e v ~f v ~g v ~f v a v ~b v d v c v ~f, e v b v c v i, e v c v g, e v e v ~f v ~f v c v d v ~b, g v ~a v j v ~h v ~j v ~i v ~h, g v b v ~c v d v ~j v ~c v h v ~d v ~f v ~g, g v f v i v f v ~i v ~e v ~g v ~e, h v e v ~e v ~e v j v ~d, h v h v ~e v ~j v g v g v f, i v ~f v ~e v ~j v e, i v ~d v d v d v a v c v ~i v d v g, i v a v j v c v ~c v h v e v ~a v ~i, j v ~f v c v j v ~b v e], 2000, count(215)).
tests(big_testcase66, validity, [~j v b v ~j v c v i v ~i v g v ~b v b, ~j v g v f v a v h v d v ~i v ~b, ~i v ~f v ~d v ~e v h v ~f v i, ~i v h v a v a v e v ~f v j v d v ~h v j, ~g v ~c v ~j v c v ~i v ~b, ~g v d v ~a v ~h v e v a v b v a, ~f v ~f v ~c v ~a v ~j v ~b v d v ~c v ~c, ~f v ~c v g v ~g v f v c v ~b v c, ~f v ~c v j v a v d v j, ~f v g v ~c v ~i, ~e v ~g v ~f v ~c v ~e v b v ~h v c, ~e v d v i, ~e v e v g v ~b v b v j, ~e v j v i v ~g v ~b v e v f v g, ~d v ~f v d, ~c v ~h v i v ~c v g v ~h v a, ~c v ~f v ~b v a v f v ~c v ~g v ~h, ~c v ~f v f v ~i v f v f v ~f v ~f, ~c v ~e v a v ~f v a v d v ~e v g v ~b v ~e, ~c v j v d v ~c v ~j v a v ~c, ~b v ~d v ~e v ~b v e v ~d v ~i v i v ~g v ~d, ~b v ~c v a v i v c, ~b v e v ~e v ~e v j v j v ~h v ~b v ~i, ~a v ~d v c v h v ~j v ~h, ~a v ~a v ~c v ~b v ~d, ~a v e v h v e v ~f v h v i v ~c v ~d, ~a v g v ~d v ~b v f v b v ~c, ~a v i v ~h v j v j v ~d v ~d v d v i, a v ~a v ~g v d v ~h v b v d v h, b v ~a v f v c v ~h v ~a, b v h v ~i v ~j v a v e v ~f v h, b v h v a v i v a v ~j v j v ~j v ~j, c v ~c v ~a v ~c v j, c v b v g v ~e v ~a v f, d v ~f v b v i v e v i v d v c v c v b, d v h v d v i v ~e v h v j v ~a, e v ~d v e v ~g, e v ~c v h v d v c v ~e v f, e v d v b, g v ~h v c v a v f v ~f, g v a v b v j v ~b v e, h v a v j v ~a v ~c v f v a v c, h v c v d v c v i v b, h v i v ~e v a, h v i v e v ~d, i v ~i v ~a v b, i v ~f v ~d v e v ~a v a v f, i v ~b v ~c v ~e v c v c v ~e v ~d v a, j v a v ~i v a v g v b v ~d v ~j v ~d, j v j v e v h v g v ~c v ~g v a], 2000, count(420)).
tests(big_testcase67, validity, [~i v ~i v i v f v ~a v a v ~j v g v ~f, ~i v ~d v ~j v i v ~j v j v h v ~c, ~i v ~d v ~a v ~c v j v ~e v a v ~j, ~i v ~b v ~a v b v c v e v c v ~h, ~i v h v ~h v ~f v j v e v ~j v i v g, ~h v ~h v h v ~i v ~g v h v h v ~j, ~h v ~g v e v e v ~h v f v h v ~i v a, ~h v c v b v ~i v c, ~h v d v ~f v i v f v f v ~d v f v i v c, ~h v j v ~c v ~g v h v ~b v b, ~g v ~j v e v e v ~f v ~i, ~g v ~c v ~f v j v ~j v b, ~g v ~a v ~d, ~f v ~i v ~g v ~g v d v h v c v ~d v a, ~f v ~g v ~d v ~b v ~b v f v ~j v ~d v a v h, ~f v ~d v ~g v ~c v c v ~h v i v e v ~c, ~f v a v i v ~e v e v j v ~j v ~b v b, ~e v ~h v ~g v ~f v ~h v j v ~c v j, ~e v b v e v ~c v ~g v ~a v g, ~e v i v b, ~d v ~c v d v ~i v ~b v e v c, ~d v h v ~j, ~d v i v d, ~a v d v h v ~a v h v ~i v ~f v e v ~c, ~a v g v b v c v d, ~a v j v ~h v e v e v d v ~j v h v ~a, a v b v ~c, a v h v ~e v h, b v ~h v ~d v ~e v ~h, b v ~b v ~g v ~b, b v d v f, b v e v ~c v a, b v e v c v j v ~d v ~e v f, c v ~f v ~f v ~b v d v a v b v ~c v ~i, c v b v ~d v i v ~a v ~a v ~g, c v c v b v ~e v d v ~b v ~h v ~i, d v ~b v h v h v a v ~c, d v f v f v i v a v g, d v j v b v ~b v ~f v f v a v ~g v j, e v ~f v b v a v j v e v g v ~j, e v ~e v c v ~g, f v ~f v ~f v c v b v c v f v h, g v a v d v ~a v ~f v j v ~c v h v e, g v j v ~d, h v a v ~j v ~j v i, h v g v ~g v ~d v e v c v ~d v j v ~d v c, h v g v h v i v b v ~h v ~i, j v ~h v ~d v ~d v e, j v a v a v e, j v f v ~g v ~c v i v i v ~e v ~d v ~g], 2000, count(249)).
tests(big_testcase68, validity, [~j v ~g v ~c, ~j v ~d v ~a v ~a v f v ~h v j v b, ~j v a v ~g v ~a v ~j v b v ~d v j v ~b v ~a, ~j v d v ~j v d v g v ~f v j v ~j, ~i v ~f v j v j v b v b v d v ~d v ~f, ~i v ~e v ~g v ~d, ~i v d v i v i v e, ~i v f v e v ~i, ~h v ~g v j v g v j, ~h v h v g v ~g v c v e, ~g v ~e v ~g v ~b v i v c v ~g v d, ~g v ~b v g v ~c v i v ~e, ~e v c v ~b v ~e v ~f v ~j v f, ~e v i v j v ~e v f v ~d v a v ~e v c, ~d v ~g v ~c v ~f v c v h v ~d v ~f v ~h v d, ~d v ~g v g, ~d v ~d v ~a v b v g, ~d v ~d v d, ~c v ~h v ~j v ~a v ~g v g v ~j v ~d v i, ~a v ~c v ~d v ~j v j v f v j, ~a v ~b v g v ~b v ~b v j, ~a v b v ~g v i v h v ~a v j v ~d v g v ~c, ~a v j v ~a v ~e v h v j v g, a v ~j v d v ~d v g v g v e, a v ~i v ~h v ~i v ~a v ~b v f v g v d v e, a v b v e v ~e v g, a v d v c v ~e v e v g v ~h v ~i, a v e v c, b v b v j v ~f v ~d v ~g v b v ~c v ~d v ~f, c v ~j v ~e v d v i, c v ~c v a v d v c, c v ~b v ~j v g v h v i v ~b v ~c v i, d v ~g v e, d v ~f v ~i v d v ~h, d v e v ~j v ~d v ~e v ~c v b v h v d v b, e v ~h v e v ~d v h v ~h v a v d v ~b v h, e v b v ~g v e v ~h, f v ~h v ~b, f v ~h v e, f v ~e v c v f v c v ~e v a, f v ~d v d v ~g, f v f v ~f v ~c v b v a v ~h, g v ~j v ~g, h v j v ~g v h, i v ~d v ~j v ~b v b v ~a, j v ~j v ~a v h v g v b v d v b v d v b, j v ~d v ~g v ~h v ~f v g v ~i, j v ~d v i v ~d v ~e v e, j v d v g v g, j v g v ~j v e v g v ~g v d v ~j v h v ~a], 2000, count(194)).
tests(big_testcase69, validity, [~j v ~d v ~d v ~i v ~h v g, ~j v ~d v d v d v ~g v ~j, ~j v b v ~f v i, ~i v ~j v ~a, ~i v ~c v e, ~h v ~h v g v g v ~h, ~h v ~g v b v e, ~h v ~f v c v b v ~g v b v ~d v g v ~a, ~h v f v ~b v ~g v ~f v b v ~h v ~g, ~g v ~g v ~j v ~f v a v ~a, ~g v ~g v ~h v g v f v g v i v ~b v g, ~g v i v j v a v ~i v ~j v j v i v ~b v e, ~g v j v h v ~i v c v a, ~f v ~i v ~b v ~g v ~g v ~h v ~b v i, ~e v ~h v b v ~b v b, ~e v d v c v c v ~h v ~h v e, ~d v ~j v ~b v ~e v ~d, ~d v f v ~i v a v ~c v f v c, ~c v ~b v ~a v j v g v ~i, ~c v f v j v ~f v c v j, ~b v ~h v ~a, ~b v ~b v j v d, ~a v ~b v ~f v ~f v ~j, b v ~j v ~h v i v d v ~j v c v ~b v ~f v d, b v ~f v ~d v ~f v a v g v f v ~i v j v d, b v c v f v f v ~a v e v ~c, c v ~j v j v j v d v g, c v ~f v a v ~c v h, d v e v ~h v ~a, e v ~i v ~e v ~g v ~g v ~a v c v e, e v ~e v e, e v a v c v h v e v ~g, e v b v a v b v h v ~h v ~e v ~g v g v ~b, e v d v ~f v ~a v ~j v ~b v a, f v ~g v e v h v ~a v ~j v ~f v ~i v ~j, f v a v ~i, f v j v g v i v ~i v b v ~i v ~j, g v ~f v a v d v g v ~j, g v ~e v ~i v ~c v ~j v ~g v d v ~a, g v ~e v ~d v ~c v i, h v ~a v ~b, h v e v h v ~g v f, i v ~h v b v ~g v i v a v ~i, i v ~d v ~g v ~f v g v i v ~e v ~h v h v e, i v f v ~a v ~b v e v f, i v i v h v ~j v e v ~b v ~d v ~c v ~h, j v ~j v g, j v ~g v ~e v f v f, j v ~e v b v e v e, j v j v ~b], 2000, count(158)).
tests(big_testcase70, validity, [~j v ~d v ~j v ~i v b v i v i v f v ~j v b, ~j v d v d v ~a, ~j v g v e v c v d v ~g v j, ~j v j v c v i v e, ~i v f v i v ~i v d v d v ~j v c, ~i v h v f v d v a, ~h v ~c v g v g v j v h v d v ~f v e, ~h v i v ~e v ~b v e v i v ~h v a, ~g v ~d v a v g v ~j v ~b v ~g, ~g v a v ~j v ~a v ~g v ~h v i v j, ~g v h v ~j v g v ~e, ~f v ~f v e, ~f v i v ~c v ~h v ~d v f v i v ~h, ~e v ~e v g v j v ~c v ~j v b v ~i, ~e v ~a v d v ~g v b, ~c v ~i v ~i v ~a v f v ~j v e v i v g v h, ~c v ~d v ~g v ~g v ~d v d v h v e v ~a, ~c v c v ~g v ~c v d v ~e v ~i, ~c v i v ~h v ~d, ~c v i v ~b v ~i v c, ~b v ~f v h v ~d v ~f v ~c, ~b v ~e v ~i v b v ~b v c v ~f v g v ~d v b, ~b v a v ~e v ~a, ~a v ~a v c v g, ~a v b v ~a v ~a v ~a v i v ~f v d v ~h v a, a v ~i v ~j v d v ~f v c v f v h v ~a v ~f, a v ~c v c, b v ~j v f v ~g, b v ~b v ~j v g v ~j v c v ~b v j, b v b v a, b v d v a v ~i, c v e v f v i v ~i v b v b v a v ~h v a, c v h v ~c v f v ~e v ~h, c v i v b v c v ~a v d v ~e v f v i v ~a, d v ~b v ~c v ~f v ~g v ~h, e v ~e v ~c v ~c v ~i, e v a v h v ~h v c v ~d v ~g, e v h v e v b v b v ~i v i, e v i v ~e v ~j v ~b, f v ~e v b, f v ~e v d v ~g v f v ~g v ~d v ~b v ~i v ~e, f v c v ~e v ~f, f v c v i v d v ~g v g, f v d v f v f v g, g v ~h v b v b v c v ~b, g v ~d v g, h v ~b v g v ~e v ~j v ~f v ~a v ~d v ~c v ~d, h v j v c v a v ~c, j v ~h v f v i v f v g, j v f v ~h v ~a], 2000, count(166)).
tests(big_testcase71, validity, [~j v g v ~d v c, ~i v ~i v i v f v i, ~i v ~e v ~d v h v i v a, ~h v h v ~c v ~j v d, ~g v ~d v ~g, ~g v d v ~d v f v e v ~f v f v g v i v d, ~g v f v ~e v ~c v ~d, ~g v j v ~g v ~b v ~h v h v e v f v i, ~f v ~i v a v ~d v b v b v ~b v ~c, ~f v d v g v d v ~g v c v h v j v ~b, ~e v ~i v g v e v e v b v ~g v ~j v ~a v ~d, ~e v ~d v ~b, ~d v ~j v ~j v ~e v e v ~g, ~d v ~b v ~h v ~d v c, ~d v f v d v e v a v ~d v ~h v ~a v b, ~d v h v ~j, ~d v j v ~c v ~h v c v h v c v ~h, ~c v ~h v a v i v e v e v i v ~g v ~b v i, ~c v b v ~j v ~a v ~j, a v ~h v ~f v ~b v b v h v ~i v d v ~c, b v ~f v ~g v j v ~g v e v h v ~d v ~c, b v a v g v b v i v ~b v c v b v g, c v ~g v ~f v ~b v i, c v ~f v ~a v ~i v ~h v ~h v d v ~a v ~j v ~i, c v a v h v ~j v ~g v c v ~i v e v ~g v ~f, c v a v i v a v ~f, c v i v h v ~c, d v ~f v ~j, d v ~c v g v ~c v ~i v b v e v g, d v f v ~c v ~h v ~a v f, e v ~g v a v ~f, e v ~g v g, e v ~e v ~i v ~i v e, e v e v c v i, e v j v ~j, f v ~g v b v d v ~e, f v ~e v ~a v ~h v ~d v f v ~a v ~b, f v ~d v ~g v ~d v ~c v ~h v ~d v i v e, f v ~a v d v g v ~e v i v ~a v ~d, f v d v ~c, f v i v ~f v c v ~c v a v ~j v b v b v h, g v a v ~c v ~i v ~b v g, g v f v b v ~d v ~h v ~h v b v ~i v ~h v d, g v i v d v a v ~e v b v ~i v ~f, h v c v ~j v h v ~h v h, h v g v ~j, i v ~e v i v ~b v c v ~b v j v ~i v ~d v g, i v e v ~e v d v b v g v ~i, i v g v b, j v ~e v h v h v ~g v ~c v ~h v f v ~h], 2000, count(192)).
tests(big_testcase72, validity, [~j v d v ~g v e, ~i v j v g, ~h v ~h v ~f, ~h v ~b v ~e, ~h v b v ~f v e v d, ~h v d v e v i v g, ~g v ~j v b v ~e v e v d v ~b v ~i v ~j v c, ~g v ~h v c v ~i v ~i, ~g v ~g v e v ~d, ~g v i v d, ~f v ~i v d v h v ~d v ~h v ~e v d v d v j, ~f v ~g v g v ~e v j v c v ~g v d v ~c, ~f v a v e v b v c v e v ~e v ~h, ~e v ~i v ~f, ~e v ~c v ~b v ~b v ~c v b v ~f v ~g, ~e v b v c v ~d, ~e v j v g v c v a v j v ~b v d v e, ~d v f v b v j v ~c v ~e v d v h v ~b v ~a, ~c v ~h v b v ~f v c v ~b v ~b, ~c v j v h v ~g v ~f v ~b v c v ~i v j, ~b v b v c v j, ~b v c v ~h v j v d v ~b v ~c v i, ~a v ~e v ~d v c v i v ~f, ~a v c v ~e v ~j v ~c v ~h v b v j, ~a v d v h v ~j v ~g v ~b v ~e v c v ~f v d, a v ~i v ~f v b v i v ~e v b v ~a v d v a, a v ~d v ~a v ~j v b v ~j, a v a v d v ~h v c v ~j v ~j v ~g v i, b v ~j v ~i v e v f, b v ~g v ~h v ~a, b v a v a v i v ~g v ~j v ~b v ~g v ~h, b v f v ~h v f v ~d v i v ~h v g v j v d, c v e v ~f v h v ~e v j v ~b v i v ~a, c v i v c v ~d v e v ~h, d v ~h v h v b v ~b, d v ~f v ~i v j v ~h v c, d v ~c v ~d v i, e v ~i v ~b, e v ~h v ~e v h v h v h v ~g, e v ~f v ~h v b v ~c v ~h v g, e v ~c v h v j v g v ~e v ~b v ~j v ~g, e v e v ~d v e v ~a v e v ~d v g v d, e v h v ~i v ~j v g v c, f v h v c v ~g, g v ~d v b v h v ~i v ~f v h v g v ~d v ~a, g v h v f v h, h v ~f v g v ~c v ~e v d, h v c v ~a, j v ~j v ~g v i v e v i, j v ~b v ~g v ~f v ~i v b], 2000, count(113)).
tests(big_testcase73, validity, [~j v ~e v ~f v ~h v d v g v ~j v a v e, ~j v ~a v c v ~g v ~e v f, ~j v e v ~e v ~j v d, ~i v ~g v ~b v ~d v j v ~f v h v c v ~e, ~i v h v e v ~a v ~g v h v b v ~c, ~h v ~g v ~c v ~g v d, ~h v ~g v h v ~d v ~c v d v a v ~e v j v d, ~h v ~b v ~f v ~c v d v ~j, ~h v ~a v h v ~i v d v b v h v i, ~h v b v ~e, ~g v ~i v g v a, ~g v ~c v i v b v g, ~f v ~c v i v d v h, ~e v ~h v a v d v d v ~d v i v j v i, ~e v g v d v ~a, ~d v ~b v ~d, ~d v i v d v h v ~j, ~c v ~c v g v d v ~b v b v ~g v ~h v ~i v ~d, ~c v d v ~i v ~i, ~c v f v ~j v ~h, ~c v i v i v e, ~b v b v ~h, ~a v ~i v c v ~c v ~j v ~g v d v j v ~b v ~e, a v c v f v ~d v ~f v c v b v a v ~e, a v f v ~e v ~b v ~b v h v ~a v g, a v i v ~g v ~h v ~c v d v h, b v ~h v g v c v ~d v ~b v j v c v b v c, b v ~g v f v c v c v f v ~j v c, b v ~e v ~c, b v ~d v h v ~h v e, b v ~c v i, b v ~c v j v d, b v ~b v c v g v ~g v d, c v ~g v ~e v ~d, c v a v ~a v a v g v h v ~e v g v g, c v e v ~h v f v ~j v ~e v ~f v ~g v ~j, d v ~b v ~i, d v a v b v ~a v h v ~g v c v h v ~i v j, f v ~b v ~f v a, g v ~f v ~e v ~j v ~d, g v a v ~g v ~c v a, g v a v ~d v h v d v ~b v ~g, g v c v h v c v ~e v a v ~a v ~e v j v c, h v c v ~f v ~j v i, i v ~h v ~f v ~g v ~g v ~j v ~b v g v a, i v ~e v b v b v j v ~f v ~c v ~b v b, i v ~b v d v a v c v ~b v ~c v ~a v ~i, i v e v ~g v c, j v ~i v g v d v h, j v ~b v ~g v i v g v ~c v ~c], 2000, count(172)).
tests(big_testcase74, validity, [~j v ~h v ~d v ~a, ~i v ~c v g v ~j v e v f v ~g v ~j, ~i v j v ~b v h v ~d v ~d, ~h v ~b v ~h, ~g v ~g v ~i v ~g v j v ~g, ~f v ~j v ~i v ~g, ~f v ~f v ~g v ~e v ~h v ~j, ~f v g v h v ~j, ~f v i v ~f v i v ~e v ~b, ~d v ~i v ~h v e v f v ~d v ~j v c v b v ~i, ~d v a v ~c v ~d v ~d v ~e v ~c v ~c, ~d v d v a v h v ~d v i v ~f v e, ~d v d v h v ~d v ~i v ~d v ~i, ~d v f v ~i v e v ~c v ~i v j v ~h v ~c v d, ~d v f v j, ~c v ~i v j v ~c v ~h v f v h v b v ~h, ~c v a v ~g v f v ~b v ~a v ~h, ~c v c v ~h v d, ~b v ~e v ~h, ~b v ~e v c v ~f, ~b v b v i v a v d v h v i v ~e, ~b v e v g v h v ~j v a v ~j, ~b v f v ~d v h v e v b v e v ~i v j v ~d, a v ~b v g v e v j v e v ~i v f, a v e v f v j v ~d v ~d v i, b v ~g v ~h v d, d v ~h v ~a v ~e v ~a, e v ~j v ~a v ~g v d v ~g, f v ~h v d v c v ~d v g v h v ~a v j, f v ~f v ~j v g v h v c v a v j v ~b, f v ~e v ~h, f v a v ~c v c v j v ~h, f v b v ~a v i v i v j v ~f v ~f v j, f v e v i v i v ~j v g v a v f v ~i v e, f v g v ~b v h v ~g v ~b v e v b v b, g v ~b v e v ~a v ~i v ~i, g v e v ~d v j, g v g v ~g v ~e v ~g v ~g, g v i v ~j v ~h v d v ~f v ~d, h v ~c v e, h v d v ~b v h v i v ~h, h v d v i v h v i v ~b v f v j, h v h v h v i v c v a v h v f, i v i v h v h v ~b v ~g v ~j, j v ~f v ~g v ~g v g v b v a v b v e v ~j, j v ~e v ~i v a v g v ~d v ~g, j v ~e v ~g v d, j v ~d v ~j v ~a, j v a v ~c v ~h, j v c v ~i v f v ~i v a v ~i v d], 2000, count(173)).
tests(big_testcase75, validity, [~j v ~b v ~j v ~i v ~b v ~c v b v i v g v a, ~j v ~a v h v ~a v j, ~j v i v f v ~j, ~i v g v j v ~c, ~h v ~j v f v ~a v a v f v ~h, ~h v f v j v a v ~f v ~e v ~d v h v j, ~h v g v ~d v i v ~g v ~a v ~g v ~b, ~g v ~i v a v ~g v ~c v d v f v h v ~c, ~g v ~f v c v c v ~f v f, ~g v a v e v ~g, ~g v j v a v h v ~a v h, ~f v ~i v ~c v ~h v d, ~f v f v a v f v b v ~j v a v ~a v j, ~f v f v j v g v ~f v ~b v d v ~a v b, ~e v h v h v ~a v d v j v ~g v i, ~d v ~i v ~b v h, ~d v d v f v f v ~b v h v ~c, ~d v f v f v b v c, ~c v ~a v ~f v ~e v e v ~c v f v ~h v f, ~c v b v ~d v ~c, ~b v a v a v g, ~b v b v ~c v ~c v a v g v ~c v j v f, ~b v d v ~d v c v ~f v e v f v ~h v ~b v c, ~b v d v g v ~h v d v j v ~d v ~a, ~b v h v ~c v ~b v ~a v d v ~e v ~b, ~a v ~i v ~b, ~a v ~d v ~a v ~a, ~a v j v ~d v d v a v j v i v j v ~h v ~f, b v ~j v e v c v j v j v ~f v b, b v ~d v c, b v d v e, c v a v ~c v ~g v ~b v ~c v ~a v b, d v f v ~h v ~i, e v ~h v ~a v d v ~b v ~f v ~h v ~j, e v ~e v d v ~f v ~c, e v ~c v ~j, e v d v a v a v d v d v h v ~i, e v f v ~b v d v e v ~b v ~i v b v ~c, e v f v h v i v ~j v ~f v ~f v ~c v j v c, f v ~b v a, g v ~j v ~g v e, g v b v ~h v e v g v ~b, g v j v ~j v ~e, h v a v a v ~f v ~j v ~i v ~e, h v g v g v h v f v ~i v ~f v ~f v d, i v ~i v f v j v c v ~g v c v c v ~h v e, j v ~g v e v d v ~e v ~e v ~j v ~f, j v ~e v ~i, j v h v ~j v ~g v ~e v ~g v ~g v h v ~a v j, j v h v ~d v b], 2000, count(112)).
tests(big_testcase76, validity, [~j v ~i v ~e v f, ~j v ~e v a v i v h v b v ~i v c v ~c, ~j v i v h v ~j v a v ~f v f, ~i v i v d v g v d v ~j v ~c v g v ~h, ~h v ~f v c v a v c v ~b v ~f v f v c v f, ~h v ~c v j v a, ~h v ~a v ~h v g v ~a v ~f v ~c v ~e v ~j, ~h v f v b v e v f v ~j v g v b v ~a v g, ~h v h v e v ~i v d v ~d v h v ~e v f v h, ~g v ~j v ~h v ~j v b v ~i v ~h v ~c v ~j v b, ~g v ~f v ~d, ~g v ~b v d v g v ~b v f v ~d v j, ~f v ~j v i v ~e, ~f v ~i v ~f, ~f v c v g v c, ~e v ~a v ~j v e, ~e v a v d, ~e v b v ~j v ~g v ~i v ~i v ~e v ~b, ~e v e v f v ~j v ~h v ~f, ~d v f v ~b v ~g v ~i v j v ~g v b, ~c v f v j v ~f v h v b v j, ~c v i v ~c v ~f, ~b v ~g v g v ~f v ~c v ~i v c v b, ~b v d v ~d v c v ~j v ~c v ~f v h v f v ~a, ~b v g v g v f, ~b v i v ~h v ~j, ~a v c v ~a v i, ~a v c v a v ~a v ~h v j v h v d, ~a v h v ~j v i v c v ~a v ~d v ~e v i v i, a v g v j v ~e v ~d v ~i v ~b v h v ~i, b v ~c v ~h v ~f v ~b v ~g, b v g v ~a v ~a v ~i, b v h v ~i v ~d, b v j v ~b v j v i v e v h v ~g, c v f v ~i v g v f, c v h v d v ~j v ~f v f v b, d v ~f v c v a v ~h, d v ~b v a v ~b v j v e v c, d v ~a v b v f v ~b v g v e v ~b, f v ~d v ~c v ~e v ~b, f v a v a v ~e v j v a v e v e v ~e, g v ~j v i v ~a v ~c v f v ~b, h v c v ~f, h v e v f v ~h v a v ~a v ~f v e v ~j, h v f v ~b v ~b v ~g v ~g, i v ~d v ~e v ~b v ~i v ~e v g v f v ~j, i v e v ~a v ~j v b v ~f v c v i v e, j v b v d v ~d v b v ~c v ~f, j v d v f v ~f v ~h v a v c v i v g v ~i, j v j v j v ~e v a v ~e], 2000, count(114)).
tests(big_testcase77, validity, [~j v ~h v h v ~b v h v ~c v b v ~e v a v c, ~j v e v ~e v h, ~i v ~j v b v f v ~e, ~i v ~f v ~d v b v h v j, ~h v e v i v g v ~a v b v h v ~a v i v h, ~h v f v ~g, ~f v ~h v b, ~f v ~h v f, ~f v ~e v h v ~b v b v ~e v e v d, ~e v ~e v a v j v ~c v ~a v i v h v e, ~e v ~c v ~e v g v b, ~e v d v a v h, ~e v h v e v j v ~j, ~d v ~f v ~d v ~a v g v ~i v ~e v a, ~d v e v ~a v e, ~c v ~h v a, ~b v ~h v ~h v i, ~b v ~b v b v ~e v ~d v h, ~b v c v i v ~f, ~a v ~h v ~e v e v ~f v b v ~c v ~a v e, ~a v f v ~d v ~d v h, a v j v h, b v ~h v j, b v ~e v ~j v ~a v f v ~b v ~b, b v ~c v c v g v e v ~h, b v j v ~j v b v b v d v j v i v j, c v ~h v ~i v h v f v ~j, c v f v ~i v ~i v d, d v ~d v g v e v g v h, d v f v g v ~h, d v h v b v g v ~d v d v c v ~f v ~c, d v i v b v ~a v j v h v ~d v ~a v ~a, d v j v ~e v ~j v ~f v ~b v ~c v ~a v ~c, e v ~i v i v ~f v g v d v ~d, e v ~g v j v ~f v h v ~g v f, f v ~i v a v ~b v c v ~f v d v ~f v ~g, f v ~a v ~g v b, f v b v ~i v f v ~h v ~j, f v e v ~f v j v d v ~f, g v ~f v ~a v g v g v ~b, g v ~d v ~g v j v ~i v ~h v ~a v j v d, g v c v h, g v d v ~h v ~a v ~b v ~b v d v ~h v d v ~h, g v d v ~e v ~d v c, h v ~i v ~f, h v a v j v ~a v ~d v c v ~a v e v c, h v f v e, i v ~g v ~g, j v ~a v j, j v i v ~h v b v i v ~i], 2000, count(44)).
tests(big_testcase78, validity, [~j v ~f v d v e v ~b v d v i v h, ~j v j v a v e v ~i, ~i v ~j v ~h v b v ~i v g v c v h, ~i v ~g v ~g v d v ~i v ~f, ~i v ~d v ~i v f v ~f v j v ~j, ~i v f v ~b, ~h v ~g v ~i v h v ~e v ~i, ~h v ~g v ~h v a v f, ~g v ~f v c v ~b v e v ~g v ~e v ~b, ~g v ~d v ~a v a v b v h v a v d v c v h, ~g v b v c v ~g v g v e v b v ~i v b, ~f v ~g v ~d v ~j v ~g v g v ~c v ~c, ~f v ~b v h v ~h v ~i v f v i v j v h, ~f v d v ~c v i v j v ~j v ~j v ~b v b, ~f v f v ~i v ~a, ~e v ~i v c v c v ~g v ~a v h v b v ~a v f, ~e v ~d v b v ~d v i v a v ~i v ~b v i, ~e v a v ~j v i v g v i v a, ~e v a v b v i v ~i v ~a v f v ~d, ~d v ~g v ~g v h v b v g, ~d v ~e v j v ~i v ~h v ~e v a v ~i, ~d v ~c v ~b v c v ~j v ~a v j v ~g v j v ~a, ~c v ~i v ~h v i v ~f v ~c v e, ~c v ~i v ~f v ~c v ~c v ~j, ~c v ~f v ~g v ~g v ~f v a v ~f v g v c, ~c v c v b v ~d v c v h v h v b v g, ~c v f v d v i v c v ~f v b, ~b v c v a v ~g, ~a v a v e, ~a v d v ~i v a v ~d v ~i v i, a v ~e v e v g v ~a, a v f v a v b v i v e, b v ~g v i v ~a v j v j v h v f v g v ~a, b v f v h v a v d, b v g v b v ~d v ~j v f v d v ~h, c v ~i v f v h v i v b v ~e v ~f v i, c v ~c v ~i v e v ~c v ~d v ~a v f v h, c v a v e v ~j v c v ~e v ~a v ~j v h, c v f v h v f, e v j v h v j v ~i v c v i v g, f v ~g v g v d v e v ~b v g v ~i v h, f v ~a v j v d, f v a v b v a v a, g v ~j v c, g v h v c, h v c v c v a v ~i v ~c v j, i v ~g v ~a, i v c v ~c v ~d v a v j, i v g v e, j v ~i v ~c v b v f v a], 2000, count(220)).
tests(big_testcase79, validity, [~j v a v ~i v ~a v ~d v d v h v e, ~i v ~g v ~e v ~c v a v ~c v b v j, ~i v ~e v ~h v d v ~d v f v ~e, ~i v h v ~j, ~h v ~d v ~b v h v f v d v f, ~h v h v ~j, ~g v ~e v ~i v ~a v ~g v ~f v ~f v i v ~e, ~g v ~d v j v ~c v i v d, ~g v ~c v h, ~g v ~a v ~i v ~b v ~i v ~c v e v a v b, ~g v i v ~e v g v ~i v h v ~g v e, ~g v j v ~d v ~j v h v h v ~h v b v ~j, ~f v ~a v ~f v ~b v f v ~d v h v ~g, ~f v d v ~c, ~f v j v ~h v ~c v i v ~c v c v e v d v ~e, ~e v a v ~h, ~e v a v j v a v d v g v ~g v h, ~e v f v ~h v ~h v h v ~g v ~a v ~c, ~e v i v ~j v ~e, ~d v ~j v c v j v e v ~c v f v ~i v ~i, ~d v ~c v i v ~f v a v ~f v ~i v ~i, ~d v ~a v ~h v ~d v h v j v e, ~d v ~a v a, ~d v i v ~h v ~h v ~b v g, ~d v j v ~h, ~d v j v i v d v ~d v ~g v h v a v ~e, ~b v ~b v ~b v h v ~f, ~b v a v b, ~b v a v d v e v ~e, ~a v ~f v ~b, ~a v ~c v ~a v ~c, ~a v h v ~f v ~i v ~b v d, ~a v h v ~d v g, a v ~j v g v e, a v ~f v ~h v f v ~c v ~g v i, a v ~e v ~i v ~f, a v g v j v ~f v a v i v a, c v ~j v g v d v ~f v b v ~h v d, c v ~d v ~b v i v d v i, c v ~c v ~h v ~i v d v b v h v ~g v ~f v ~b, d v ~g v d v h v b v i v ~c v g, d v d v d, e v f v ~b v ~b v h v ~g v ~f v ~a v ~j, e v g v a v ~e v ~d v ~d v ~d v j, f v ~i v ~d v c v d, g v ~f v ~b, g v ~a v ~e v ~h v d v ~j v ~e v d v ~e v f, g v a v ~e v a v ~a v ~i v ~i v ~b v ~i, g v i v ~c, h v h v ~j v ~c v d v ~h v g v ~e v a v j], 2000, count(76)).
tests(big_testcase80, validity, [~j v b v h, ~j v f v h v e v c v a v ~g, ~g v ~i v ~e v f v a v ~j v ~f v d v j v i, ~g v ~e v ~g v ~f v ~j, ~g v ~b v ~c v e v ~i v j v e v ~b, ~f v g v ~f v j v j v f v ~d v g v ~j v e, ~f v g v b v ~e v e v i v ~j v ~j, ~e v ~i v a, ~e v d v ~i v g v ~a v d v b, ~d v ~f v ~g v ~a, ~d v ~a v f v ~c v ~e v i v ~j v ~g v ~f v g, ~d v g v e v h v ~d v ~e, ~c v ~h v ~e v ~c v ~j v b, ~c v ~f v e v j v b v e, ~c v ~d v j v c v ~f v b, ~c v ~c v ~a v ~j v b, ~c v ~c v g v e v d v ~j v ~f, ~b v ~i v ~g v j, ~b v ~g v h v a v ~g, ~b v ~f v g v f v ~a v g v h, ~b v ~f v i v ~f v d v h v ~i v d, ~b v c v ~c v ~f v ~c v b v j v ~i v g v i, ~b v i v d v ~h v j v ~a v i, a v ~j v ~g v ~b v ~g v g v ~g v ~h v ~j, a v ~f v ~j v ~f v j v j v ~c v ~g v ~d v ~c, a v ~e v ~c, a v d v e v ~a v ~b v d v ~g, a v d v f v g v e v ~b v ~i v d v j v ~e, b v ~e v ~g, b v g v g v f v ~c v ~b, d v j v ~g v d v b v ~g v j, e v e v ~g v c v g v e v ~j, f v ~i v h v e v ~c v ~b v h v ~e v ~g, f v e v d v d v e v ~i v g, g v ~g v h v ~a v d v ~e v ~h v b v ~d v d, g v h v ~i v c v ~i v ~e v d v ~i v ~a, h v ~i v ~b, h v ~d v ~c v ~h v j v c v ~e v ~a, h v b v ~i v e v ~d v a v g, h v d v ~b v ~c v ~f, h v f v ~i v a v e v i, i v ~h v ~c v ~i v ~d v ~h v g v ~i v a v b, i v a v i v ~e v c v ~f, i v b v d v ~j v ~a v e v a v d v h v ~j, i v d v ~h v i v i v j v i v c, j v ~j v ~i v ~a v ~g v h, j v ~f v ~b v c v ~j v c v ~f, j v d v ~b, j v e v ~c v a v ~d, j v g v ~j v ~e v i], 2000, count(275)).
tests(big_testcase81, validity, [~j v ~g v a v a, ~j v ~f v b v ~b v ~f v ~h v ~a v c, ~j v ~e v g, ~j v ~b v d v ~a v ~c v j v g v g, ~j v f v ~c v j v c, ~j v i v h v f v ~g, ~h v ~i v h v ~h v ~a v ~h v i v g, ~h v j v ~a, ~g v ~f v ~a v h, ~g v ~a v b v g, ~f v d v ~a v j v i, ~c v ~b v j v ~i v ~d v b v b v ~i v f v h, ~c v e v f v i, ~b v ~f v j v ~j, ~b v ~a v ~j v ~i v ~j, ~a v ~e v ~g, ~a v ~a v c v f, ~a v d v b v ~d v ~b v j v ~a v a v i v c, a v ~j v a, a v f v ~i v ~a v ~g v ~e v c, a v j v g v g, b v ~j v h v j v b v ~b v e v c v c v i, b v ~i v ~i v e v ~c v ~h v ~j v a, b v d v ~c v ~e v ~a v g v b, b v e v d v b v h v ~g v ~c v a v ~f v f, c v ~i v ~j, c v ~a v g, c v c v ~i v ~j v i v ~h v j v b, d v c v ~h v ~e v i v ~f v c v h v g, d v d v b v b v ~f v h v ~i v e v ~d, d v f v f v ~j v b v c v g v ~d v b, d v i v ~i v a v a v ~d v d v ~h v h v j, e v ~d v f v d v g v g v ~a v c v ~d v e, e v ~c v ~i v ~b, e v ~a v ~c v ~b v ~i v ~e v a v j v a v ~i, e v a v ~a v e v f v d v b v ~d v ~g v ~g, f v ~d v f v ~e v ~b v ~e v a v d, f v ~b v b v g v g v ~i v ~d, f v i v ~a, g v ~i v d v d v f v ~c v ~d, g v ~e v c v f v ~a v d v j v f, g v d v j v ~d v e v ~h, h v ~c v a v d v c v g v c v i v i v ~a, h v a v ~h v i v a v ~j v c v ~a v f, h v h v j v a v ~j v b v i, i v f v f v b v f v ~a v ~b v ~c v j v d, i v i v ~a v a v ~e v ~f v ~a v ~c, j v ~j v d v c v ~d v ~a v d, j v ~i v e v d v g v ~e, j v c v g v ~e v b v c], 2000, count(158)).
tests(big_testcase82, validity, [~j v c v ~c v ~b, ~j v h v a v i, ~i v ~h v ~h v e v ~j v e v e v b, ~i v ~g v e v ~g v a v ~f v e v ~d v h v ~h, ~h v ~d v ~g v ~f v ~h, ~h v c v ~b v e v ~b v i v ~i v d v h v ~a, ~h v e v b v e v g v e v e v j, ~h v f v b v ~b v i v h v ~c v ~b, ~h v i v ~a v h v f, ~g v ~c v g v f v i v ~i, ~g v ~a v ~i v ~j, ~g v a v h v ~c v f v ~h, ~g v e v f v ~b v a v d v ~e v c, ~f v ~j v c v d v ~i v ~c v ~h v a v d v ~b, ~f v ~h v ~i v j, ~f v j v ~i v ~d v ~a v ~d v ~g v ~i, ~e v ~h v b v g v a v ~f v ~j v ~h v f, ~d v ~g v c v b v d v i, ~d v ~g v e v b v a, ~d v ~e v ~a v f v f, ~c v ~e v ~b, ~c v h v e v f v b v c, ~b v ~i v ~f v ~i v ~g v g v ~b v ~e v f, ~b v d v ~i v ~a, ~a v ~j v ~j v g v g v ~e v ~g v h, ~a v ~h v ~i v ~b, ~a v e v ~g v ~f v ~b v ~b v ~j, ~a v g v a v ~i v ~c v ~d v ~a, a v a v ~b v ~g, a v i v d v g v ~d, a v j v e v ~b v ~b v ~j v ~d v b, b v c v a v ~c v ~g v ~g v d v f v ~g v ~i, b v f v ~f v b v b v ~j v ~a v ~f v ~g, b v h v ~j, b v j v d v g v d v ~h, d v ~b v ~j v e v ~f v ~b, d v g v g v ~e v j v ~d v ~d v ~b v ~f v ~j, e v ~h v b v h v ~h v d v j v ~i, e v ~d v ~j v ~d v j v ~i v ~c v ~j, e v g v ~g v i v g v e v ~e, f v ~i v d v ~e, f v d v b v ~e v g v ~h v ~a v a v h v e, f v e v ~e, f v e v j, h v ~i v ~f, h v c v e v ~h v a v a v ~g v ~j, i v d v ~h v i v ~h v e v ~i v b v a, i v j v ~e v ~h v ~i v ~d v f v ~g v e, j v ~f v ~b v ~b v j, j v ~e v ~g], 2000, count(171)).
tests(big_testcase83, validity, [~i v ~d v c v ~g v ~b v i v h v ~d v ~h v ~c, ~i v a v c, ~h v ~d v ~f v h v f, ~h v ~d v ~e v ~e v c v ~j v j v ~e v a v j, ~g v d v c, ~f v ~j v j v g v ~g v ~j v b, ~f v ~c v h v f v ~i, ~f v i v ~i v h v d v i v i v ~i v g, ~e v ~d v ~i v h v ~e v a, ~e v ~c v d v ~e v c, ~e v f v ~e v ~e v j, ~d v ~i v g, ~d v ~c v ~c v ~i v b v ~d, ~c v a v h, ~b v ~c v b v j, ~b v b v ~j v d v ~a, ~a v ~g v ~e v ~i v ~j v g v ~b, a v c v ~a v ~c v g v ~f v ~h v ~i v ~b v i, a v i v ~d v ~g v ~d v ~c v b v ~a, a v j v ~c v ~i v j v d v ~c v ~b v c, b v a v e v ~c v ~b v g v ~a v d v a v ~h, b v d v b v d, b v i v ~i v ~f v ~h v b v ~j v ~i v c v b, c v ~j v j v ~c v ~j, c v ~b v h v b, d v ~h v d, d v e v ~d, e v ~b v ~g v ~e v ~f v h v ~h v ~i v ~e, e v ~b v ~a v ~a, e v ~b v e v e v a v d, f v ~j v c, f v ~i v g v ~d v ~c v ~d, f v ~g v ~c v i v ~c v ~e, f v d v a v ~e v ~h v ~f v b v i v a v e, f v i v ~h v b, g v ~h v ~h v h v ~d v ~c v ~b v ~h v ~g, g v ~b v ~e v i v ~f v ~c, g v a v ~d v ~i v d, h v ~h v b v ~b, h v ~g v h, h v h v j v h v e v ~j v d, i v ~j v f, i v ~i v ~b v j v ~d, i v ~h v h v ~f v a v c v j v f v c, i v ~e v ~c v d v ~d v g v ~f v e v c, i v ~d v ~d v ~b v ~h v i v ~e v d v a v f, i v b v g v d v b v ~j v j v ~f v ~i v ~a, i v f v i, i v g v ~j v e v f, i v h v ~h v f v ~a v ~c], 2000, count(96)).
tests(big_testcase84, validity, [~j v b v ~j v ~i v ~f v ~f v ~a v ~j v a v ~d, ~j v e v i v ~h v b, ~h v e v ~j v ~i v j v ~h v ~b v ~b v e v i, ~h v h v g v i v ~c v i, ~h v i v d v ~e, ~g v ~g v a v ~a v ~c v ~e v ~a, ~g v ~b v ~f v ~e v j v ~g v d v ~g, ~g v ~a v f, ~g v g v ~d v ~g v h v e v d v ~c, ~f v ~g v ~h v g v ~i v ~c, ~f v f v ~c v ~d v f, ~e v ~g v i v ~c v b v d v ~e v c, ~e v ~b v ~c v f, ~e v ~a v f v d v ~j v ~c v ~i v ~c v ~g v ~d, ~e v d v i v ~j v e v i v i v h, ~d v ~i v ~e v ~e, ~c v ~d v ~a v ~e, ~b v ~a v ~g v e v d, ~b v e v ~a, ~b v h v ~d v ~c v ~h v ~e v e v c, ~a v ~h v ~i v ~c v ~g v ~d v ~c v i v ~e v c, ~a v ~b v ~i v ~g v ~d v ~h v c v i v b v ~h, b v ~f v c v i v a v ~d, b v e v e v ~d v h, c v ~j v ~g v h v ~d v c v ~b v ~c, c v ~j v d v b v a v e v ~i v i v ~g v ~g, c v g v b, d v d v f v ~i v ~d v f v j v ~g v b, d v g v h v ~e v ~g v ~j v ~f v f v g, e v ~j v ~d v e v h v e v ~a v j v g v i, e v ~h v d v d v b v ~h v i v ~b v d, e v ~d v g v ~f v ~b v a v c v ~e v i, e v a v ~f v ~j v a v ~d v ~a v b v d, e v g v ~a v d, f v ~h v b v ~b v ~d v ~g v j v b, f v ~h v e v ~d v ~e v ~d, g v h v ~i v c v ~a v ~a, g v h v ~a v ~c v g v d, h v ~a v ~b v d v ~f v j v ~i v ~i v j v d, h v a v f, h v b v ~c v ~e v ~a v ~b v ~g v ~h v g, h v h v ~h v i v ~a v j v ~a, h v i v ~d v ~h v b v ~e, i v ~i v ~e v ~j v e v j, i v ~d v h v i v g v ~j v i v g, j v ~h v ~h v ~i v ~i v ~d v ~h v ~a, j v ~f v d, j v ~b v ~h v ~g v d, j v d v f v c v f v ~h, j v f v ~j v ~g v g v ~g v e], 2000, count(213)).
tests(big_testcase85, validity, [~j v ~f v ~h v f v ~g v f v j v f v e, ~j v e v ~a v ~g, ~j v h v a v j v ~a v e v ~b v ~c v j, ~i v ~c v h v f v a v e, ~i v j v f v ~g v ~g v b v h v e, ~h v b v c v ~b v h v d v e v ~j v i v ~a, ~g v ~i v j v f v ~j v c v ~a, ~f v j v ~d v a v ~a v ~j v j v h, ~e v ~b v ~e v ~b v e v b v h v f v c, ~e v c v ~h v ~d, ~e v i v ~e v ~e v d, ~c v i v ~c, ~b v a v ~a v ~c, ~b v c v ~b v ~c v ~h v b v ~f v ~j v d, ~b v c v ~a v ~g v ~i v b v h v h v ~h v d, ~b v i v ~i v ~g v ~j v ~e v ~f, ~a v ~i v d v a, ~a v ~i v f v ~j v ~i v ~a v j v c, ~a v ~g v ~h v ~b, ~a v ~e v ~b v c v c v ~j v ~f v ~e, ~a v ~e v j v ~a v i v ~b v f v h v f, ~a v ~d v b v j v ~h v f v a v ~b, ~a v ~b v ~a v ~e, ~a v i v g v ~e v ~g v g, a v ~j v d v h, a v a v ~c, a v c v ~e v ~b, a v j v ~f v g v c, b v ~d v g v j v ~g, b v a v ~h v i v i v g, c v ~i v ~g v ~f v ~a v f v h, c v ~c v ~d, c v j v ~h v d v ~a v i v ~d v h v ~j, d v ~a v h v j v ~c v ~c v ~f, d v f v b v ~d v c v e v ~d v ~d v f, e v ~e v ~f, e v ~c v ~j v ~j v ~i v b v d v f v i, e v ~a v ~g v ~c v i v ~g v f v ~h, e v b v ~b, e v f v h v ~h v ~j v d v i v ~a v b v ~h, f v b v ~f v j v f, g v ~i v ~i v h v ~j v b v ~f v ~j, g v ~i v e, g v j v h v f, h v ~g v ~b v c v ~f v c v a v a v a v ~f, h v a v ~j v ~j, i v ~c v ~c v ~g v j v b v ~g, i v f v ~d v h v ~g, j v ~b v h v ~j v g, j v e v d v j v ~d], 2000, count(165)).
tests(big_testcase86, validity, [~j v ~c v e v b v ~a v ~h v f v ~b v g, ~j v h v ~e v ~a v e v h v ~e v c v ~e v a, ~i v ~c v j v b v f v c, ~h v g v a v ~b, ~h v j v e v e v a v a, ~g v ~h v ~f v ~f v e v ~h v ~f, ~g v ~f v ~j v c v ~f v i v ~i v f v d, ~g v d v d v j v c v f v ~i v f v i v i, ~g v g v f v b v ~e v d v i v g v c v ~e, ~f v h v f v e v a v ~e v g, ~e v ~j v b v ~j v e v b v ~i v ~c v g, ~e v a v ~c v g v ~c v d v a, ~d v ~i v ~h, ~d v ~c v j v ~b v ~j v ~b v a, ~d v a v ~e v c v c v h v ~i v g v e v c, ~c v ~a v ~b v f v ~a, ~b v ~i v ~b v ~g v e v f v j v ~h, ~b v f v ~g v e v ~f v g, ~b v i v g, ~b v i v g v h v ~b v ~g v d v j v j, ~a v ~h v ~e v c v c v ~d v f v i v b v ~a, ~a v ~f v ~d v ~g v ~g v ~e v ~h, ~a v ~e v ~f v ~i v a v a v ~a v ~i, ~a v j v ~f, a v ~f v ~f v i v i v ~b v d v f v i v ~f, a v ~d v a, b v ~c v h v i v ~j, b v g v d v d v a v c v c v ~g v e v j, c v b v ~e v ~a v ~e, d v ~j v ~a v ~d v h v ~c v ~d v ~c v d v a, d v ~f v e v ~e v j v e v ~i v ~e, d v ~d v a v ~e v f v ~c v d v g, d v c v ~c v i v ~e, d v i v ~g, e v ~j v ~g v ~h v ~a v h v i v ~f v ~g, e v ~e v ~h v a v ~f v ~g v ~i v ~d v f, f v ~i v ~g v i v j v ~g v ~a, f v c v ~a, f v i v ~b v ~c v ~h, f v i v j v ~d v ~j v a v h v ~g, f v j v ~b v i v d, g v ~h v a v j v g, g v ~d v d v d v f v ~j v c v f v ~j, g v a v ~h v ~f v ~j v j v b v f v ~h v ~f, h v ~j v ~h v a v ~e v e v ~c, h v ~i v ~c v d v i, h v ~f v e v i, h v e v j v i, i v f v ~j v ~h v ~a v ~f v e v ~a, j v ~b v i v e v ~e v ~i], 2000, count(178)).
tests(big_testcase87, validity, [~j v ~g v ~e v d, ~j v ~d v d v h v ~i v ~g, ~i v ~f v f v e v ~c v ~d v c, ~i v e v ~d v h v j v ~a v c v a v c, ~i v i v a, ~g v ~e v i v f v d v ~d v e v ~b, ~g v c v d v ~a v ~f v e v d, ~f v ~j v i v ~b v ~f v d v ~g, ~e v ~e v ~a v g v ~i v ~f v ~g v ~h v e, ~e v ~d v j v ~i v h v ~h, ~e v d v c, ~d v ~g v ~b v e v ~d v ~f v ~b, ~c v ~i v j v h v ~c v ~e v j v ~f v ~b v ~j, ~c v b v h, ~b v ~h v ~f v j, ~b v ~e v ~i v i v ~i v ~i v a, ~b v ~a v j, ~b v a v b v ~d v g v a v d v a, ~a v ~d v c, ~a v b v ~h v ~c v d, ~a v h v j v b, a v ~j v ~a v ~c v f v h v i v e v ~c v ~c, a v ~g v ~j v a v f v a v c, b v ~g v ~j v a v f v ~e v f v i v a v d, b v ~a v ~a v a v d v ~a v ~c v ~e v c v e, b v g v i v g v ~a v e v ~d v ~c v e v j, d v ~g v ~d v ~d v b v h v ~j v e v ~c, d v ~f v ~e v b, d v a v ~g v j v h v h v b v i v e v b, e v ~f v ~g v h v f v j v e v f v ~e, e v ~f v b v f v g v ~d v i, e v ~b v ~g v ~f v h, e v e v e v ~f v h, f v ~h v ~i, f v ~g v ~f v ~b v g, f v c v f v ~i v ~j, f v j v ~a v h v ~b v ~h, g v ~j v ~e v j v a v e v d v ~c, h v ~h v ~d v a v h v ~e v ~a v ~d v g v ~f, h v ~a v c v c, h v c v e v ~i v ~c v c v ~i v ~b, h v d v h v ~f v e v ~b v ~e v g v f v ~a, i v b v ~f v ~e v ~h v ~e v d v ~b v b, i v e v h v ~b, i v j v e, j v ~i v ~d v i, j v ~g v ~j v ~f v ~e v a v ~e v c, j v ~f v i v ~c v ~a v ~i v ~j, j v ~b v ~b v ~c v ~c v ~h, j v j v ~j v f v h], 2000, count(223)).
tests(big_testcase88, validity, [~j v ~c v e v d v ~f, ~i v ~a v ~g v ~e v c v ~j v f v ~f v f, ~i v j v ~g v j v d, ~h v ~f v ~f v ~a v ~b, ~h v ~c v ~c v ~f v j v c v ~a v h v ~e v j, ~h v e v ~e v ~g v ~h, ~h v h v ~a v f, ~h v j v ~h v h v ~i, ~g v d v ~g v j v b v i v ~g, ~f v ~j v g v ~d v f v ~b, ~f v ~h v f, ~f v ~g v j v d v d v c v ~i v ~d v h v ~b, ~f v ~c v ~h v d, ~f v ~c v d v ~d v ~e v ~e v j v f v c, ~e v ~j v i v ~i, ~d v ~g v ~j v f v e v e v ~f v g v ~j, ~d v ~a v ~g v c, ~d v ~a v a v f v a, ~c v ~a v d v ~b v ~g, ~c v e v ~j v ~g v h v ~e v e v b v ~d, ~c v e v ~e v ~c v ~d v ~h v ~h v ~c v ~f, ~b v ~h v c v i v ~a v ~f v a v ~a, ~b v e v ~a v j v e v ~g v c v e, ~b v j v f, ~a v ~d v e, ~a v f v ~i v d v g v ~j v h, a v ~f v e v h v c, a v ~d v i v ~b v ~h v ~c v ~d v e v f v ~j, a v ~c v j v f v g, a v ~b v ~e v e v e v g v g v j v ~d v ~j, a v d v ~g v ~d, a v i v ~a v ~g, b v ~d v ~b v b v ~h v ~g v ~d v a v ~i, b v e v f, b v j v h v ~d v g, c v c v c v j v ~h v c v d, c v i v a v a v c v f v j, d v ~c v g v ~a v a v a, d v e v c v b v ~c v d v a v g v ~d, e v h v ~j v a v e, g v ~i v ~i v ~b v ~e v ~d, g v ~e v ~j v c v j, g v ~c v ~h v ~d v ~i, g v ~b v i v f, g v a v ~j, h v a v ~b v b v ~e v ~a v ~g v i v i v ~j, h v a v h v c v h v a v ~f v e, i v ~h v ~a v a, i v g v e v e v h v a v f v d v ~h v ~d, j v ~c v ~d v ~e v ~c v d], 2000, count(272)).
tests(big_testcase89, validity, [~j v ~a v ~e v i, ~i v ~j v g v ~j v ~f v ~g, ~i v ~d v h v ~i, ~i v b v b v b v ~b v d, ~h v ~h v ~h v f v ~f, ~h v ~b v ~a v ~d v ~j, ~h v a v h v b v ~g, ~h v h v ~h v h v f v i, ~g v ~g v a v ~g, ~f v ~e v ~a v ~b v f v i v ~f v g, ~f v b v d v e v ~g v a v ~d v ~j v a, ~f v f v ~j v h v ~f v ~h, ~f v h v ~b v ~c v ~a v g v ~i v ~h, ~d v ~b v a v ~b v c v i, ~d v i v i v h v j v f v b v d v ~b, ~c v ~d v c v i v ~a v j v a v h v d, ~c v g v ~h v ~b v ~j v ~c v g, ~c v g v a v ~h v ~g, ~c v i v e v j v b, ~b v ~i v ~g v h, ~b v ~h v b v g v b, ~b v ~a v ~b v h v h, ~a v ~g v c v ~f v ~b v ~d v d v b, ~a v d v ~f v a v j v d v ~j v d, a v ~a v d, b v ~g v ~b v ~g v f v g v ~j v ~d v c, c v ~a v h v e, d v ~e v ~h v g v ~b v ~h v ~i v h, d v ~a v ~d v j v ~j v c, d v a v ~i v h v ~i v ~j v a v ~e v f, d v j v ~g v e v ~a v ~g, e v ~h v a v g v e v f v ~h v ~c v j v f, e v ~a v j, e v c v ~j v ~e v f v ~b v ~e v ~f, e v c v b v ~i v f v ~i v i v ~j, f v ~d v h v b v ~f v f v ~i, f v e v ~c v c, g v f v ~h v j, h v ~j v f v ~g v ~g v i v e v ~e v c v ~j, h v ~h v ~c v i v c, h v ~e v ~c, h v e v ~e, i v ~e v a v e, i v ~d v g v c v j v i v e v ~g v ~d, i v g v ~i v ~d v j, i v h v ~e, j v ~h v i v c, j v ~g v h v ~f v ~i v ~f, j v b v ~b v i v e v d v h v ~j v f v ~g, j v h v b v ~j], 2000, count(233)).
tests(big_testcase90, validity, [~j v g v j v ~d v j, ~i v ~d v f v a v d v g v i v f, ~i v ~c v ~c v ~e v ~c v d v f v ~a, ~i v ~a v ~h v d, ~i v b v ~g, ~i v h v b v e v ~f v ~a v a v b v ~e v ~g, ~h v ~b v d v c v h v ~i v ~a, ~h v f v d v e v ~b, ~h v h v ~d v d v ~f v ~d v ~g v h v ~j v ~b, ~g v e v g v ~e v ~d, ~g v h v ~e v b v c v c v h v ~g v i, ~g v j v d v b, ~f v d v ~b v i v d v ~a v ~h v ~h, ~f v j v h v ~j v ~e v g v ~a v f v ~c v ~j, ~e v ~e v ~f v ~d v ~e v ~f v ~d v ~j v ~i, ~e v ~d v b, ~e v e v ~a v g v ~e v ~h v ~e v ~e v ~e v f, ~e v i v ~a, ~d v ~i v e v ~f v c v ~j v ~c v ~c, ~d v ~g v f v ~f, ~d v ~a v ~h v b v e v ~a v ~f v ~d v ~h, ~c v ~d v ~h v ~a v ~e v ~b v ~j v ~a, ~c v ~b v c v ~c v f v ~h v f v c v ~j v ~g, ~b v ~e v i v ~d v ~d v ~d, ~a v ~e v a v ~i v i v ~g v ~e, ~a v ~a v b v ~h v g v b v a v ~f, a v ~d v e v a v ~h v ~c, a v ~a v c v ~c v i v ~i v c, a v e v ~h v ~e v a v ~e v ~g v h v i v h, b v ~j v ~c v h v d v d v f v ~j v ~h, b v ~b v h v f v j v ~h v j v a, b v a v d v d v e v h v ~i v ~j, c v ~g v a v ~g, d v ~d v ~d v ~g v ~b v ~g v h v ~c v j, d v b v b v ~d v h v ~a v ~e v j, e v d v ~h v ~i v ~i, e v e v i, e v h v ~i v a v ~e, f v ~g v a v d, f v e v a v ~c v ~c v d, g v ~g v i v ~a v ~c v d, g v c v ~f v ~j v d v a v b v d v ~c v ~e, g v f v ~c v f v h v f v ~f v e, g v f v b v h v ~b v ~g v c, h v f v f v h v h v ~c v ~i v ~j v ~i v b, i v ~d v j v ~h v j v j v a v d, i v ~c v i v i, i v b v b v c, i v c v c v ~e v ~i v ~c v ~f v f v i, j v a v ~a v ~d v ~d v ~b v ~j v f v a], 2000, count(205)).
tests(big_testcase91, validity, [~j v ~e v ~b v ~h v b v b v f v ~c v ~f v h, ~i v ~e v ~i v b v g, ~i v ~d v b v ~d v f v e, ~i v ~b v ~i v ~a v a v ~f v ~a v a v g, ~i v g v ~i v ~d, ~h v ~g v h v ~i v b v ~g v ~e v b v d v h, ~h v ~a v ~h v c v i v ~i v a v j, ~h v a v i v ~c v ~c v ~e, ~h v e v i v e v h, ~g v ~g v ~d v ~i v j v ~d v ~b, ~f v ~j v b v ~h v c v ~j v ~b v ~i v ~b, ~f v ~f v ~b v i v f v i v ~j v c, ~f v ~d v a v b v ~b, ~f v j v g v a, ~e v ~g v ~a v ~a v ~g, ~e v b v a v a v h v b, ~d v h v j v ~h v i v ~e, ~c v ~g v ~g v j v b v c v b, ~c v ~g v f v ~f v b v f, ~c v ~e v ~c v e v ~c v f v ~a, ~c v ~b v ~e v ~e v h v ~a v j v ~j v i, ~c v ~a v h v ~b, ~b v a v ~i v j v c v d v d v ~c v ~j, ~b v g v e v ~a v ~a v g v ~f v ~a, ~b v h v ~j v d v d v ~c v b v ~b v g, ~a v ~j v ~a v ~a, ~a v ~d v f v ~a v ~e v h v i v d v h, ~a v ~c v ~e v ~a v ~j v d v d v ~d v d, ~a v f v d v b v ~f v e v ~b v ~d v ~g, ~a v i v d, a v ~i v ~a v a v ~j v ~c v a v g v i, b v b v ~a v ~e v ~a, b v h v j v ~f v ~e v ~h v i v ~d v d, b v i v ~d v ~c, c v h v ~b v e v e v ~h v ~c, d v d v ~e v a v ~j v h v i v d, d v e v ~d v ~a, e v f v j v ~c, e v j v h v ~b v d v ~a v ~j v ~b, f v h v h v i v ~j, g v ~g v ~h v ~b v ~g v f, g v ~c v i v g v ~h v ~f, g v e v ~j, h v d v a v ~g v ~j v b v ~c v e, h v j v ~b v e v b v ~j v ~c v ~i, i v a v d v j v a v ~a v ~g v h, i v c v b v ~g v c, i v f v ~d v ~i v g v ~j v d v h v ~i, j v ~b v g v ~g v f v i v ~f, j v j v ~e], 2000, count(164)).
tests(big_testcase92, validity, [~j v ~g v ~j v ~f v h v ~h, ~j v ~c v i v h, ~j v f v f v a v g v e v ~a v ~i v ~h v f, ~i v ~i v ~e v g v g, ~i v j v ~g v ~h, ~h v b v ~b v ~e v ~a v ~g v e v ~f, ~g v h v b v b v j v j v g v ~h v i, ~f v ~i v b v e v j v e v h v j v ~h, ~f v ~g v j v g v e v ~c v i v h v ~j v b, ~f v ~d v ~e, ~f v ~b v d v ~h, ~e v ~j v ~a v ~e v ~g, ~e v ~i v g v a v ~a v ~e, ~e v g v ~d v ~a v ~d, ~e v j v j v c, ~d v ~g v ~a v j v f, ~d v b v ~a, ~d v c v ~g v e v j v ~a, ~d v f v ~h v f v ~b, ~d v f v e v i v j v b v c, ~d v i v ~d v ~h v j v ~f v d v g v e, ~c v ~j v h v f v ~c v d v ~c v ~c v ~f, ~c v ~h v ~g, ~b v a v ~j v ~j, ~b v h v ~g v ~j v ~h v ~f, ~a v b v h v h v ~h v g v ~c v ~a, a v ~g v ~j v c v ~e v e v ~j v e v e v h, a v ~g v ~h v j v ~j v ~g v c v c v ~a v ~j, a v ~g v d v ~d v h v ~e v ~i v ~i v g, b v ~f v g v j v f v ~e, b v ~c v e v ~c v e v ~a, b v a v f v ~c v ~a v ~h v ~h v b v ~d, b v d v ~i v ~j v ~a, b v g v e v ~f, b v h v b, c v ~i v a v d v e v ~f, d v c v ~b v h v ~b v g v b v a v b v h, e v ~f v ~a v ~f v ~j v b v ~j v h v b, f v ~i v g v f v ~g v ~d v ~c v a, g v ~i v ~a v ~f v g v ~d v b v f v a v ~d, g v b v i v a v e, h v ~b v d, h v b v ~i v ~i v b v ~e v g v ~c v g, h v f v a v g v ~e v d v ~d v ~g v ~c v g, h v f v g v e v ~g, i v ~h v e v ~e v ~a, i v ~f v e v c v ~i v i v ~a, i v ~c v ~h v f v a v c v ~b v ~c, i v c v ~a v ~g v ~a v j v c v g, j v ~g v ~h v e], 2000, count(114)).
tests(big_testcase93, validity, [~j v ~h v b v ~h v ~b v c v d v f v j, ~j v ~d v i v ~b v c v ~c v ~h v ~i v ~g, ~i v ~d v e v ~b v h v i v f v ~c, ~i v d v ~f, ~i v f v g, ~i v g v i, ~h v ~i v ~h, ~h v ~g v ~i v a v e v i v ~i, ~h v ~e v i v ~j v d v f v ~g v g v ~b v f, ~h v ~b v ~j v e v f v a v a, ~g v i v e v ~e v b v c, ~f v ~j v ~h v ~e v ~a v e, ~f v ~j v ~e v ~e v ~b, ~f v ~h v ~d v ~g v h v ~f v j v ~f, ~f v ~a v h v h v ~f v d v ~e v ~c, ~e v ~a v f v ~b v ~f v ~f v ~g, ~e v a v j v a v ~g v ~b v h, ~e v d v ~h, ~d v ~i v c, ~d v b v g v g v ~j v i v ~e, ~c v ~j v ~a v ~d, ~c v ~d v f v a v f, ~c v f v e v ~a, ~b v ~j v ~f v h, ~b v d v ~f, ~b v d v i, ~b v e v ~d, ~b v f v h, a v h v d v ~f v ~e v ~e v b v a, a v i v ~j v ~j, b v ~j v ~a v a v ~c v ~b v c v j v ~b v g, b v a v h v ~e v e v ~h v i, c v ~f v ~f v c v b v ~i v j v ~i v h, c v a v a v j v j v c v b v ~c, d v ~j v ~f v ~f v f, d v ~c v ~a, d v i v g v ~i v ~h v ~h v ~a v d, e v ~f v i v c v a v e v ~c, e v ~b v ~a v b, e v j v ~h v ~h, f v a v ~b v c v d v ~h, f v d v ~e v ~a v ~i v ~i, f v g v ~a v f v ~h v d, g v ~f v ~h v ~f v g, g v a v ~b v h v ~f v d, g v a v a v ~c v ~b v a v ~b v ~g v d v ~c, h v ~f v a v c v h v e v a v ~j, h v ~e v ~j v h v e v ~j v c v ~f v ~j, i v c v h v e v ~b v ~e v ~b v ~b, i v h v ~f v b v h v ~d v g v ~g v ~b], 2000, count(121)).
tests(big_testcase94, validity, [~i v ~f v ~i v ~g v b v ~a v ~c, ~i v ~a v ~c v ~h v a v ~d v ~a v d v i, ~i v f v c v ~b v ~i v g v e v e v ~c, ~i v g v h v ~e, ~h v ~i v g v a, ~h v ~g v i v ~a, ~h v g v j v ~b v ~f v i v ~f, ~g v ~h v d, ~g v ~h v e v ~j v e v ~j v ~b v ~g, ~f v ~b v f v ~e v ~g, ~f v b v j v b v b v ~g v c v ~b v ~b, ~e v ~f v h v c v d, ~e v ~c v g v h, ~e v g v ~e v j v ~f v ~f, ~d v ~h v ~g v ~g v ~i, ~d v ~b v ~h v ~e v ~j, ~d v a v ~a v j v i v ~a v b v b v ~i v ~h, ~c v ~h v ~i v j v g v b v h v j v ~i v ~h, ~c v ~g v ~h v ~b v g v h v g v ~d v ~i v a, ~b v ~i v j v ~h v ~g v ~j v ~h v ~b, ~b v ~b v f v ~d v ~g, ~b v b v g v ~c v ~b v ~c v ~h v ~i v d v j, ~b v e v c v ~a v g, ~b v f v f v h v h, ~b v j v g v h v d v ~g v ~j v f v ~a v a, ~a v ~g v ~b v h v ~g v i v ~j, ~a v g v ~j v ~e v ~f v e v g v c v ~i v c, a v ~j v ~f v ~a v g v ~e v ~a v d v ~j v ~e, a v f v g, b v ~b v b v c v ~g, b v h v ~i v j v d v ~c v g v e v ~i, d v ~f v h v i, d v ~e v j v ~e v c v ~i v h v ~e v a v b, d v ~c v i v ~a, d v f v i v c v ~h v j v b v ~c, e v a v ~i v j v ~c v ~d v g v ~a v f, e v b v a v ~a v ~c v h v ~f, f v ~f v ~j v ~f v ~f v ~h v e, f v b v d v j v j v ~h v j, f v e v ~a v g, f v i v g v ~e v d v ~i v a, g v ~g v ~h v ~h v ~g v ~i v ~j, g v ~e v ~b, g v i v d v ~e v h v b v h v ~i, h v ~c v ~i v j v b v c v ~c v e v i v c, i v ~e v a, j v ~h v j v ~e, j v ~f v b v ~a v i v ~g v ~b v g v j, j v ~d v ~b v ~j v ~g v ~i v b, j v b v ~g v ~a v b v a], 2000, count(219)).
tests(big_testcase95, validity, [~j v ~a v f v f v f v ~h v ~i v ~e v e, ~j v b v ~a, ~j v h v ~e v b, ~i v b v ~c, ~h v ~g v ~j v ~h v ~g v h v i, ~h v d v d v ~e v d, ~h v f v ~i v ~c, ~h v i v e, ~g v ~f v d v ~f v g v b, ~g v ~b v ~f v g v ~j v a v ~f v e v ~j, ~f v b v e v ~g v b v ~d v ~c v j, ~e v ~a v ~a v ~i v ~a v ~g v d v e v ~h v j, ~e v j v i v ~b, ~d v ~d v ~f, ~d v ~d v i v ~j v f, ~d v d v ~a, ~c v ~j v ~a v f, ~c v ~g v ~i v ~a, ~b v ~i v ~i v ~j v g v ~i v c, ~b v b v ~f v ~h v g v g v ~i v h, ~b v f v b v i v ~j v ~c v g v ~d v ~i v ~d, ~b v g v ~j v e v ~e v ~h, ~a v ~j v ~e v d v b, ~a v ~i v g v b v c v ~d v i v g, ~a v a v ~d v ~b, a v ~i v i v ~b v ~d, a v ~b v c v a v e v ~j, a v ~a v ~g v b v f v ~f v e, a v b v d v ~d v ~f v ~i v i v ~b v ~g v c, b v ~c v ~g v j v ~i v ~h v h v g, b v g v ~a, b v j v ~j, c v f v g v h v d v a, d v ~h v h v b v h v ~g v ~e, e v ~h v b v e v a v ~f v b v ~a v j v g, e v g v j v ~f v i v i v ~i v ~j v ~c v ~i, f v ~i v b v ~h v h v ~d v ~i v ~h v c v ~f, f v ~h v ~i, f v ~h v ~b v c v h v ~f v i, f v ~h v i v c v ~a v g v ~e v b, f v ~b v g v ~c v a v c, f v d v ~f v c v c v ~j v ~c v ~c, f v i v ~f v ~f v f, g v ~j v a v ~a, g v ~c v ~c, g v f v ~c v ~e v ~j v ~f, g v j v ~g v ~c v j v ~a v e, h v ~h v ~a, h v b v h, i v a v ~h], 2000, count(91)).
tests(big_testcase96, validity, [~j v ~i v ~b, ~j v d v ~i v ~b v ~g, ~j v e v ~c v d v ~b v g v ~g v d, ~j v h v ~a v e v g, ~j v j v h v i v a v ~f v f v e, ~i v ~g v g v ~f v c v c, ~g v ~f v a v ~d, ~g v f v ~e v ~a, ~g v f v i v h v ~c v h v ~j v e v g v b, ~g v g v i, ~f v ~a v ~e v ~e v ~f v ~f v a, ~e v ~h v f v c v ~j, ~e v ~f v i v b v ~h v g v h v f, ~e v j v ~f v ~j v a v ~h v g v ~b v ~h v f, ~d v ~f v e, ~d v c v ~i, ~c v ~h v ~h v ~a v j v a, ~c v ~g v ~a v h v e v e v b v ~f, ~c v ~a v ~f v ~b v h v ~j v c v c v c, ~a v ~f v j, ~a v a v j v ~a v d v ~c v ~g v ~a v ~c v e, a v ~i v ~g v c v e v ~d v b v ~d v g, a v ~d v b v ~e v ~h v i v d, b v ~j v ~a v d v e v g v ~c v j, b v a v a v e v ~f, c v ~h v ~i v g v f v ~i, c v ~h v d v ~j v h, c v ~e v a v g v ~i v d v a, c v ~b v e v d v h v g v e, c v d v h v ~i v ~e v g, d v e v d v d v i, e v ~e v i v ~a v ~d v ~b, e v b v i v ~i v g v e, e v h v ~c v ~a v d v ~d v h v d, f v i v a v ~f v ~g v i, f v j v a v g v f v ~b v i v h v ~a v ~j, g v ~j v ~e v g v i, h v ~a v g v ~d v a v e v d, h v e v ~b v d v ~f, i v ~j v c v ~d v i v a v c v ~a v f v c, i v ~g v ~h v h v ~d v g, i v ~e v b v ~c, i v b v a v j v ~c v ~i v j v ~b, j v ~e v ~c v g v h v ~j v j, j v ~e v g v ~h v i v ~a v j, j v ~a v ~g v c v ~i v j v f v a v d, j v e v ~j v b v ~c v ~j v b v b, j v g v h v b v g v d v ~h v d, j v h v ~i v d v ~a v ~g v d v f v c, j v h v ~g v h v ~d v ~a], 2000, count(272)).
tests(big_testcase97, validity, [~j v ~a v b v i v ~a v ~e, ~j v a v e v ~i v ~e, ~j v b v c v ~b, ~j v e v ~g v h v h v ~d v c, ~i v ~b v ~g v ~a v j v ~j v ~f v j v c v ~d, ~i v f v ~h v a v ~d v f v g v h v d, ~i v h v ~h, ~h v ~c v i v ~j v ~c v e, ~g v ~h v a v ~h v ~j, ~g v ~h v j v ~a v e v c, ~g v ~c v g v h v ~g v ~g v ~e, ~g v j v j v g v d v ~h v e, ~f v ~j v i, ~e v c v ~g v a v ~j v h v ~c, ~e v d v ~i v ~d v c v h v ~a, ~e v e v b v ~g v g v c v ~d, ~d v ~i v h v ~b v h v ~a, ~d v ~g v ~d v ~j v ~b v d v i v ~b, ~d v ~e v ~d v ~j v j v ~h, ~d v ~c v ~i v g v ~j v ~c, ~d v ~b v ~c v c, ~c v ~j v ~j, ~b v ~g v ~i v i v g v ~a v a v i v i v ~f, ~b v ~a v ~c v ~a v ~b, ~b v e v ~a v ~d v ~d v h, ~a v f v i v b v ~j, a v g v d v ~g, b v ~j v ~d v ~f v i v c v ~a v j, b v ~i v ~a v ~h v h v h v ~c, b v ~g v ~b v b v h v f v ~i v f v f, b v c v e, b v h v ~h v ~f v ~j v c, c v ~d v ~i, c v ~c v ~b v ~f v d v h, c v h v j v ~j v j v a v ~i v e v e, c v i v ~d v e v i v a v ~f, c v i v ~a v ~a v i v c v b, c v j v g v h v ~f, d v ~h v j v ~h v ~i v ~f v ~b, d v ~c v ~e v g v c v ~j v f v j v ~i v ~i, e v ~b v e v i v h, e v ~a v ~i v ~h v ~i v j v f, f v g v ~a v j, g v ~d v j v ~e v b v h v ~g v d v a, i v c v a v f, i v f v f v f v h v c v g v h v c, i v h v b v j v ~c v ~d, j v ~d v ~j v d v g, j v b v e v ~g v i v g, j v f v c v ~b], 2000, count(238)).
tests(big_testcase98, validity, [~j v c v g v h, ~j v i v ~j v a v h v ~a v i v ~b, ~i v ~f v ~f v ~b v ~b v j v ~d v c, ~i v ~d v ~j v b, ~i v f v j v f v b v ~f v f v ~g v ~c v c, ~h v ~h v ~d v c v ~f, ~h v ~d v ~b v ~g, ~h v b v f v h, ~g v ~h v ~i v e v i v e v e v g, ~g v ~g v g v h v ~f v ~b v d v ~j, ~g v ~c v g v ~d, ~f v ~d v f v ~i v a v ~a v ~g, ~f v ~c v i v ~a v a v ~i v ~c, ~e v ~a v ~h v ~f v c v h v ~d v ~f, ~e v b v h v ~h v ~a v ~i v ~h v d, ~e v e v f v a v e v g v f v a, ~d v ~h v c v ~j v ~c v g v ~e v c v ~c, ~d v ~d v ~b v ~c v ~b v ~e v h, ~d v i v ~e v a, ~c v ~f v ~a, ~c v ~e v j v ~c v ~j v ~h v e v ~b v ~f v ~g, ~c v ~d v i v ~h v c, ~c v a v ~j v j v g v b v ~b v f, ~c v b v ~a v c v j v g, ~c v d v f v b v c v ~g v ~e v ~a v e v j, ~c v e v ~j v c v ~c, ~c v h v e v d v ~b v ~a v ~j v ~e v ~g, ~b v ~g v j v f v i v ~h v ~j, ~b v c v ~b v e v ~b v g v i v ~f v c v j, ~b v h v ~g v i v ~g v ~b v b, ~a v ~b v ~d v c, ~a v f v ~i, ~a v i v ~i v ~h v j v j, a v ~g v ~h v ~j v h v ~d v g v j, a v ~d v b v ~i v e v ~c v ~d v d, b v ~g v ~i, b v ~c v f v ~e v ~f v f v ~d v ~f v ~e v j, c v ~e v b v f, c v ~b v i, d v ~f v ~b, e v ~e v ~e v j v e v ~d, e v g v ~d v ~d v ~f v ~d v ~d, f v a v c v ~c v ~b v ~a v ~b v g, f v b v ~c v ~j v ~h, g v g v ~c v ~h v b v ~g, g v j v ~i v ~c v ~a v ~b v ~g, h v f v d v i v f, i v f v ~i v ~i, i v f v e v ~d v ~f v j, j v i v ~e v j v ~a v i v b v ~j v h], 2000, count(228)).
tests(big_testcase99, validity, [~j v ~i v a v i, ~i v ~a v ~a, ~i v f v ~j v g v f v g v ~b v ~i v ~f v j, ~i v f v ~e v b v g, ~h v e v ~i v ~a v h v ~e v h v ~h, ~f v ~g v ~f v ~a v ~h v e v f v e, ~f v b v ~i v ~j v ~j, ~f v g v i, ~e v a v ~f v j v f v a v ~c, ~e v d v g v e v ~e, ~e v h v j v ~f v b v f v j, ~d v ~h v ~e v ~i v ~d v c v d v ~a v ~e, ~d v ~c v ~e v ~i v i v d, ~d v ~c v c v e v ~g v i, ~d v b v c v g v i v ~i v ~a v j v b v ~c, ~c v ~j v i v g v a v g v e, ~b v h v ~f v ~i v ~a v ~e v c, ~a v ~e v ~d, ~a v ~d v ~j v e v ~h, ~a v ~d v ~e v ~j, ~a v c v a v h v ~e v j v ~e v d v ~a, ~a v i v d v ~h v ~c v ~d, a v ~h v ~g v ~h v d v ~e, a v ~e v f v h v ~i, b v ~g v ~b v e v ~b v ~i v h v ~h v f, b v ~c v ~d v ~c v ~d v j, b v ~b v i v i v i v ~i v ~c v ~a, b v e v ~e v g v b v i v ~h, b v e v a v ~d v g v j v f v d v j v j, b v h v ~f v ~j v ~i v ~f v j, c v ~g v g v b v j v a, c v ~c v ~c v ~g v ~b v ~e v ~e, c v ~c v b v e v f v j v ~f v ~h, c v ~b v c v d v b v c v a v f, c v e v ~b v i v ~c v a v ~c v ~e v e v e, d v ~f v ~h v ~d v i v f, d v ~a v g v e, e v ~c v ~j v ~c v ~d v j, e v e v ~d v h v ~d v ~f v ~d, f v ~j v ~g, f v ~i v g v d v i v ~j v b v ~e, f v ~h v a v i v c v f v j, f v a v ~g v ~h v ~i, f v h v h v ~j v d v ~g v ~e, f v j v b v d v d v f, h v ~a v ~j v ~i v ~d v c v ~g, h v ~a v ~i v i v ~e v g, h v d v f v h v ~g v ~e v d v c v f v e, i v b v ~a, j v ~f v ~c v ~a v c v g], 2000, count(251)).
tests(lots_of_small_testcase0, validity, [~n v a, ~n v h, ~m v ~o v c, ~l v h, ~k v ~e, ~h v ~e v m, ~f v ~l, ~d v g, ~d v n v ~j, ~d v o v l, ~c v k v ~c, ~b v a v ~i, a v ~g, b v ~g, c v ~l, c v ~i v g, d v m, e v ~l, e v l v j, g v f, h v ~o v g, h v ~k v b, j v i v ~j, j v o, k v ~h v ~j, l v ~f, l v e, m v ~m v b, m v ~c v i, n v g v h], 2000, count(4)).
tests(lots_of_small_testcase1, validity, [~m v ~n, ~k v ~e, ~k v ~e v ~c, ~j v ~m v c, ~g v l, ~f v n v a, ~e v ~o, ~e v e, ~c v a, ~b v g v i, ~b v k, a v g v ~j, b v ~o, b v b, c v ~o, d v f v ~o, f v ~e, f v ~d, f v h, f v l, j v ~h v f, k v ~b, k v k, l v f v ~l, m v ~k v ~f, m v ~i v ~o, n v h, o v ~o, o v ~c v ~e, o v j v ~d], 2000, count(51)).
tests(lots_of_small_testcase2, validity, [~o v b, ~n v ~o v b, ~n v o v ~k, ~m v ~m, ~m v e v ~l, ~m v g v ~k, ~l v j v b, ~k v ~g v c, ~i v ~g, ~i v h, ~h v ~d v m, ~f v ~i, ~f v a v c, ~f v f, ~e v ~n v ~e, ~e v a, ~e v e v ~k, ~d v j v ~h, ~b v ~a, ~a v ~d, b v ~n v ~h, b v ~m, c v ~n, e v l, j v e, l v ~j, m v ~n v i, m v ~m v c, m v ~f v ~e, o v k v ~h], 2000, count(143)).
tests(lots_of_small_testcase3, validity, [~o v ~j v ~d, ~n v h v ~l, ~m v o v ~g, ~k v ~d v g, ~j v ~g, ~j v d, ~i v ~i v ~d, ~g v ~c v ~g, ~f v g v f, ~e v ~m, ~e v ~d, ~e v ~c v j, ~d v c, ~b v o v ~e, ~b v o v f, ~a v ~k v a, ~a v ~g v ~n, ~a v ~b v j, ~a v g, a v g, g v ~m v l, g v ~e v ~n, g v ~a, i v o v a, j v ~i v i, j v b v h, k v ~c v ~f, k v a v h, l v b v k, o v ~b], 2000, count(288)).
tests(lots_of_small_testcase4, validity, [~o v ~o, ~o v ~e, ~n v ~g, ~n v ~b, ~n v d v i, ~m v l, ~l v ~n, ~l v ~j, ~l v ~h, ~l v c v b, ~h v ~d v ~h, ~g v ~f, ~f v ~f, ~e v m, ~c v c, ~b v ~l, a v ~f, a v g, a v k, d v b, f v a, h v ~k, h v b, i v ~g v ~m, l v f v ~f, m v ~d v a, m v g v n, n v ~o, o v b, o v c v ~n], 2000, count(32)).
tests(lots_of_small_testcase5, validity, [~n v ~h v ~e, ~n v k, ~m v l, ~l v ~d v i, ~j v j, ~i v ~d, ~i v a v m, ~i v e, ~h v n v ~i, ~g v ~b v ~e, ~g v j, ~e v l v m, ~c v ~n, ~c v d, ~c v m v h, ~a v ~o, b v ~l, c v b v e, c v m, e v g v ~f, f v e, i v ~j v ~m, i v a v d, j v ~k, j v ~d v n, k v j v e, k v n v b, n v f v ~m, n v j, o v l], 2000, count(15)).
tests(lots_of_small_testcase6, validity, [~o v m v m, ~m v ~g, ~m v d v ~m, ~j v ~d, ~h v ~l, ~h v ~j, ~g v ~m v b, ~f v ~c v o, ~f v ~b v ~a, ~f v j v ~c, ~d v ~j v ~g, ~d v a v ~d, ~d v o, ~c v ~m, ~b v ~i, ~a v ~j, ~a v a v c, ~a v g v k, a v ~d v ~i, a v j v j, b v ~a, b v ~a v n, c v ~m v b, c v j v ~c, i v ~c, i v d v b, j v i v g, l v j v ~a, m v e, o v d v ~f], 2000, count(52)).
tests(lots_of_small_testcase7, validity, [~o v ~i, ~n v ~o, ~n v ~d, ~n v b, ~n v m v k, ~m v ~g, ~m v e, ~l v ~h v e, ~l v k v a, ~k v ~k v ~m, ~j v d, ~j v j, ~i v d, ~h v ~j v ~i, ~h v b v ~b, ~h v j, ~g v ~a, ~f v d, ~e v b, ~d v ~a v ~h, ~d v e, ~b v ~o v n, ~a v e, a v m, b v ~n v m, b v ~m, d v ~c v ~i, e v ~c, f v ~m v ~h, l v o v ~n], 2000, count(132)).
tests(lots_of_small_testcase8, validity, [~n v j, ~l v ~o v ~l, ~l v a, ~l v e, ~k v ~d, ~k v ~c, ~k v ~b v k, ~j v l, ~f v ~k v m, ~e v ~h v k, ~d v ~m, ~d v b v i, ~d v e, ~c v ~m, ~c v ~a v ~c, a v ~f v ~f, e v ~o, e v ~f v n, f v ~n, h v ~i, h v ~i v ~o, h v ~e, i v ~j v ~d, i v o v ~b, j v a v ~c, l v j v c, m v ~j, m v k v ~o, n v b, n v e v ~h], 2000, count(8)).
tests(lots_of_small_testcase9, validity, [~n v ~h, ~n v i, ~n v o v m, ~m v h, ~l v ~a v ~o, ~l v f, ~k v ~i v ~g, ~k v j, ~g v o, ~f v ~o, ~d v ~c v ~o, ~d v j v o, ~d v k v o, ~d v n, ~b v ~b, ~a v o v b, a v ~h v k, c v a, c v c, c v n v k, d v ~k v m, e v i v e, f v ~i v m, h v ~k, h v ~i, j v i v j, k v ~g, n v b v k, o v ~m, o v i v n], 2000, count(8)).
tests(lots_of_small_testcase10, validity, [~o v ~b v ~d, ~o v l, ~o v m, ~n v o v ~b, ~l v e v e, ~j v ~d v k, ~j v a v ~a, ~j v j v i, ~i v ~b, ~i v l, ~h v a, ~g v ~g v ~a, ~b v h v m, a v ~f v ~b, b v b, d v ~d, e v h v ~m, f v ~k, h v m v ~k, i v ~d, i v c v ~o, j v ~c, j v j, j v l, m v ~g v ~n, n v ~h, n v ~e v a, n v ~b v c, o v ~o v c, o v ~c], 2000, count(11)).
tests(lots_of_small_testcase11, validity, [~o v ~m v ~f, ~o v ~h, ~o v ~a v k, ~n v j, ~n v m, ~m v ~m v ~g, ~m v b v b, ~k v ~h v f, ~j v d v k, ~h v ~n v ~e, ~h v ~n v i, ~h v d, ~f v e, ~f v o, ~c v f, ~c v k, a v ~g v ~o, a v h v ~n, a v n v n, d v ~j v m, d v ~e, d v m, h v d, i v ~e v ~c, j v ~l v m, j v ~e, l v l v ~h, n v ~f, o v ~a, o v g], 2000, count(60)).
tests(lots_of_small_testcase12, validity, [~o v ~i v ~d, ~o v n, ~n v a v e, ~j v j, ~h v ~n v ~h, ~h v ~m, ~h v h, ~f v d, ~f v o v ~m, ~e v c v k, ~e v e, ~e v l, ~e v o, ~b v b v o, ~b v d, ~b v d v f, a v a v ~f, c v ~g v l, e v a, e v b v l, f v b, f v i v ~d, f v j v i, g v h v i, h v ~d, i v i v k, m v ~l, m v o, n v ~m, n v ~c], 2000, count(0)).
tests(lots_of_small_testcase13, validity, [~o v o v m, ~l v o v i, ~k v ~k v n, ~k v o, ~j v ~k v o, ~j v ~a, ~f v ~o v b, ~e v ~j, ~d v l v ~n, ~c v ~d, ~c v e, ~b v ~i v ~d, ~b v k v ~d, ~a v c, a v g v e, b v e, c v ~h v o, c v l v ~c, d v i v n, f v k v ~b, j v f v ~b, k v i, k v i v ~n, m v ~g, m v ~f, n v ~n v b, n v n, o v ~o v ~o, o v e, o v e v ~j], 2000, count(315)).
tests(lots_of_small_testcase14, validity, [~m v ~n v ~l, ~m v o v ~o, ~k v g v ~e, ~k v l, ~j v l, ~i v ~k, ~i v i v e, ~h v ~c, ~h v g, ~h v j, ~g v ~c, ~f v ~k, ~e v ~d v e, ~e v k v ~f, ~a v ~j v ~c, a v f v ~m, b v i v m, e v ~m v ~m, e v b v ~a, f v ~m v ~n, f v ~d, f v m, g v ~e, i v ~k, i v k, j v ~e v a, j v j, m v o v ~l, n v ~c v i, o v c v o], 2000, count(48)).
tests(lots_of_small_testcase15, validity, [~n v ~i v ~i, ~l v ~l v ~n, ~k v ~e v ~c, ~j v k, ~h v ~k, ~h v ~d v ~h, ~h v j, ~g v ~e v ~a, ~g v h, ~f v ~k v ~k, ~f v l v j, ~a v i, d v i, e v j, f v ~c, g v m, h v ~k, h v a v ~o, h v g v h, i v ~e v ~k, j v ~e, j v f, j v o, k v ~d, k v f v g, l v ~k, o v ~m, o v c v ~a, o v e, o v j v c], 2000, count(0)).
tests(lots_of_small_testcase16, validity, [~m v ~f, ~k v ~k v j, ~j v ~l v ~o, ~j v ~d, ~j v b v e, ~i v ~i v ~c, ~g v ~l, ~g v ~d, ~g v ~d v ~f, ~f v ~l v ~o, ~f v ~g, ~c v j v ~o, ~a v i, a v ~a v ~d, a v c, d v ~k v ~m, d v ~f, d v m, f v c, f v e v e, g v ~d, g v l v j, g v o, h v ~b v ~h, j v ~a, k v ~j v ~m, l v d, l v i, n v ~l, o v c], 2000, count(0)).
tests(lots_of_small_testcase17, validity, [~n v a v ~c, ~m v ~o v d, ~h v ~f, ~h v k, ~f v j, ~e v j, ~b v j, ~a v a v ~d, ~a v g v h, a v b v e, b v ~j v d, c v ~c, f v ~e v k, f v c v ~h, g v c v f, g v g, g v g v ~a, h v d, h v h, h v i v ~e, h v j, i v ~j v ~g, i v k v ~g, k v ~g v ~g, k v i v h, l v e, m v b v ~g, m v c, n v ~n, o v o v k], 2000, count(91)).
tests(lots_of_small_testcase18, validity, [~n v h, ~m v b v ~g, ~m v d v o, ~l v ~o, ~l v ~g, ~l v l, ~j v ~m v j, ~i v ~n v f, ~i v c v ~b, ~i v h, ~h v ~d, ~g v c, ~e v ~n v l, ~d v ~f, ~c v ~f, ~c v ~a v d, ~a v ~d, b v ~j, c v ~h v k, e v n, h v ~o v i, h v j, i v ~k v o, i v h, l v ~f, l v ~c v ~o, l v b, m v ~m, n v a v m, o v g v ~k], 2000, count(24)).
tests(lots_of_small_testcase19, validity, [~o v ~b, ~o v o, ~n v ~f v n, ~n v m, ~m v ~e, ~l v ~l, ~l v ~a v ~c, ~k v ~a v ~a, ~k v j, ~h v a, ~g v ~a v ~h, ~e v ~e v ~e, ~e v ~c v e, ~e v o v ~i, ~c v ~e v ~a, ~a v ~l v ~b, ~a v ~f, ~a v f, a v g v ~b, c v ~o v d, c v ~m v n, c v c, e v ~b v l, e v i, f v f, h v ~n, j v ~n v ~b, k v ~e, k v m v c, n v l v ~l], 2000, count(48)).
tests(lots_of_small_testcase20, validity, [~n v ~j, ~n v ~h v f, ~n v o, ~m v l v f, ~l v g, ~k v k, ~j v f, ~h v m, ~g v ~k, ~f v h, ~e v ~f v ~f, ~d v b, ~c v b v a, ~c v f, ~b v ~g, d v ~c v l, d v f v ~a, e v ~d, f v ~j, f v e, g v ~e, g v ~b, g v ~a, g v h v f, k v ~m v k, m v m, n v ~m v m, n v ~f, o v ~o v ~n, o v l], 2000, solution([(a, f) ,(b, f) ,(c, f) ,(d, f) ,(e, f) ,(f, t) ,(g, f) ,(h, t) ,(j, f) ,(k, t) ,(l, f) ,(m, t) ,(n, t) ,(o, t)])).
tests(lots_of_small_testcase21, validity, [~m v ~n v d, ~m v g v ~h, ~l v ~m, ~k v ~g v m, ~j v f v ~g, ~j v m, ~i v ~o v n, ~g v f v c, ~f v f v k, ~e v ~b v l, ~e v a v j, ~e v g v f, ~c v ~f v ~n, ~c v ~b v m, ~b v ~m, ~b v a v ~d, ~b v a v l, ~a v m v k, a v o, c v ~n, c v m v n, h v e, i v ~e v a, j v ~h v o, k v ~m, k v ~b v ~h, k v n v ~j, m v ~b v o, m v ~a v ~c, n v o v k], 2000, count(158)).
tests(lots_of_small_testcase22, validity, [~o v ~d, ~n v ~e, ~k v ~g v h, ~k v i v ~o, ~j v ~j, ~i v ~l, ~i v ~j v ~l, ~i v ~a, ~g v ~e, ~g v i, ~f v m v c, ~e v d v ~o, ~d v ~k v k, ~d v ~e, ~d v ~a, a v ~a v ~d, b v i v i, c v ~j v e, c v ~f v ~f, d v ~d v n, h v c, i v e, i v i, i v l, j v l, k v d v f, k v k v ~c, l v ~o, l v ~o v o, o v f v a], 2000, count(0)).
tests(lots_of_small_testcase23, validity, [~n v f v j, ~n v m v b, ~n v n v ~g, ~m v n, ~l v ~j, ~i v f v ~c, ~h v c v m, ~g v ~f v d, ~f v ~d, ~f v e v f, ~e v ~o, ~d v ~m, ~d v ~h v ~d, ~d v g v n, ~c v a, ~a v ~k v c, ~a v ~a v ~j, ~a v e v l, b v ~c v ~b, d v ~g, f v c, g v ~h v ~m, g v ~f, h v ~l, i v ~c, j v h, k v ~i v f, k v e, o v ~j v f, o v h], 2000, count(0)).
tests(lots_of_small_testcase24, validity, [~o v ~l v c, ~o v c, ~n v m, ~m v l, ~k v ~h, ~k v j v ~o, ~i v g v e, ~i v h, ~h v ~m v f, ~h v o v ~d, ~g v ~o v a, ~g v m, ~f v ~k, ~f v ~k v ~e, ~e v l v ~i, ~d v ~n, ~b v ~i, ~a v j, b v ~e, d v j, f v ~f v ~b, f v l v ~m, g v ~k, h v ~m, h v ~b, j v ~e, k v ~m v ~m, k v o, n v ~c, n v ~c v ~g], 2000, count(0)).
tests(lots_of_small_testcase25, validity, [~n v e v i, ~l v ~m v e, ~l v e, ~k v o, ~i v k v ~o, ~i v n v ~g, ~h v ~i, ~g v l v j, ~g v o, ~f v ~n v g, ~e v ~m, ~d v ~k v ~d, ~d v ~h, ~b v e v ~m, ~b v n v l, ~a v ~f, a v ~m v i, a v ~l v n, c v k v h, c v o v d, d v h v ~b, e v ~n, f v ~i, g v ~f, g v f, i v h, k v ~b v a, l v l, m v ~k], 2000, count(24)).
tests(lots_of_small_testcase26, validity, [~o v c v a, ~n v ~l v b, ~n v m v n, ~k v c v g, ~h v ~e v l, ~h v d v ~k, ~g v ~a, ~f v ~i v ~g, ~f v ~h v ~j, ~d v ~j, ~d v ~e v c, ~c v ~m v m, ~c v ~b, ~a v ~n v ~b, ~a v j, ~a v k, a v ~k, a v g, a v l, c v ~h v b, e v ~n, f v ~i, f v n, g v ~j, h v ~h, i v ~g, i v ~b v ~d, k v d, k v f, o v k v ~h], 2000, count(0)).
tests(lots_of_small_testcase27, validity, [~n v ~b v j, ~l v ~b, ~l v a v a, ~l v g v ~n, ~k v a, ~j v ~j, ~i v ~g, ~e v ~f v ~f, ~e v m v d, ~d v ~c, ~c v ~f, ~b v m v j, ~a v b, ~a v f, ~a v n, a v e, b v ~e v j, c v f v e, d v g v ~h, f v ~g, f v ~e, i v ~k v ~d, j v k v ~f, k v ~f v ~n, k v b, k v m v ~f, l v ~c, m v ~m, m v b, o v b], 2000, count(0)).
tests(lots_of_small_testcase28, validity, [~m v n, ~l v ~m, ~l v g, ~j v ~c, ~h v ~l v ~k, ~h v ~j, ~g v e v ~n, ~f v k, ~c v ~m, ~b v d v ~a, ~b v i, a v ~m, b v g v ~l, b v k v a, d v ~a, e v ~e, f v ~k v ~c, f v k v g, g v c, h v h v ~h, j v ~k, k v ~h v ~m, k v c v o, l v ~c v ~f, n v ~n, n v ~m v ~c, n v ~b v ~a, n v l v ~e, o v ~o v m, o v k v ~k], 2000, count(340)).
tests(lots_of_small_testcase29, validity, [~o v ~i, ~o v f, ~n v f v ~g, ~k v a v ~o, ~k v g v ~h, ~j v ~j, ~i v ~k v ~l, ~i v k v ~g, ~h v j, ~g v ~k v g, ~e v f, ~d v e, ~d v l v ~o, a v ~b, a v e, c v f v ~d, e v ~h, e v ~c, f v ~n v ~c, j v ~d v m, k v ~d v ~g, l v ~o, l v ~h, m v ~n v e, m v ~j v l, n v g v d, n v g v o, o v ~i v ~d, o v ~f, o v m], 2000, count(128)).
tests(lots_of_small_testcase30, validity, [~n v ~n v ~g, ~n v ~f v ~h, ~m v ~o, ~m v ~c, ~k v ~g, ~k v ~b, ~j v ~b, ~j v i, ~i v ~a v ~j, ~h v g, ~g v d v g, ~f v d, ~e v ~o, ~e v ~n v ~f, ~e v ~l, ~d v d, ~c v ~m v h, ~c v ~j v ~m, ~c v ~b, ~c v ~a v h, ~c v n v l, a v k, b v ~f, d v ~o v l, d v ~e, d v ~e v ~i, h v ~k, k v ~e, l v f v b, n v ~d], 2000, count(98)).
tests(lots_of_small_testcase31, validity, [~o v ~c, ~n v b v b, ~k v ~k, ~j v ~e, ~j v a v e, ~j v f, ~g v g, ~f v e v k, ~f v f v e, ~e v ~a, ~b v ~d, ~b v ~b, ~b v g v ~j, ~a v ~i v ~h, ~a v ~c v j, a v ~l, d v ~m v n, d v d v ~f, h v ~m, h v k v i, j v ~k, j v ~j v d, k v e v ~o, l v ~d v ~h, l v b v l, m v n v ~h, n v ~g, n v e v ~d, o v ~o, o v j], 2000, count(0)).
tests(lots_of_small_testcase32, validity, [~n v n v ~n, ~l v ~d v ~b, ~k v ~d, ~k v i, ~j v ~i v n, ~i v l, ~i v n v ~c, ~h v ~g, ~h v d, ~g v ~a v d, ~f v a v c, ~e v d, ~d v b, ~a v ~f, ~a v g v o, ~a v n v e, a v ~g, b v ~k v ~j, b v n v ~n, c v f v i, d v ~i v ~m, e v ~a v e, f v ~a v f, g v ~c v ~l, g v i v ~f, h v ~n, h v j v g, k v k, n v b, o v a v g], 2000, count(0)).
tests(lots_of_small_testcase33, validity, [~m v ~e v ~h, ~l v ~l v ~g, ~l v ~f v ~o, ~j v ~o, ~j v b, ~j v k v ~o, ~i v ~m v b, ~i v j, ~g v ~o, ~c v ~e, ~a v b v h, a v ~g v b, b v l, c v e, c v i v i, f v ~i v o, f v i v j, g v ~f v m, h v ~k, h v ~c, h v d, i v ~i, j v f v ~i, k v a v ~n, m v ~f v n, m v ~b, m v j, o v ~l, o v ~l v l], 2000, count(132)).
tests(lots_of_small_testcase34, validity, [~o v ~d, ~n v e v c, ~l v ~f v ~n, ~i v ~k, ~h v ~a, ~g v ~k v f, ~g v b, ~g v e v ~j, ~f v ~o, ~f v g v ~k, ~e v ~f, ~e v ~e, ~e v ~a v e, ~d v ~d v ~i, ~d v l, ~b v m v ~k, b v c, c v ~j v ~e, c v ~f v ~d, c v ~d v g, c v l v ~l, d v ~f v ~c, d v b v ~j, f v h, g v h v f, j v ~i, j v ~e v a, k v ~c, m v ~a, m v g v a], 2000, count(99)).
tests(lots_of_small_testcase35, validity, [~m v ~b, ~m v l v l, ~l v h, ~j v m, ~i v ~l v ~h, ~h v l, ~g v o, ~f v ~g v g, ~f v e v ~a, ~e v i v ~j, ~e v l, ~d v ~f, ~c v ~i, ~a v n v ~g, b v h, b v l v m, c v ~k v c, c v b v ~o, e v ~c v ~k, e v d v ~h, g v ~o, g v ~d v e, g v l v n, g v m v k, h v ~o, h v f v b, h v g, h v o v h, i v ~i v ~l, i v ~c], 2000, count(24)).
tests(lots_of_small_testcase36, validity, [~o v ~b v h, ~m v ~f, ~l v d, ~i v a v ~o, ~i v f v ~o, ~h v ~b, ~h v n v g, ~f v f, ~f v m, ~e v c, ~e v n, ~a v ~e, ~a v ~b v l, ~a v j, ~a v n v ~l, b v ~o, b v a v h, c v ~j, c v ~e, c v f v ~h, c v f v i, e v ~o, e v j v j, f v j, g v ~m, h v i, l v b v ~g, l v e v ~i, m v e v ~d, o v ~i], 2000, count(10)).
tests(lots_of_small_testcase37, validity, [~n v d v e, ~m v ~m v n, ~l v ~b, ~k v h v g, ~g v ~n, ~g v k v ~e, ~g v l v a, ~f v ~o, ~f v b v c, ~e v ~i v ~m, ~e v ~g, ~a v g v ~a, b v ~k v ~l, b v e, b v i, c v h, e v ~d v ~a, f v ~h v ~o, f v f v o, f v o v ~k, h v c v g, i v ~f v ~b, i v ~d v ~h, i v ~c, i v c, j v j, j v o v e, k v ~a v e, m v c v l, m v n v ~f], 2000, count(41)).
tests(lots_of_small_testcase38, validity, [~o v ~h, ~n v ~f v a, ~m v ~k v k, ~j v i v j, ~i v b v b, ~i v f, ~f v n, ~e v ~l v e, ~e v ~h, ~e v ~f, ~e v c v k, ~e v f, ~d v ~e v e, ~d v b, ~b v i, a v h, a v j v ~o, b v j v ~m, c v ~c v ~f, d v c, e v o, i v ~o, i v ~m v m, i v ~f, j v ~n, j v ~j v n, j v ~d v l, j v e, l v i v g, o v ~e], 2000, count(48)).
tests(lots_of_small_testcase39, validity, [~o v ~h v f, ~o v k, ~n v ~n, ~l v ~m, ~l v ~g v i, ~l v j, ~k v f v j, ~j v e, ~i v ~d v n, ~f v e, ~e v ~m, ~e v ~l, ~e v ~a v o, ~c v f v ~g, ~c v n, ~b v ~n, ~a v l v e, a v b, a v h, b v d, b v d v ~e, c v ~l v ~d, c v f v ~a, d v ~d, e v i v ~o, e v l, l v n, m v i v j, n v ~a v ~o, o v ~b v ~e], 2000, count(0)).
tests(lots_of_small_testcase40, validity, [~o v ~h v ~d, ~o v i v c, ~n v ~m, ~n v m v ~n, ~m v ~d, ~m v b v k, ~k v g, ~j v ~m, ~h v c, ~g v g v g, ~d v ~o v o, ~d v l v ~o, ~b v ~i, ~b v n, ~a v b, a v ~g v a, a v ~d, b v ~h v d, c v ~g, f v ~h, g v ~b v ~o, h v j v ~a, h v o v ~n, j v ~a, l v h v j, l v n, m v ~d, m v ~c v ~i, n v h v l, n v k], 2000, count(0)).
tests(lots_of_small_testcase41, validity, [~o v ~k, ~m v ~g, ~k v j v b, ~h v o, ~g v b, ~g v f v a, ~g v m, ~f v ~j, ~f v e v ~h, ~f v i v ~d, ~e v f v ~a, ~e v i, ~c v ~a, ~a v ~a, ~a v i v o, a v ~l, b v ~m v ~k, b v ~m v ~g, c v a, d v ~l v ~i, d v ~i v m, d v l, d v n v ~e, e v ~g v d, e v e v ~c, f v h v ~g, h v ~d v ~g, l v ~c v ~g, n v a v ~g, n v m], 2000, count(64)).
tests(lots_of_small_testcase42, validity, [~o v ~o v ~k, ~o v ~l v j, ~o v j, ~m v ~h, ~m v ~a, ~m v i, ~m v j v ~h, ~m v m, ~l v ~m, ~l v g, ~j v ~d, ~f v ~e v f, ~f v ~d v ~a, ~f v f v ~k, ~c v ~h v l, ~c v ~f v j, b v ~g, d v c, e v h, f v ~c, f v j, g v k, h v c v ~e, j v ~l v j, j v c, l v b, m v ~c v l, n v e v g, o v ~m, o v l v i], 2000, count(74)).
tests(lots_of_small_testcase43, validity, [~o v ~k, ~l v ~b v f, ~g v ~c v a, ~g v m, ~f v ~i, ~f v ~c v k, ~c v ~n, ~c v ~j, ~c v ~f v ~l, ~c v h, a v ~m, a v ~g, b v a, b v m, c v ~h v b, e v ~n v ~g, e v ~b, f v d, f v j, g v ~b v ~e, h v ~l v ~l, h v c, h v d, h v k, i v m, k v g v ~e, l v ~h v j, m v ~j, n v ~m v j, o v m], 2000, count(42)).
tests(lots_of_small_testcase44, validity, [~o v b v ~f, ~o v g v ~k, ~o v g v ~h, ~m v m, ~m v n, ~j v b, ~i v ~j, ~i v m, ~d v ~n, ~d v b, ~c v ~l v ~h, ~c v o v ~l, ~a v ~j v ~l, ~a v g, b v ~b, e v ~m, e v ~h v ~o, f v j, g v ~k, g v ~i, g v ~c, g v j, h v n v k, i v ~d v a, i v ~b v ~g, l v ~i v l, l v ~f v d, m v h v ~h, m v k v c, n v m], 2000, count(53)).
tests(lots_of_small_testcase45, validity, [~o v ~k v a, ~o v ~d v ~l, ~o v e, ~o v m, ~k v ~d, ~j v ~i v l, ~j v d, ~i v o v m, ~f v ~l, ~f v m, ~e v ~m v ~f, ~e v n v ~k, ~b v ~f v ~m, ~a v ~o v d, f v ~j, f v e v c, f v f v ~b, g v ~o, g v ~h v d, g v k v ~e, h v ~m v ~e, h v ~a v m, i v ~i v n, i v e v c, j v ~a, k v m v ~g, m v k v ~a, o v ~i v ~d, o v d], 2000, count(80)).
tests(lots_of_small_testcase46, validity, [~o v ~l, ~o v c v a, ~o v m v ~d, ~o v o, ~m v h, ~j v h v i, ~i v b v ~e, ~h v h, ~g v ~n, ~f v ~l, ~f v n v b, ~e v ~b v ~d, ~d v k, ~c v ~h, ~b v ~d v ~n, ~a v ~i, ~a v l v a, a v ~i v ~j, a v ~d v ~h, d v ~o v l, d v ~e, f v n, g v ~e v ~f, k v ~g, k v l, l v n v ~l, m v d v ~j, m v i v d, n v ~a, o v j v b], 2000, count(76)).
tests(lots_of_small_testcase47, validity, [~o v ~l v ~g, ~o v ~b, ~o v n v ~h, ~m v ~c v ~k, ~l v ~l, ~l v f, ~i v e v ~j, ~h v ~l, ~h v ~e v ~j, ~h v ~a v o, ~h v a, ~h v f, ~e v ~k, ~e v l, ~d v c, ~d v o v h, ~b v o, ~a v ~o v k, ~a v i v i, a v ~e v ~m, b v f v ~h, c v a, d v ~l, d v ~f v ~n, g v g v b, g v h v h, h v i v ~f, i v ~b v ~c, j v b v ~l, o v n v e], 2000, count(75)).
tests(lots_of_small_testcase48, validity, [~o v ~c, ~n v c v ~a, ~m v ~l, ~m v e v o, ~l v ~d, ~l v n v ~a, ~k v a v o, ~k v m, ~j v ~e v ~d, ~i v b v ~f, ~f v ~e v ~c, ~e v k v h, ~d v b v l, ~d v j, ~d v m, ~c v ~e v m, ~a v ~i v ~l, ~a v b v ~h, a v ~n v e, c v ~b, c v b, g v ~m v g, i v ~n v ~a, i v f v c, k v e v m, m v ~n v ~j, m v ~m, o v ~b v ~m, o v l, o v l v ~k], 2000, count(0)).
tests(lots_of_small_testcase49, validity, [~o v c v ~d, ~n v a, ~m v ~d v ~f, ~j v ~m v b, ~i v m v k, ~f v ~m v b, ~c v ~m, ~b v ~l, ~a v o, a v ~b, b v ~o v l, c v ~d, c v l, d v ~g, d v ~f v c, d v g, e v f v m, f v a, f v g v ~m, f v m v n, g v ~k, g v ~h, g v o v ~m, i v m, i v m v ~d, j v h, k v k, n v a, o v ~a v i], 2000, count(30)).
tests(lots_of_small_testcase50, validity, [~o v b, ~o v g v ~a, ~o v i v k, ~n v ~e, ~m v a, ~k v ~c v ~b, ~j v ~l, ~j v ~g v e, ~j v ~e, ~i v l v ~k, ~h v ~j v ~i, ~f v e, ~b v ~a, ~a v ~k, ~a v a v ~o, a v ~f, b v ~i v k, e v ~d v ~m, f v l, g v i, j v ~k, j v ~f, j v ~e, j v n, k v ~g, k v o, m v d v d, m v e v ~m, n v ~i v ~h, n v d v o], 2000, count(4)).
tests(lots_of_small_testcase51, validity, [~o v c, ~l v n, ~k v o, ~j v ~c v a, ~j v c, ~i v ~m v ~e, ~i v ~a, ~h v ~h v ~d, ~h v ~d v ~g, ~f v ~d, ~e v f v ~o, ~d v h, ~b v ~b, a v ~a, b v ~g v ~g, b v j v ~d, c v b v ~n, c v o, d v ~l, g v m v c, h v ~m v ~b, h v ~j v o, i v ~d v n, i v o, k v ~o, k v e v e, l v i, n v o, o v ~g v ~i, o v h], 2000, count(22)).
tests(lots_of_small_testcase52, validity, [~o v ~j v f, ~o v ~b, ~m v ~d, ~l v j, ~k v ~c, ~j v ~i, ~i v o v j, ~h v ~h, ~f v ~i v ~a, ~e v i v ~d, ~c v b, ~b v ~b, ~b v a, a v a, b v ~c v e, c v d, e v ~d v b, e v e, f v k, h v ~g, h v ~a, i v ~o v ~g, i v ~b, l v ~e, n v e v ~f, n v i v g, n v n, o v ~l, o v ~e, o v n], 2000, count(0)).
tests(lots_of_small_testcase53, validity, [~o v k v i, ~j v ~e, ~i v d, ~i v f, ~i v n v ~k, ~h v o v ~o, ~f v ~j, ~c v e v ~f, ~b v ~c, ~b v d v a, ~a v h v ~b, a v k v h, b v k, b v n, c v ~j, d v ~h, d v e v ~i, d v j, e v ~d v ~f, g v ~i, g v a v ~d, h v i v ~j, i v ~k v ~h, k v ~g v j, k v ~f v ~h, k v ~c, m v n, n v b v e, o v ~e, o v m], 2000, count(77)).
tests(lots_of_small_testcase54, validity, [~o v d v j, ~k v j, ~j v d v ~d, ~j v j, ~i v f v ~h, ~h v j, ~h v n v k, ~g v d v ~j, ~f v i, ~e v d v c, ~e v e, ~e v l v d, ~d v e, ~c v b, ~a v ~g v ~n, b v ~d v l, c v b v ~b, d v ~m, e v ~i, f v ~g, f v ~d v ~j, g v g v ~h, h v l, i v f, l v a v b, m v l v a, n v ~j v ~i, n v ~b, o v ~a, o v i], 2000, count(173)).
tests(lots_of_small_testcase55, validity, [~n v ~f, ~n v ~e, ~m v ~j, ~l v ~g, ~l v ~g v ~l, ~l v ~f v ~a, ~h v e v ~o, ~f v l v ~m, ~e v ~h v d, ~d v ~b, ~c v i, ~c v k, ~c v n v ~i, ~a v b, ~a v m v ~b, a v ~f v g, a v ~c, c v e, d v ~h v ~o, d v ~a, d v b v ~d, e v ~l v ~a, f v ~c, f v k, g v g, j v j, l v d v ~k, l v e v c, l v g v j, n v c], 2000, count(0)).
tests(lots_of_small_testcase56, validity, [~o v ~i v l, ~o v c v h, ~m v i v d, ~l v ~a, ~l v g v ~g, ~k v ~c, ~k v d, ~k v d v ~o, ~j v ~k v ~n, ~j v ~b v e, ~i v l v j, ~h v b, ~h v h, ~g v i v a, ~g v j v d, ~e v ~o, b v ~i, e v g v l, g v ~f v ~a, g v ~b, g v c, g v i, h v a, h v i v ~h, i v e v k, k v h, k v m v a, l v ~i v c, m v ~f, o v ~g v c], 2000, count(70)).
tests(lots_of_small_testcase57, validity, [~o v e, ~j v ~d, ~j v g v ~o, ~j v l v ~g, ~i v ~l v k, ~i v ~a v c, ~f v ~e, ~e v e, ~e v j, ~e v m, ~c v c, ~a v ~o, c v ~a, c v l v ~c, d v ~o, d v f v m, e v a, e v i v ~i, f v f, f v n v e, g v ~m v ~l, g v a, h v g v ~e, h v j v ~j, i v g v ~o, l v f v g, l v j, l v k v ~d, o v ~g v o, o v a v c], 2000, count(68)).
tests(lots_of_small_testcase58, validity, [~o v ~f v m, ~o v ~e, ~o v e v ~e, ~n v a v n, ~l v ~n, ~k v ~l, ~k v o v ~o, ~j v ~l v ~e, ~j v j v a, ~j v k, ~h v l v o, ~g v ~n v ~i, ~f v ~j, ~e v ~k, ~e v o v d, ~b v ~a v i, ~a v h v d, ~a v k v ~e, a v ~n v ~m, b v ~g v l, c v n v ~n, d v ~m v d, h v ~c, h v ~c v ~n, k v ~j v i, k v ~d, k v o v i, m v j, m v n, n v a v f], 2000, count(166)).
tests(lots_of_small_testcase59, validity, [~o v b, ~n v ~h v j, ~n v n, ~m v ~j v ~g, ~l v c, ~j v ~a, ~j v a, ~h v ~e v ~d, ~c v ~i v l, ~b v ~d, ~b v i v ~h, ~a v h v l, ~a v l v ~o, a v ~m, a v ~b, b v ~a v ~c, b v j, b v n, e v ~m v ~h, e v h v ~k, e v k v ~d, i v ~n v a, i v ~j, i v ~f v ~g, i v b, j v b, j v d v ~n, k v ~i v f, m v n, n v k], 2000, count(26)).
tests(lots_of_small_testcase60, validity, [~o v ~b, ~n v b v ~f, ~n v f, ~k v m, ~i v ~c, ~g v g v ~o, ~d v i v k, ~c v ~f, ~a v i v ~f, a v ~h, a v j v ~m, a v l, d v d v ~a, d v j, f v ~k v ~c, g v ~a, g v k, h v ~c v ~a, i v i v j, j v ~n, k v ~o, k v ~a, l v e v e, m v ~d v f, m v d v f, m v l v c, n v ~f, n v g v ~h, o v ~m, o v ~d v ~c], 2000, count(40)).
tests(lots_of_small_testcase61, validity, [~o v ~n, ~n v ~n, ~n v ~m, ~n v ~c, ~m v ~o v m, ~l v ~i, ~i v ~g, ~h v m v ~d, ~d v ~f v l, ~d v h v d, ~c v j v ~n, ~c v n v f, ~b v ~h, ~b v ~g v j, ~b v a, ~b v b v ~c, a v f, b v m, c v e, d v e v a, e v ~o, f v c v h, g v j v g, g v l v i, h v a, j v b, k v ~g, o v b, o v d, o v k], 2000, count(114)).
tests(lots_of_small_testcase62, validity, [~o v e, ~n v a v ~h, ~l v ~n v ~i, ~l v ~h, ~l v e, ~l v i, ~l v k v ~g, ~k v ~m, ~k v ~l v m, ~j v d, ~i v b, ~h v ~c, ~e v e v k, ~e v g, ~e v i v ~f, ~c v c, ~c v i v m, ~a v ~k, ~a v k, c v ~f v b, d v ~d, g v ~f, g v ~a v ~j, h v ~f v k, j v c, k v ~c v i, l v ~b, n v ~g v m, o v e], 2000, count(10)).
tests(lots_of_small_testcase63, validity, [~o v ~l, ~n v a v ~k, ~m v ~b v ~i, ~l v f, ~k v ~n v k, ~k v j, ~h v b, a v ~k v d, b v h, c v ~k v c, c v ~h v ~h, d v ~a v ~o, d v b, d v f v e, e v ~g v ~j, g v ~o v g, g v ~l v b, g v i, h v ~o v o, h v ~n v ~n, j v n v h, k v ~d v b, l v ~d, l v g v ~b, m v ~f, m v ~e, m v ~b, m v f v ~d, n v n v l, o v g], 2000, count(57)).
tests(lots_of_small_testcase64, validity, [~n v ~o v j, ~n v ~k, ~n v ~k v ~a, ~l v ~l v ~l, ~l v ~d, ~k v ~k, ~k v ~h, ~j v b, ~i v ~j, ~i v l v ~o, ~h v ~c v g, ~h v ~b, ~g v ~h v j, ~e v o, ~d v f v l, ~d v h, ~d v o v d, ~c v ~g v ~o, ~a v a, b v n, c v ~d v ~j, f v h v ~a, f v n v m, g v ~g, g v ~b, j v ~k, j v e, l v ~f, n v ~a, n v ~a v ~g], 2000, count(13)).
tests(lots_of_small_testcase65, validity, [~o v c, ~o v o, ~o v o v ~i, ~n v ~g v e, ~n v j, ~l v i, ~k v ~d, ~k v k v f, ~i v ~e v h, ~i v ~c, ~i v a v d, ~g v b v ~f, ~f v ~i v f, ~f v j, ~d v c, ~c v m, ~c v n, ~b v ~f, ~b v h v o, ~a v ~d, f v ~c, f v ~b, h v c v ~n, h v g v ~d, k v ~c v ~b, m v ~c, n v ~g, o v ~k v ~f, o v ~h, o v ~f v ~l], 2000, count(80)).
tests(lots_of_small_testcase66, validity, [~n v ~f v h, ~n v c, ~m v j, ~m v l v ~h, ~l v ~a, ~l v i, ~k v e, ~i v m v l, ~h v ~o v f, ~f v ~e, ~c v c v f, ~b v e v ~d, ~b v g, ~b v n, ~a v ~o, ~a v g v ~o, b v a, b v h, c v a v c, c v e v ~i, f v d v ~a, h v a v f, i v ~i v ~a, i v m, k v ~f v ~o, l v ~k, l v ~e v ~h, m v k, m v l, o v l v g], 2000, count(12)).
tests(lots_of_small_testcase67, validity, [~o v a v ~g, ~o v f, ~n v g, ~m v e, ~j v ~b, ~h v ~f, ~f v ~g, ~f v e, ~f v k v f, ~d v ~h v ~h, ~d v c v k, ~c v ~j, ~b v ~j v ~o, ~a v n v ~n, b v ~d, b v c, b v e, c v ~f v d, d v ~n, d v k v ~l, h v ~m v i, i v ~b, k v ~d, l v ~n, l v ~h, l v e, l v g, n v ~d, n v ~d v ~b, n v d], 2000, count(12)).
tests(lots_of_small_testcase68, validity, [~o v n, ~m v o v n, ~l v i v ~l, ~i v ~n v h, ~f v ~h, ~f v ~f, ~e v c, ~e v l, ~d v ~d, ~d v k, ~d v m, ~c v ~j v m, ~c v ~f v ~a, ~b v ~n v c, ~b v i, b v ~e, b v ~a, c v ~f v g, c v ~e, e v ~h, e v b v g, i v ~k, k v ~i v ~g, k v ~b, k v o, l v e v j, m v a v g, m v e v n, n v ~d v h, o v ~f v g], 2000, count(31)).
tests(lots_of_small_testcase69, validity, [~o v k, ~o v l v ~d, ~n v b v c, ~m v ~d, ~l v ~j v ~o, ~l v ~c, ~k v o, ~j v c, ~h v ~h v e, ~h v f v ~m, ~g v d v ~d, ~g v i, ~g v l v k, ~f v ~i, ~d v ~o v ~f, ~c v ~b, ~c v h, ~a v l v ~o, ~a v m, b v ~d, b v e v ~i, c v ~h, e v ~m v m, e v ~k v ~o, e v ~e v ~k, i v ~i v k, i v j v e, j v ~k, m v ~l v d, n v ~d], 2000, count(105)).
tests(lots_of_small_testcase70, validity, [~o v ~d, ~n v o, ~l v h, ~l v j v ~d, ~k v ~b v ~l, ~k v i, ~k v l, ~i v ~b, ~h v ~j v ~j, ~h v ~d, ~h v ~c, ~f v e, ~f v k, ~d v b v m, ~b v ~e, ~b v k, ~b v n, a v ~c v ~i, b v h, e v ~l, e v k v j, f v a, i v ~c, i v ~a, j v j, k v ~m, k v ~b v l, k v j, n v ~n, n v c], 2000, count(0)).
tests(lots_of_small_testcase71, validity, [~m v c, ~m v k v l, ~l v b, ~k v ~l, ~k v ~a, ~j v b, ~i v ~c v ~a, ~h v ~c v i, ~h v l, ~g v f v h, ~g v k, ~g v l, ~g v o v j, ~f v ~h v ~n, ~d v d v ~i, ~d v l v e, ~c v ~h, b v g v ~d, d v ~n, e v ~j, f v ~g v a, f v j v ~o, i v ~c, j v j v ~l, j v k v n, l v ~k, m v ~c, n v ~g, n v c v ~j, o v ~j v ~j], 2000, count(38)).
tests(lots_of_small_testcase72, validity, [~l v ~j, ~l v h, ~l v h v ~f, ~k v ~m, ~j v ~m, ~g v ~g, ~f v ~g v n, ~e v ~k v m, ~e v ~h, ~e v a, ~d v h, ~c v ~l, ~b v ~k v ~a, ~b v ~j v e, b v d v l, c v ~b, e v ~j, e v ~g v f, e v f v g, e v g, g v c v ~b, j v ~o, j v ~l v ~n, j v ~d v ~o, j v ~d v ~m, k v e, k v m, l v ~k, o v ~i v g, o v m], 2000, count(4)).
tests(lots_of_small_testcase73, validity, [~o v ~g, ~o v ~f v m, ~o v m v e, ~n v a v f, ~l v ~n v m, ~i v ~j, ~i v ~f, ~g v ~n v ~n, ~g v ~h v ~k, ~f v m, ~d v d v g, ~d v l v m, ~b v ~c v c, ~b v g, a v e v ~m, b v o v ~d, d v ~l, d v j v ~i, e v ~b v c, e v e, f v ~l v o, f v ~g, j v ~i v ~g, k v ~l v a, l v ~b v ~h, m v ~m v ~j, m v ~d, n v n, o v i], 2000, count(168)).
tests(lots_of_small_testcase74, validity, [~n v ~c, ~n v j v h, ~n v n v ~m, ~m v ~d, ~m v c v ~f, ~l v ~e, ~k v ~l v g, ~j v e v ~l, ~j v k v ~m, ~h v ~k, ~h v f, ~h v n v f, ~f v ~n v ~e, ~b v n, ~a v c, a v ~m v h, a v ~f, b v ~n v j, b v ~m, c v ~i, c v ~g, f v ~j v ~a, g v c v ~b, i v ~i v g, j v j v m, l v b v n, m v h, n v ~g v ~g, n v c v ~h, o v o], 2000, count(0)).
tests(lots_of_small_testcase75, validity, [~o v a v ~j, ~n v ~i v j, ~m v ~b v i, ~j v ~d v h, ~j v g, ~i v ~g, ~h v m, ~g v ~k v ~k, ~f v ~i, ~f v b, ~f v i v g, ~e v k v ~e, ~b v ~a v ~m, c v a v ~d, c v m, d v ~k, d v ~h v ~c, e v ~k, e v ~h v ~b, e v d v j, f v ~k v ~a, f v ~c v ~o, g v ~m, j v ~n v ~g, j v c, j v l, k v f, n v ~l, o v ~l, o v ~l v k], 2000, count(7)).
tests(lots_of_small_testcase76, validity, [~l v ~e v ~l, ~k v i v e, ~i v k, ~h v e v e, ~g v ~b, ~f v ~l v k, ~e v ~e, ~e v l v d, ~d v g v d, ~c v ~l, ~a v ~l, ~a v j, a v ~j v e, a v n, b v ~m, b v c, c v ~d, c v b, d v ~e v g, d v d, j v ~h, j v ~a, j v b v ~b, k v ~l, k v ~e v i, m v ~f v l, m v ~d, n v ~b v k, o v ~m v l], 2000, count(10)).
tests(lots_of_small_testcase77, validity, [~o v m v l, ~n v ~d v ~j, ~n v a, ~m v b v ~e, ~m v f v c, ~l v ~m v ~m, ~k v ~n, ~j v ~d v c, ~e v ~n v ~m, ~e v ~l v e, ~d v ~n v k, ~d v a v g, ~b v ~h, ~b v ~c, ~b v a v g, a v ~j, b v n, c v g v ~m, g v ~n v ~n, i v ~h v ~e, j v c, k v ~d, k v ~c, k v n, l v ~a, l v b v ~e, m v ~d, n v ~f v ~o, n v a v c, o v ~k], 2000, count(52)).
tests(lots_of_small_testcase78, validity, [~o v ~o v m, ~o v ~n, ~n v ~m, ~n v ~k v a, ~n v c v g, ~m v ~a v ~d, ~m v d v ~l, ~m v m v ~o, ~k v j, ~k v j v i, ~i v ~o v m, ~i v ~e, ~i v c, ~g v ~d, ~f v ~l, ~d v ~g, ~c v ~n, ~b v d v f, ~b v f, c v ~o, c v ~l, c v ~i, f v ~c, g v ~g, h v l v ~a, i v ~h v ~o, j v b v ~f, j v c v m, n v c v a, o v d], 2000, count(157)).
tests(lots_of_small_testcase79, validity, [~o v ~k v ~g, ~n v f, ~n v o, ~j v ~n, ~j v ~f v i, ~i v h, ~h v l, ~g v ~n, ~g v ~c, ~g v ~b v ~n, ~g v b v ~c, ~f v h, ~f v o v g, ~e v o, ~d v h v ~o, ~c v ~i, ~b v o v h, ~a v c v o, ~a v j v ~c, b v ~j v g, c v ~j v l, d v ~g v h, e v m v f, e v m v k, f v o v b, i v ~j v k, j v ~f v ~d, j v o, k v g, k v l], 2000, count(392)).
tests(lots_of_small_testcase80, validity, [~o v ~o v n, ~o v d, ~o v j v ~e, ~n v ~a, ~m v ~k, ~m v m v ~n, ~k v l v ~b, ~h v ~j v ~a, ~h v ~j v d, ~h v b, ~h v k, ~f v ~m, ~f v ~l, ~e v h v o, ~d v ~m v b, ~c v ~m, ~c v ~k, ~a v ~d v d, ~a v d v ~e, a v ~o, b v g, c v ~f, d v e, e v ~m v l, h v ~d, i v l, k v ~l v ~k, m v ~o, n v ~l, n v h v ~e], 2000, count(20)).
tests(lots_of_small_testcase81, validity, [~o v ~l v f, ~o v d v ~e, ~n v n, ~m v e v ~f, ~l v ~k, ~l v ~h, ~i v ~j, ~h v b, ~e v m, ~d v ~m, ~c v ~l, ~c v ~c v ~l, ~b v b v ~o, ~a v b, ~a v h, a v ~l, b v ~m v d, c v a, c v j v ~h, d v d v ~h, e v ~m, e v ~j, e v g v ~d, g v ~m, h v m v n, h v n v j, i v ~a v o, m v i v n, n v ~h v f, o v ~e], 2000, count(132)).
tests(lots_of_small_testcase82, validity, [~n v ~d, ~n v c v ~j, ~l v ~l, ~k v ~b, ~j v ~d v ~h, ~j v f, ~i v ~f v ~g, ~h v ~o v n, ~h v ~h v ~n, ~h v ~g, ~g v ~k v a, ~g v ~i, ~g v e v ~a, ~g v e v l, ~e v b v k, ~b v ~f v ~c, ~a v c v k, b v ~l v ~m, d v a v ~o, d v e, e v ~h v i, e v d, e v d v ~b, e v o v ~i, g v ~a, j v o, k v ~n, k v j v b, n v ~a, n v ~a v i], 2000, count(162)).
tests(lots_of_small_testcase83, validity, [~o v ~n, ~o v ~l v f, ~n v ~d v j, ~m v h v ~m, ~l v ~e, ~l v h, ~k v o, ~j v m v o, ~h v ~a v m, ~g v ~h v ~i, ~f v ~e v ~n, ~e v b, ~e v k v ~a, ~d v c v ~k, ~b v ~b, a v ~c v a, a v j v ~m, a v l v e, b v o, d v l v ~b, f v ~g, f v ~e v ~i, g v c, g v n v ~o, h v i, j v b v e, m v h, n v ~j, o v ~m v o, o v n], 2000, count(0)).
tests(lots_of_small_testcase84, validity, [~n v b, ~n v i v ~c, ~n v l v ~b, ~m v f, ~l v ~j v e, ~l v ~f, ~k v c, ~j v m, ~i v j, ~f v ~e v ~n, ~f v ~b, ~c v ~h v ~h, ~c v ~c v f, ~c v f v ~h, ~b v ~c, ~a v ~n v j, a v ~c v ~o, b v o, c v ~o, c v ~b, e v ~o v f, e v o v ~a, f v o, h v m, j v b, m v ~k v b, n v d v ~f, o v ~n], 2000, count(8)).
tests(lots_of_small_testcase85, validity, [~o v n v l, ~n v l, ~m v ~h v ~n, ~m v h, ~k v ~f v l, ~i v l, ~h v ~a, ~g v ~l, ~e v ~m, ~d v a v a, ~c v b v ~l, ~c v e, b v k v ~d, c v ~k, c v b v e, c v f, d v ~n, f v ~k, f v f v a, g v ~o, g v a v ~d, h v ~k v c, h v o, i v ~m v ~h, i v ~j, k v f v ~j, l v d v ~o, m v ~g, m v ~d v l, o v o], 2000, count(0)).
tests(lots_of_small_testcase86, validity, [~o v i, ~n v ~g v ~c, ~n v k v ~k, ~l v ~o v e, ~j v e v ~m, ~i v ~o, ~i v c v ~l, ~i v i, ~h v e, ~h v h v ~g, ~g v ~o, ~f v ~k, ~f v c v ~i, ~f v k, ~e v d v h, ~e v o, ~d v ~n v m, ~c v ~f, ~c v e v i, ~a v m, f v c, h v d, i v ~i, j v ~k v ~b, k v ~j v f, l v ~f v ~n, l v ~f v ~m, m v j v f, n v ~f v ~c], 2000, count(44)).
tests(lots_of_small_testcase87, validity, [~o v ~l, ~o v h v ~k, ~n v ~c v a, ~m v ~e v f, ~j v o v ~j, ~i v ~g, ~i v m, ~f v ~o, ~f v b, ~d v d v c, ~b v ~l v ~d, ~b v ~b v b, a v k, a v m v l, c v g, c v o, d v ~c v b, d v e v ~j, d v m v ~d, e v e, f v b v ~j, g v ~n, h v ~l v m, h v ~i v ~o, i v ~b, k v ~f v e, l v ~g v ~f, l v a, m v ~k v c, m v l v ~g], 2000, count(29)).
tests(lots_of_small_testcase88, validity, [~o v ~l v k, ~m v f v g, ~l v ~l, ~l v ~c, ~l v e, ~k v ~c, ~k v ~a, ~i v ~g v j, ~h v f v ~a, ~g v ~d v l, ~f v ~a v ~e, ~d v ~h v h, ~b v ~o, ~b v ~c, ~b v g v ~l, ~b v n, ~a v j, ~a v k v ~m, ~a v o v ~m, b v e v g, c v ~l, d v ~o v ~o, d v ~c, g v ~j, k v n, l v ~m v h, l v ~e, n v k, o v a, o v d], 2000, count(0)).
tests(lots_of_small_testcase89, validity, [~o v ~j, ~n v ~j, ~m v ~e v f, ~m v ~a, ~l v ~n, ~k v ~j, ~k v ~e, ~j v m v m, ~i v ~m v m, ~i v b v d, ~h v ~a v l, ~e v ~m v o, ~d v ~f, ~d v e, ~c v b, ~a v ~m v n, b v ~k, b v f, e v ~k v h, e v ~f, e v j, e v l, f v e, g v ~f, i v ~l v ~i, k v ~n, k v ~d v m, m v ~a, n v ~c v ~g, o v ~a v ~k], 2000, count(84)).
tests(lots_of_small_testcase90, validity, [~o v d, ~i v ~e, ~h v ~g, ~h v i v k, ~g v ~o v b, ~g v e v d, ~f v f, ~e v ~j v f, ~c v c, ~c v f v ~i, ~c v j v i, ~b v h, ~a v i, b v ~n, b v e v g, c v ~i v j, c v n v n, f v ~m, f v ~f, g v ~k v ~j, h v d v g, i v ~l, i v c, k v ~f v n, k v o v m, l v ~d, l v o, l v o v ~k, m v g v f, n v ~h v ~b], 2000, count(44)).
tests(lots_of_small_testcase91, validity, [~n v ~k v h, ~n v o v k, ~l v ~n, ~l v ~b, ~k v m v k, ~h v e, ~h v o v i, ~g v ~a, ~e v ~c v i, ~e v k, ~d v o v ~g, ~c v l, ~b v ~n, ~b v ~m, ~b v l v i, a v m, b v o v o, c v ~h, c v k, e v ~a, e v n v ~m, f v h v ~h, g v ~a, h v h, j v ~c v g, j v ~a, k v ~a, m v ~c, n v ~j v e, o v ~c v ~g], 2000, count(12)).
tests(lots_of_small_testcase92, validity, [~o v ~c, ~o v d v f, ~l v ~k, ~l v ~j v ~a, ~l v a, ~j v k, ~g v h, ~g v j, ~f v ~c v ~m, ~e v h v h, ~c v ~n v ~e, ~c v h v ~i, b v ~n v h, b v ~j v ~j, d v c, f v ~d, f v g, f v m, g v ~c, g v h v j, h v ~d v c, h v b, h v g, h v l v ~m, i v ~o, j v m, k v ~i, n v ~k v e, n v ~d v ~b], 2000, count(116)).
tests(lots_of_small_testcase93, validity, [~n v f, ~m v ~i v ~f, ~m v ~a, ~l v ~n, ~l v ~b v ~k, ~l v f v j, ~k v ~k v ~h, ~k v c v ~i, ~j v ~m v ~a, ~j v b v ~l, ~g v h v m, ~f v o, a v ~i, b v ~c, b v k v ~o, c v ~k v i, d v ~f, e v l, e v o v ~a, f v ~o v d, f v ~n v e, f v ~f, h v ~c, i v ~k v ~f, k v ~g v ~k, l v i, m v j, m v k, n v ~h v e, o v ~i], 2000, count(40)).
tests(lots_of_small_testcase94, validity, [~o v ~j v k, ~o v k, ~m v ~a, ~k v o v j, ~j v m v n, ~i v f, ~g v ~j v ~a, ~g v m v j, ~f v f, ~e v ~i, ~e v ~e v ~i, ~d v ~k v ~i, ~d v ~c v d, ~d v o v ~g, ~b v f, ~b v k, ~a v h, b v ~b, b v ~a v ~l, b v m v ~h, c v i v ~j, d v m v ~c, e v ~f v d, e v ~f v e, g v o v ~g, j v ~g, m v ~f, m v b v ~l, m v h v c, n v ~d v l], 2000, count(474)).
tests(lots_of_small_testcase95, validity, [~n v i, ~l v l, ~j v ~n, ~i v j, ~g v ~l v ~e, ~g v h v ~i, ~f v e, ~f v f, ~d v ~o, ~d v ~f, ~d v ~f v ~h, ~c v ~e v f, ~b v ~h v ~k, ~b v ~g, ~a v ~m v ~m, ~a v b v f, d v ~j, d v ~b v e, d v ~a v h, d v g v j, e v o v l, f v ~k, h v ~h, h v ~g, j v o v m, l v ~l, l v ~l v ~h, m v h v g, m v n v d, n v j], 2000, count(68)).
tests(lots_of_small_testcase96, validity, [~o v h v ~i, ~m v ~j v j, ~j v ~o v ~o, ~j v ~m, ~j v ~i v f, ~i v ~d, ~i v g, ~h v ~k, ~e v ~d, ~b v o, ~a v l, a v a v h, c v ~o, c v ~j, c v g v ~g, e v ~l v ~i, f v l, f v n v h, g v j v ~c, g v l, i v ~e, j v e v ~j, k v ~f, k v k v i, l v ~b, m v ~f v h, m v o v i, n v ~m, n v n, o v c v k], 2000, count(44)).
tests(lots_of_small_testcase97, validity, [~o v e v a, ~n v ~b v ~m, ~m v b, ~l v ~n v ~a, ~j v ~k, ~i v h v m, ~i v k, ~g v ~j, ~g v ~f v ~m, ~g v ~f v o, ~d v a v i, ~b v h, b v ~j v f, c v e v k, d v ~c, d v b v a, e v i, f v ~l, f v ~c v ~n, h v ~d, h v ~c, i v ~j, i v j v f, j v ~a v ~n, j v l, l v e v ~i, m v ~e, n v ~i v ~h, o v i v ~i], 2000, count(21)).
tests(lots_of_small_testcase98, validity, [~m v b, ~m v k, ~l v ~k, ~j v n, ~i v f v a, ~f v a, ~e v e v ~i, ~d v d v ~n, ~c v ~m, ~a v ~o, b v n, c v ~l, c v ~c v a, c v i, d v j, e v j, f v ~a, f v h v ~e, g v ~b, g v b v ~f, i v ~f v ~c, j v ~g v c, j v ~b, k v ~m v h, l v b v o, l v m, m v n, o v ~g v ~l, o v ~d, o v f v m], 2000, count(24)).
tests(lots_of_small_testcase99, validity, [~o v b, ~n v a v j, ~n v m, ~l v ~a v ~h, ~k v ~d, ~k v ~a v ~c, ~j v k v l, ~i v ~j, ~h v ~d, ~h v j v l, ~h v k v ~n, ~g v j v ~m, ~f v b v ~g, ~e v c v ~a, ~e v h v ~m, ~d v ~j, ~c v ~i v ~g, ~a v ~i, c v ~j, c v k v o, f v j v ~l, h v k v b, i v ~i, i v h v ~l, k v j, l v a, n v ~n, n v m v ~i, o v ~h, o v a], 2000, count(81)).
