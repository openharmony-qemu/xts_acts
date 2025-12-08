import MapClearTest from './map/MapClear.test';
import MapConstructorTest from './map/MapConstructor.test';
import MapDeleteTest from './map/MapDelete.test';
import MapEntriesTest from './map/MapEntries.test';
import MapForeachTest from './map/MapForeach.test';
import MapGetTest from './map/MapGet.test';
import MapHasTest from './map/MapHas.test';
import MapKeyTest from './map/MapKey.test';
import MapSymbolSpeciesTest from './map/MapSymbolSpecies.test';
import MapValueTest from './map/MapValue.test';
import MapComboTest from './map1/map_combo.test';
import MapUnionTest from './map1/map_union.test';

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
  MapComboTest();
  MapUnionTest();
}