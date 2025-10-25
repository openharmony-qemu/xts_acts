import MapClearTest from './map/MapClear.test';
import MapConstructorTest from './map/MapConstructor.test';
import MapDeleteTest from './map/MapDelete.test';
import MapEntriesTest from '/map/MapEntries.test';
import MapForeachTest from '/map/MapForeach.test';
import MapGetTest from './map/MapGet.test';
import MapHasTest from './map/MapHas.test';
import MapKeyTest from './map/MapKey.test';
import MapSymbolSpeciesTest from './map/MapSymbolSpecies.test';
import MapValueTest from './map/MapValue.test';

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