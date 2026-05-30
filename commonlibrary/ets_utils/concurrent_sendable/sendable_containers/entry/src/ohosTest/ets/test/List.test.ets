import builtinContainerSendableObjectTest from './BuiltinContainerSendableObject.test';
import baselibContainerSendableObjectTest from './BaselibContainerSendableObject.test';
import collectionsContainerSendableObjectTest from './CollectionsContainerSendableObject.test';
import normalContainerSendableObjectTest from './NormalContainerSendableObject.test';
import concurrentSharedObjectRWTest from './ConcurrentSharedObjectRW.test';

export default function testsuite() {
  builtinContainerSendableObjectTest();
  baselibContainerSendableObjectTest();
  collectionsContainerSendableObjectTest();
  normalContainerSendableObjectTest();
  concurrentSharedObjectRWTest();
}