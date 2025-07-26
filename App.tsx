import { StatusBar } from "expo-status-bar";
import {
  Appearance,
  StyleSheet,
  Text,
  useColorScheme,
  View,
  TouchableOpacity,
  Alert,
} from "react-native";
import { LinearGradient } from "expo-linear-gradient";

export default function App() {
  const theme = useColorScheme(); // 'light' or 'dark'
  const isDark = theme === "dark";

  const handleButtonPress = () => {
    Alert.alert("Button Pressed", "Your gradient button works!");
  };

  return (
    <View
      style={[styles.container, { backgroundColor: isDark ? "#000" : "#fff" }]}
    >
      <Text style={{ color: isDark ? "#fff" : "#000", marginBottom: 30 }}>
        System theme is {theme}
      </Text>

      {/* Gradient Button */}
      <TouchableOpacity
        onPress={handleButtonPress}
        style={styles.buttonContainer}
      >
        <LinearGradient
          colors={isDark ? ["#667eea", "#764ba2"] : ["#f093fb", "#f5576c"]}
          start={{ x: 0, y: 0 }}
          end={{ x: 1, y: 1 }}
          style={styles.gradientButton}
        >
          <Text style={styles.buttonText}>Gradient Button</Text>
        </LinearGradient>
      </TouchableOpacity>

      <StatusBar style={isDark ? "light" : "dark"} hidden />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center",
  },
  buttonContainer: {
    borderRadius: 25,
    overflow: "hidden",
    elevation: 5,
    shadowColor: "#000",
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.25,
    shadowRadius: 3.84,
  },
  gradientButton: {
    paddingVertical: 15,
    paddingHorizontal: 30,
    borderRadius: 25,
    alignItems: "center",
    justifyContent: "center",
  },
  buttonText: {
    color: "#fff",
    fontSize: 18,
    fontWeight: "bold",
  },
});
