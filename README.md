# expo-external-purchase

https://developer.apple.com/documentation/storekit/external_purchase#4327460

# Installation in managed Expo projects

```
npx expo install expo-external-purchase
```

# Settings

```
{
  "expo": {
    ...
    "ios": {
      "supportsTablet": true,
      "bundleIdentifier": "com.your.bundleIdentifier",
      "entitlements": {
        "com.apple.developer.storekit.external-purchase": true,
        "aps-environment": "development"
      },
      "infoPlist": {
        "SKExternalPurchase": ["hu"]
      }
    }
    ...
  }
}
```

# How to use
```
import { 
  StatusBar } from 'expo-status-bar';
import { 
  StyleSheet, 
  Text, 
  View,
  Button,
  Alert } from 'react-native';
import * as ExpoExternalPurchase from 'expo-external-purchase';
import { useEffect } from 'react';

export default function App() {
  const checkIfCanPresent = async () => {
    try {
      const canPresent = await ExpoExternalPurchase.canPresentAsync();
      if (canPresent) {
        try {
          const result = await ExpoExternalPurchase.presentNoticeSheetAsync();
          console.log('Notice sheet presented successfully:', result);
          Alert.alert('It is working');
          // Call your backend API with token
        } catch (error) {
          console.error('Failed to present notice sheet:', error);
          Alert.alert('Failed to present notice sheet:', error.message);
        }
      } else {
        Alert.alert('The notice sheet cannot be presented.');
      }
    } catch (error) {
      console.error('Failed to check if can present:', error);
      Alert.alert('Failed to check if can present:', error.message);
    }
  };

  return (
    <View style={styles.container}>
      <Text>Apple Expo External Purchase</Text>
      <StatusBar style="auto" />
      <Button
        onPress={checkIfCanPresent}
        title={'Present Apple Notice Sheet'}
      />
    </View>
  );
}
```
```
eas build --profile development --platform ios
```