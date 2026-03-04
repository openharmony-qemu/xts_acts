
import actsNotificationAnsCoveredTest from './actsNotificationAnsCoverTest.test'
import actsEmitterTest from'./actsEmitterTest.test'

export default function testsuite() {
  actsEmitterTest();
  actsNotificationAnsCoveredTest();
}