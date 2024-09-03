import { EventEmitter, Subscription } from 'expo-modules-core';
import ExpoExternalPurchaseModule from './ExpoExternalPurchaseModule';
const emitter = new EventEmitter(ExpoExternalPurchaseModule);

export type ExternalPurchaseEvent = {
  result: string;
}
export function addExternalPurchaseListener(listener: (event: ExternalPurchaseEvent) => void): Subscription {
  return emitter.addListener<ExternalPurchaseEvent>('onChangeExternalPurchase', listener);
}
export async function canPresentAsync(): Promise<boolean> {
  return await ExpoExternalPurchaseModule.canPresentAsync();
}
export async function presentNoticeSheetAsync(): Promise<string> {
  return await ExpoExternalPurchaseModule.presentNoticeSheetAsync();
}