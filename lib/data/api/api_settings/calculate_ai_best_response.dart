class CalculateBestResponse {
  // function to calculate coherence score (similarity to input message)
  static double coherenceScore(String inputMessage, String response) {
    double jaccardSimilarity =
    calculateJaccardSimilarity(inputMessage, response);
    return jaccardSimilarity;
  }

// function to calculate relevance score (based on context or preferences)
  static double relevanceScore(String response) {
    // Example: calculate relevance score based on predefined criteria or user preferences
    // You can customize this based on your specific requirements
    // Here's a simple example where relevance score is constant:
    return 0.5; // Example: relevance score of 0.5 (neutral)
  }

// function to calculate Jaccard similarity coefficient
  static double calculateJaccardSimilarity(
      String inputMessage, String response) {
    Set<String> inputTokens = inputMessage.split(' ').toSet();
    Set<String> responseTokens = response.split(' ').toSet();
    Set<String> intersection = inputTokens.intersection(responseTokens);
    Set<String> union = inputTokens.union(responseTokens);
    double similarity = intersection.length / union.length;
    return similarity;
  }
}