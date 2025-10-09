import abilityTest from './Ability.test';
import SetSetTest from './set.test';
import SetAddTest from './SetAdd.test';
import SetClearTest from './SetClear.test';
import SetConstructorTest from './SetConstructor.test';
import SetDeleteTest from './SetDelete.test';
import setEntriesTest from './SetEntries.test';
import SetForeachTest from './SetForeach.test';
import SetFromTest from './SetFrom.test';
import SetHasTest from './SetHas.test';
import SetKeysTest from './SetKeys.test';
import SetSymbolTest from './SetSymbol.test';
import SetSymbolIteratorTest from './Symboliterator.test';

export default function testsuite() {
  abilityTest();
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