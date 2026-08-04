import NativeSendableContainerStress from './NativeSendableContainerStress.test';
import NapiSendableContainerSupplementTest from './NapiSendableContainerSupplement.test';
import NativeSendableObjectTest from './NativeSendableObject.test';
import napiAsyncTest from './NapiAsyncTest.test';
import napiSendableContainerTest from './NapiSendableContainer.test';

export default function testsuite() {
  NapiSendableContainerSupplementTest();
  NativeSendableContainerStress();
  NativeSendableObjectTest();
  napiAsyncTest();
  napiSendableContainerTest();
}