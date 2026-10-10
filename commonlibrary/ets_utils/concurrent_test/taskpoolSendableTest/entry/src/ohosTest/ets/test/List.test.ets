import taskpoolTestContainer from './TaskpoolTestContainer.test';
import taskPoolSendableNameSpaceTest from './TaskPoolSendableNameSpace.test';
import taskPoolSendableTest from './TaskPoolSendable.test';
import taskPoolSendableTest2 from './TaskPoolSendableTest.test';
import taskPoolIntegrationTest from './TaskPoolIntegrationTest.test';

export default function testsuite() {
  taskpoolTestContainer();
  taskPoolSendableNameSpaceTest();
  taskPoolSendableTest2();
  taskPoolIntegrationTest();
  taskPoolSendableTest();
}
