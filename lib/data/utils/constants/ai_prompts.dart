class AiPrompts {
  static aiAssignmentPrompt({
    required String wordsLength,
    required String topic,
    required String keyPoints,
    required String citation,
  }) {
    return 'Create a unique and plagiarism-free assignment within range of ${wordsLength.trim()} words on ${topic.trim()}. Ensure the assignment includes the following sections: Introduction, Thesis Statement, Body (with at least in context of given key points [${keyPoints.trim()}] supported by evidence and personal insights), and Conclusion. Conduct thorough research using reputable sources, and cite all references properly using ${citation.trim()} citation style. Reflect on your own experiences and observations to add originality. The final assignment should be well-organized, coherent, and demonstrate a deep understanding of the topic.';
  }

  static smartEmailPrompt(
      {required String length,
      required String tone,
      required String keyPoints,
      required String toName,
      required String fName}) {
    return 'Write a ${length.trim()} and ${tone.trim()} email for ${keyPoints.trim()} to ${toName.isNotEmpty ? toName.trim() : "[Receiver Name]"} from ${fName.isNotEmpty ? fName.trim() : "[Sender Name]"}';
  }
}
