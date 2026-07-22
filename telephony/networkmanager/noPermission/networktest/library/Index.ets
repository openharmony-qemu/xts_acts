import libtrafficfilter from 'libtrafficfilter.so';

namespace TrafficFilter{
  export interface RuleConfig extends libtrafficfilter.RuleConfig{
  }

  export interface CreateRedirectInfo extends libtrafficfilter.CreateRedirectInfo{
  }

  export interface ConnectionInfo extends libtrafficfilter.ConnectionInfo{
  }

  export interface ProcessInfo extends libtrafficfilter.ProcessInfo{
  }

  export function CreateRedirector(groupId: number, priority: number):CreateRedirectInfo {
    return libtrafficfilter.CreateRedirector(groupId,priority);
  }

  export function DestroyRedirector(redirector: number | null):number{
    return libtrafficfilter.DestroyRedirector(redirector);
  }

  export function AddRedirectRule(redirector: number | null, rule: RuleConfig | null): number{
    return libtrafficfilter.AddRedirectRule(redirector,rule);
  }

  export function ClearRedirectRule(redirector: number | null): number{
    return libtrafficfilter.ClearRedirectRule(redirector);
  }

  export function QueryProcess(connection: ConnectionInfo): ProcessInfo{
    return libtrafficfilter.QueryProcess(connection);
  }

}

export default TrafficFilter;