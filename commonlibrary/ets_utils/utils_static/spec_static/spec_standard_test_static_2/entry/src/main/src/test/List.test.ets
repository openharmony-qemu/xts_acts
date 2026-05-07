/*---
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import ExpressionsIndexingArrayTest from "./expressions/indexing_expression/array_indexing_expression/ExpressionsIndexingArray.test";
import ExpressionsIndexingRecordTest from "./expressions/indexing_expression/record_indexing_expression/ExpressionsIndexingRecord.test";
import ExpressionsIndexingStringTest from "./expressions/indexing_expression/string_indexing_expression/ExpressionsIndexingString.test";
import ExpressionsInstanceTest from "./expressions/instanceof_expression/ExpressionsInstance.test";
import ExpressionsInstanceOneTest from "./expressions/instanceof_expression/ExpressionsInstanceOne.test";
import ExpressionsInstanceTwoTest from "./expressions/instanceof_expression/ExpressionsInstanceTwo.test";
import ExpressionsInstanceThreeTest from "./expressions/instanceof_expression/ExpressionsInstanceThree.test";
import LambdaExpressionTest from "./expressions/lambda_expression/LambdaExpression.test";
import LambdaBodyTest from "./expressions/lambda_expression/lambda_body/LambdaBody.test";
import LambdaExpressionTypeTest from "./expressions/lambda_expression/lambda_expression_type/LambdaExpressionType.test";
import RuntimeEvaluationOfLambdaExpressionsTest from "./expressions/lambda_expression/runtime_evaluation_of_lambda_expressions/RuntimeEvaluationOfLambdaExpressions.test";
import ExpressionsMethodCallTest from "./expressions/method_call_expression/ExpressionsMethodCall.test";
import ExpressionsMethodStepTest from "./expressions/method_call_expression/step_selection_of_type_to_use/ExpressionsMethodStep.test";
import ExpressionsMethodStepOneTest from "./expressions/method_call_expression/step_selection_of_method/ExpressionsMethodStepOne.test";
import ExpressionsMethodStepTwoTest from "./expressions/method_call_expression/step_checking_method_modifiers/ExpressionsMethodStepTwo.test";
import ExpressionsMethodTypeTest from "./expressions/method_call_expression/type_of_method_call_expression/ExpressionsMethodType.test";
import ExpressionsMultiplicativeDivisionTest from "./expressions/multiplicative_expressions/division/ExpressionsMultiplicativeDivision.test";
import ExpressionsMultiplicativeExpressionTest from "./expressions/multiplicative_expressions/ExpressionsMultiplicativeExpression.test";
import ExpressionsMultiplicationTest from "./expressions/multiplicative_expressions/multiplication/ExpressionsMultiplication.test";
import MultiplicationIntResultTest from "./expressions/multiplicative_expressions/multiplication/int_result/MultiplicationIntResult.test";
import MultiplicationIntResultOneTest from "./expressions/multiplicative_expressions/multiplication/int_result/MultiplicationIntResultOne.test";
import MultiplicationIntResultTwoTest from "./expressions/multiplicative_expressions/multiplication/int_result/MultiplicationIntResultTwo.test";
import MultiplicationIntResultThreeTest from "./expressions/multiplicative_expressions/multiplication/int_result/MultiplicationIntResultThree.test";
import MultiplicationIntResultFourTest from "./expressions/multiplicative_expressions/multiplication/int_result/MultiplicationIntResultFour.test";
import MultiplicationIntResultFiveTest from "./expressions/multiplicative_expressions/multiplication/int_result/MultiplicationIntResultFive.test";
import MultiplicationLongResultTest from "./expressions/multiplicative_expressions/multiplication/long_result/MultiplicationLongResult.test";
import MultiplicationLongResultOneTest from "./expressions/multiplicative_expressions/multiplication/long_result/MultiplicationLongResultOne.test";
import MultiplicationLongResultTwoTest from "./expressions/multiplicative_expressions/multiplication/long_result/MultiplicationLongResultTwo.test";
import MultiplicationLongResultThreeTest from "./expressions/multiplicative_expressions/multiplication/long_result/MultiplicationLongResultThree.test";
import ExpressionsMultiplicativeRemainderTest from "./expressions/multiplicative_expressions/remainder/ExpressionsMultiplicativeRemainder.test";

export default function testsuite(): void {
  ExpressionsIndexingArrayTest();
  ExpressionsIndexingRecordTest();
  ExpressionsIndexingStringTest();
  ExpressionsInstanceTest();
  ExpressionsInstanceOneTest();
  ExpressionsInstanceTwoTest();
  ExpressionsInstanceThreeTest();
  LambdaExpressionTest();
  LambdaBodyTest();
  LambdaExpressionTypeTest();
  RuntimeEvaluationOfLambdaExpressionsTest();
  ExpressionsMethodCallTest();
  ExpressionsMethodStepTest();
  ExpressionsMethodStepOneTest();
  ExpressionsMethodStepTwoTest();
  ExpressionsMethodTypeTest();
  ExpressionsMultiplicativeDivisionTest();
  ExpressionsMultiplicativeExpressionTest();
  ExpressionsMultiplicationTest();
  MultiplicationIntResultTest();
  MultiplicationIntResultOneTest();
  MultiplicationIntResultTwoTest();
  MultiplicationIntResultThreeTest();
  MultiplicationIntResultFourTest();
  MultiplicationIntResultFiveTest();
  MultiplicationLongResultTest();
  MultiplicationLongResultOneTest();
  MultiplicationLongResultTwoTest();
  MultiplicationLongResultThreeTest();
  ExpressionsMultiplicativeRemainderTest();
}