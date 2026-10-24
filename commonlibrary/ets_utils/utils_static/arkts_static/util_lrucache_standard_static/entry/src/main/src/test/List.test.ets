'use static';

import lruCacheAfterRemovalTest from './LRUCache/LruCacheAfterRemovalTest.test';
import lruCacheClearTest from './LRUCache/LruCacheClearTest.test';
import lruCacheConstructorTest from './LRUCache/LruCacheConstructorTest.test';
import lruCacheContainsTest from './LRUCache/LruCacheContainsTest.test';
import lruCacheCreateDefaultTest from './LRUCache/LruCacheCreateDefaultTest.test';
import lruCacheEntriesTest from './LRUCache/LruCacheEntriesTest.test';
import lruCacheGetCapacityTest from './LRUCache/LruCacheGetCapacityTest.test';
import lruCacheGetCreateCountTest from './LRUCache/LruCacheGetCreateCountTest.test';
import lruCacheGetMatchCountTest from './LRUCache/LruCacheGetMatchCountTest.test';
import lruCacheGetMissCountTest from './LRUCache/LruCacheGetMissCountTest.test';
import lruCacheGetPutCountTest from './LRUCache/LruCacheGetPutCountTest.test';
import lruCacheGetRemovalCountTest from './LRUCache/LruCacheGetRemovalCountTest.test';
import lruCacheGetTest from './LRUCache/LruCacheGetTest.test';
import lruCacheIsEmptyTest from './LRUCache/LruCacheIsEmptyTest.test';
import lruCacheIteratorTest from './LRUCache/LruCacheIteratorTest.test';
import lruCacheKeysTest from './LRUCache/LruCacheKeysTest.test';
import lruCachePropertiesTest from './LRUCache/LruCachePropertiesTest.test';
import lruCachePutTest from './LRUCache/LruCachePutTest.test';
import lruCacheRemoveTest from './LRUCache/LruCacheRemoveTest.test';
import lruCacheToStringTest from './LRUCache/LruCacheToStringTest.test';
import lruCacheUpdateCapacityTest from './LRUCache/LruCacheUpdateCapacityTest.test';
import lruCacheValuesTest from './LRUCache/LruCacheValuesTest.test';

export default function testsuite(): void {
  lruCacheAfterRemovalTest();
  lruCacheClearTest();
  lruCacheConstructorTest();
  lruCacheContainsTest();
  lruCacheCreateDefaultTest();
  lruCacheEntriesTest();
  lruCacheGetCapacityTest();
  lruCacheGetCreateCountTest();
  lruCacheGetMatchCountTest();
  lruCacheGetMissCountTest();
  lruCacheGetPutCountTest();
  lruCacheGetRemovalCountTest();
  lruCacheGetTest();
  lruCacheIsEmptyTest();
  lruCacheIteratorTest();
  lruCacheKeysTest();
  lruCachePropertiesTest();
  lruCachePutTest();
  lruCacheRemoveTest();
  lruCacheToStringTest();
  lruCacheUpdateCapacityTest();
  lruCacheValuesTest();
}
