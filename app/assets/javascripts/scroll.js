function  scrollLastMessageIntoView() {
    const messages = document.querySelectorAll('.message');
    const lastMessage = messages[messages.length - 1];

    if (messages.length > 0) {
      lastMessage.scrollIntoView()
    };
}
