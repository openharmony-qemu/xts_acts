'use static';
import NestedArrayConcurrentTest from './NestedArrayConcurrentTest.test';
import NestedMapConcurrentTest from './NestedMapConcurrentTest.test';

export default function nestedContainerList(): void {
  NestedArrayConcurrentTest();
  NestedMapConcurrentTest();
}
