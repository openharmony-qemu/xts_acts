import builtinContainerSendableObjectTest from './BuiltinContainerSendableObject.test';
import baselibContainerSendableObjectTest from './BaselibContainerSendableObject.test';
import collectionsContainerSendableObjectTest from './CollectionsContainerSendableObject.test';
import normalContainerSendableObjectTest from './NormalContainerSendableObject.test';
import concurrentSharedObjectRWTest from './ConcurrentSharedObjectRW.test';
import sendableChainTest from './SendablesChain.test';
import sendableGroupTest from './SendablesGroup.test';
import sendableGroupWithAllocTest from './SendablesGroupWithAlloc.test';
import sendablesTest from './SendablesTest.test';
import sendablesTestWithAlloc from './SendablesTestWithAlloc.test';

export default function testsuite() {
  builtinContainerSendableObjectTest();
  baselibContainerSendableObjectTest();
  collectionsContainerSendableObjectTest();
  normalContainerSendableObjectTest();
  concurrentSharedObjectRWTest();
  sendableChainTest();
  sendableGroupTest();
  sendableGroupWithAllocTest();
  sendablesTest();
  sendablesTestWithAlloc();
}