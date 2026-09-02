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

import keyedCollections01Test from './map2/KeyedCollections_01.test';
import keyedCollections06Test from './map2/KeyedCollections_06.test';
import keyedCollections07Test from './map2/KeyedCollections_07.test';
import keyedCollections08Test from './map2/KeyedCollections_08.test';
import keyedCollections09Test from './map2/KeyedCollections_09.test';
import keyedCollections11Test from './map2/KeyedCollections_11.test';
import keyedCollections17Test from './map2/KeyedCollections_17.test';

import mapBigIntTest from "./map3/MapBigIntTest.test";
import mapBooleanTest from "./map3/MapBooleanTest.test";
import mapClassTest from "./map3/MapClassTest.test";
import mapDateTest from "./map3/MapDateTest.test";
import mapFunctionTest from "./map3/MapFunctionTest.test";
import mapMapTest from "./map3/MapMapTest.test";
import mapNestedTest from "./map3/MapNestedTest.test";
import mapNumberTest from "./map3/MapNumberTest.test";
import mapObjectTest from "./map3/MapObjectTest.test";
import mapRegExpTest from "./map3/MapRegExpTest.test";
import mapSetTest from "./map3/MapSetTest.test";
import mapStringTest from "./map3/MapStringTest.test";
import mapSymbolTest from "./map3/MapSymbolTest.test";
import mapUnionTest from "./map3/MapUnionTest.test";

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

  keyedCollections01Test();
  keyedCollections06Test();
  keyedCollections07Test();
  keyedCollections08Test();
  keyedCollections09Test();
  keyedCollections11Test();
  keyedCollections17Test();

  mapBigIntTest();
  mapBooleanTest();
  mapClassTest();
  mapDateTest();
  mapFunctionTest();
  mapMapTest();
  mapNestedTest();
  mapNumberTest();
  mapObjectTest();
  mapRegExpTest();
  mapSetTest();
  mapStringTest();
  mapSymbolTest();
  mapUnionTest();
}