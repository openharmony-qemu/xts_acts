import abilityTest from './Ability.test';
import onConnectParameterTest from './OnConnectParameter.test';
import onDisconnectParameterTest from './OnDisconnectParameter.test';
import onFailedParameterTest from './OnFailedParameter.test';
import connectNativeParameterTest from './ConnectNativeParameter.test';
import disconnectNativeParameterTest from './DisconnectNativeParameter.test';

export default function testsuite() {
  abilityTest();
  onConnectParameterTest();
  onFailedParameterTest();
  connectNativeParameterTest();
  disconnectNativeParameterTest();
}