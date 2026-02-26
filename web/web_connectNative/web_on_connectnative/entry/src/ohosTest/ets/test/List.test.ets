import abilityTest from './Ability.test';
import onConnectParameterTest from './OnConnectParameter.test';
import onFailedParameterTest from './OnFailedParameter.test';
import connectNativeParameterTest from './ConnectNativeParameter.test';
import OnDisconnectParameter from './OnDisconnectParameter.test'
import DisconnectNativeParameter from './DisconnectNativeParameter.test'

export default function testsuite() {
  abilityTest();
  onConnectParameterTest();
  onFailedParameterTest();
  connectNativeParameterTest();
  OnDisconnectParameter()
  DisconnectNativeParameter()
}