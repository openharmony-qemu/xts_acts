import abilityTest from './Ability.test';
import objectAssignTest from './object/ObjectAssign.test';
import objectConstructorTest from './object/ObjectConstructor.test';
import objectEntriesTest from './object/ObjectEntries.test';
import objectFromEntriesTest from './object/ObjectFromEntries.test';
import objectGetOwnPropertyNamesTest from './object/ObjectGetOwnPropertyNames.test';
import objectHasOwnTest from './object/ObjectHasOwn.test';
import objectHasOwnPropertyTest from './object/ObjectHasOwnProperty.test';
import objectKeysTest from './object/ObjectKeys.test';
import objectPropertyKeyTest from './object/ObjectPropertyKey.test';
import objectToLocaleStringTest from './object/ObjectToLocaleString.test';
import objectToStringTest from './object/ObjectToString.test';
import objectValuesTest from './object/ObjectValues.test';

export default function testsuite(): void {
  abilityTest();
  objectAssignTest();
  objectConstructorTest();
  objectEntriesTest();
  objectFromEntriesTest();
  objectGetOwnPropertyNamesTest();
  objectHasOwnTest();
  objectHasOwnPropertyTest();
  objectKeysTest();
  objectPropertyKeyTest();
  objectToLocaleStringTest();
  objectToStringTest();
  objectValuesTest();
}
