import ExpoExternalPurchaseModule from './ExpoExternalPurchaseModule';

// Get the native constant value.
export const PI = ExpoExternalPurchaseModule.PI;

export function hello(): string {
  return ExpoExternalPurchaseModule.hello();
}

export async function setValueAsync(value: string) {
  return await ExpoExternalPurchaseModule.setValueAsync(value);
}