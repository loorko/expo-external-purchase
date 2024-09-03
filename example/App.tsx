import { 
  StyleSheet, 
  Text, 
  View,
  Button,
  Alert } from 'react-native';
import * as ExpoExternalPurchase from 'expo-external-purchase';
import { useEffect } from 'react';

export default function App() {
  useEffect(()=>{
    console.log(ExpoExternalPurchase);
    const subscription = ExpoExternalPurchase.addExternalPurchaseListener(({ result: newResult }) => {
      console.log(newResult)
    });
    return () => subscription.remove();
  },[])

  const checkIfCanPresent = async () => {
    try {
      const canPresent = await ExpoExternalPurchase.canPresentAsync();
      if (canPresent) {
        try {
          const result = await ExpoExternalPurchase.presentNoticeSheetAsync();
          console.log('Notice sheet presented successfully:', result);
          Alert.alert('It is working');
        } catch (error) {
          console.error('Failed to present notice sheet:', error);
          Alert.alert('Failed to present notice sheet:', error.message); // Add error message for user feedback
        }
      } else {
        Alert.alert('The notice sheet cannot be presented.');
      }
    } catch (error) {
      console.error('Failed to check if can present:', error);
      Alert.alert('Failed to check if can present:', error.message); // Add error message for user feedback
    }
  };
    
  return (
    <View style={styles.container}>
      <Text>Instacar</Text>
      <Button
        onPress={checkIfCanPresent}
        title={'Apple Expo External Purchase'}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
