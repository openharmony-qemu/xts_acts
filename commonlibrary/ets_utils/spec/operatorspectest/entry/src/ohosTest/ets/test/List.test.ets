import ArithmeticOperatorTest from "./ArithmeticOperatorTest.test";
import AssignmentOperatorTest from "./AssignmentOperatorTest.test";
import BitwiseOperatorTest from "./BitwiseOperatorTest.test";
import ComparisonOperatorTest from "./ComparisonOperatorTest.test";
import ConditionalTernaryOperatorTest from "./ConditionalTernaryOperatorTest.test";
import LogicalOperatorTest from "./LogicalOperatorTest.test";
import OperatorPrecedenceTest from "./OperatorPrecedenceTest.test";
import StringOperatorTest from "./StringOperatorTest.test";
import UnaryOperatorTest from "./UnaryOperatorTest.test";


export default function testsuite(): void {
  OperatorPrecedenceTest();
  ArithmeticOperatorTest();
  BitwiseOperatorTest();
  AssignmentOperatorTest()
  ComparisonOperatorTest()
  ConditionalTernaryOperatorTest()
  LogicalOperatorTest()
  UnaryOperatorTest();
  StringOperatorTest()
}
