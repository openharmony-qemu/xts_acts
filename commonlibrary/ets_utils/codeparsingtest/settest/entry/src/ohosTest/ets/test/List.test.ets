import SetSetTest from './set/set.test';
import SetAddTest from './set/SetAdd.test';
import SetClearTest from './set/SetClear.test';
import SetConstructorTest from './set/SetConstructor.test';
import SetDeleteTest from './set/SetDelete.test';
import setEntriesTest from './set/SetEntries.test';
import SetForeachTest from './set/SetForeach.test';
import SetFromTest from './set/SetFrom.test';
import SetHasTest from './set/SetHas.test';
import SetKeysTest from './set/SetKeys.test';
import SetSymbolTest from './set/SetSymbol.test';
import SetSymbolIteratorTest from './set/Symboliterator.test';

export default function testsuite() {
  SetSetTest();
  SetAddTest();
  SetClearTest();
  SetConstructorTest();
  SetDeleteTest();
  setEntriesTest();
  SetForeachTest();
  SetFromTest();
  SetHasTest();
  SetKeysTest();
  SetSymbolTest();
  SetSymbolIteratorTest();
}