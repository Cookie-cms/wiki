# Why CookieCMS?

CookieCMS — это современная альтернатива популярным CMS для игровых проектов, таким как WebMCR, SimpleCabinet и DLE.  
Система разрабатывается с упором на удобство, безопасность и масштабируемость, что делает её идеальным выбором для разработчиков и администраторов игровых проектов.

**Преимущества CookieCMS:**
- Поддержка современных методов авторизации (Discord)
- Безопасное хранение паролей (argon2/bcrypt)
- Удобная панель администратора
- Полная интеграция с Gravit Launcher
- Масштабируемость и поддержка PostgreSQL

## Auhors

<!-- Coffeedev (backend) - [https://coffeedev.dev](https://coffeedev.dev)
Vakood (frontend) - [https://vakood.dev](https://vakood.github.io/vakood.dev/) -->

<script setup>
  import {
    VPTeamPage,
    VPTeamPageTitle,
    VPTeamMembers
  } from 'vitepress/theme'

  const members = [
    {
      avatar: 'https://avatars.githubusercontent.com/u/88631273?s=400&u=fcc9105b2375274f8f55f83c44a4b260e08de643&v=4',
      name: 'Coffeewithoutsugar',
      title: 'Backend Developer',
      links: [
        { icon: 'github', link: 'https://github.com/wonkiest29' },
        { icon: 'firefoxbrowser', link: 'https://coffeedev.dev/' },
      ]
    },
    {
      avatar: 'https://avatars.githubusercontent.com/u/142260596?v=4',
      name: 'Vakood',
      title: 'Frontend Developer',
      links: [
        { icon: 'github', link: 'https://github.com/Vakood' },
        { icon: 'firefoxbrowser', link: 'https://vakood.github.io/vakood.dev' }
    ]
    }
  ]

</script>

  <VPTeamMembers :members="members" />


---
<details>
<summary>Как протестировать?</summary>

В данный момент раздел находится в разработке. Следите за обновлениями!

</details>


<small>Ждем от вас отзыв Гравита :3</small>
