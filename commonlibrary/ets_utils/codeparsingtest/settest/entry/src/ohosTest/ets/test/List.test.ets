import MapClearTest from './set/MapClear.test';
import MapConstructorTest from './set/MapConstructor.test';
import MapDeleteTest from './set/MapDelete.test';
import MapEntriesTest from '/set./MapEntries.test';
import MapForeachTest from '/set./MapForeach.test';
import MapGetTest from './set/MapGet.test';
import MapHasTest from './set/MapHas.test';
import MapKeyTest from './set/MapKey.test';
import MapSymbolSpeciesTest from './set/MapSymbolSpecies.test';
import MapValueTest from './set/MapValue.test';

export default function testsuite() {
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