'use static';
import IndustryBlockingQueueConcurrentTest from './IndustryBlockingQueueConcurrentTest.test';
import IndustryCacheConcurrentTest from './IndustryCacheConcurrentTest.test';

export default function industryList(): void {
  IndustryBlockingQueueConcurrentTest();
  IndustryCacheConcurrentTest();
}
