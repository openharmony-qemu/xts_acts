import abilityTest from './Ability.test';
import MapClearTest from './MapClear.test';
import MapConstructorTest from './MapConstructor.test';
import MapDeleteTest from './MapDelete.test';
import MapEntriesTest from './MapEntries.test';
import MapForeachTest from './MapForeach.test';
import MapGetTest from './MapGet.test';
import MapHasTest from './MapHas.test';
import MapKeyTest from './MapKey.test';
import MapSymbolSpeciesTest from './MapSymbolSpecies.test';
import MapValueTest from './MapValue.test';

export default function testsuite() {
  abilityTest();
  MapClearTest();
  MapConstructorTest();
  MapDeleteTest();
  MapEntriesTest();
  MapForeachTest();
  MapGetTest();
  MapHasTest();
  MapKeyTest();
  MapSymbolSpeciesTest();
  MapValueTest();
}