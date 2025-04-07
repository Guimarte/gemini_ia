# Gemini Click ✨🤖

**Gemini Click** é um aplicativo Flutter que integra a IA Gemini do Google, permitindo interações inteligentes por meio de uma interface simples e intuitiva.

## 📱 Visão Geral

O aplicativo possibilita que os usuários enviem mensagens de texto e recebam respostas geradas pela IA Gemini, funcionando como um chat interativo com inteligência artificial.

## 🚀 Tecnologias Utilizadas

- [Flutter](https://flutter.dev)
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [flutter_gemini](https://pub.dev/packages/flutter_gemini)

## 📂 Estrutura do Projeto

gemini_ia/ ├── android/ ├── ios/ ├── lib/ │ ├── features/ │ │ └── home/ │ │ ├── bloc/ │ │ │ ├── home_bloc.dart │ │ │ ├── home_event.dart │ │ │ └── home_state.dart │ │ ├── mixin/ │ │ │ └── home_mixin.dart │ │ └── presentation/ │ │ └── home_page.dart │ └── main.dart ├── test/ ├── pubspec.yaml └── README.md

## ⚙️ Configuração e Execução

1. **Clone o repositório:**

   ```bash
    git clone https://github.com/Guimarte/gemini_ia.git
    
    cd gemini_ia

    flutter pub get

    flutter run --dart-define=GEMINI_KEY=SUA_CHAVE_AQUI
    
✨ Funcionalidades

✅ Interação com a IA Gemini

✅ Envio e recebimento de mensagens via interface de chat

✅ Gerenciamento de estado com BLoC

✅ UI moderna e responsiva

## 🧑‍💻 Autor
Desenvolvido por Guimarte

## 📄 Licença
Este projeto está licenciado sob a licença MIT.