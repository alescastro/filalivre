# Fila Livre

**Fila Livre** é um aplicativo mobile desenvolvido em Flutter que simula um sistema de fila virtual para estabelecimentos. O objetivo do app é permitir que usuários entrem em filas de atendimento remotamente, evitando esperas físicas e melhorando a organização do fluxo de clientes.

---

## Funcionalidades principais

- Cadastro e seleção de estabelecimentos para entrar na fila
- Visualização da posição atual na fila em tempo real
- Notificações sobre a proximidade do atendimento
- Simulação completa do fluxo de fila virtual, ideal para estudos e prototipagem
- Interface simples, intuitiva e responsiva, com foco em usabilidade

---

## Tecnologias utilizadas

- Flutter (Dart) para desenvolvimento multiplataforma (iOS e Android)
- Gerenciamento de estado com Provider / Bloc / outro (ajustar conforme o que usa)
- Notificações locais para avisos da fila
- Design baseado em Material Design, com cores e elementos modernos

---

## Como executar

1. Clone este repositório:
   git clone https://github.com/seuusuario/fila-livre.git

2. Instale as dependências:
flutter pub get

3. Rode o app:
flutter run

Estrutura do projeto
lib/data/ - Dados consumidos para view de establishment.
lib/screens/ - Telas do app (lista de estabelecimentos, fila, notificações, etc).
lib/assets/ - Imagens componentes da interface.
lib/services/ - Serviços e lógica para gerenciamento da fila e notificações
lib/widgets/ - Componentes reutilizáveis da interface

Próximos passos e melhorias
Integração com backend real para fila online
Geolocalização para validar entrada apenas dentro do estabelecimento
Sistema de autenticação para usuários e estabelecimentos
Histórico de filas e relatórios para estabelecimentos

Contato
Para dúvidas, sugestões ou contribuições, entre em contato:
Alexandre Castro – castroale646@gmail.com