import napiAsyncTest from './NapiAsyncTest.test';
import napiSendableContainerTest from './NapiSendableContainer.test';

export default function testsuite() {
  napiAsyncTest();
  napiSendableContainerTest();
}