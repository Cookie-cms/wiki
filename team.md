---
layout: page
---

<script setup>
  import {
    VPTeamPage,
    VPTeamPageTitle,
    VPTeamMembers
  } from 'vitepress/theme'

  const members = [
    {
      avatar: 'https://www.github.com/yyx990803.png',
      name: '1',
      title: '1',
      links: [
        { icon: 'github', link: 'https://github.com/yyx990803' },
        { icon: 'twitter', link: 'https://twitter.com/youyuxi' }
      ]
    }
  ]
</script>

<VPTeamPage>
  <VPTeamPageTitle>
    <template #title> Наша команда </template>
    <template #lead>
      Разработкой VitePress руководит международная команда, некоторые члены
      которой представлены ниже.
    </template>
  </VPTeamPageTitle>
  <VPTeamMembers :members="members" />
</VPTeamPage>