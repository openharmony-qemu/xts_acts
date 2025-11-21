import paddingTest1 from './padding/PaddingBaseTest.test';
import paddingTest2 from './padding/PaddingBaseLengthTest.test';
import paddingTestContainer1 from './padding/PaddingContainerTest.test';
import paddingTestContainer2 from './padding/PaddingContainerLengthTest.test';

export default function testsuite() {

  paddingTest1(); //web
  paddingTest2();//web
  paddingTestContainer1();
  paddingTestContainer2();

}
