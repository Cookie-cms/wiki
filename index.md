---
# https://vitepress.dev/reference/default-theme-home-page
layout: home

hero:
  name: "Cookiecms"
  text: "Cms for minecraft projects"
  tagline: My great project tagline
  actions:
    - theme: brand
      text: Installation
      link: /1.0/
    - theme: alt
      text: API
      link: /1.0/

features:
  - title: Feature A
    details: Lorem ipsum dolor sit amet, consectetur adipiscing elit
  - title: Feature B
    details: Lorem ipsum dolor sit amet, consectetur adipiscing elit
  - title: Feature C
    details: Lorem ipsum dolor sit amet, consectetur adipiscing elit
---

<script setup>
import { VPTeamMembers } from 'vitepress/theme'

const members = [
  {
    avatar: 'https://avatars.githubusercontent.com/u/88631273?v=4',
    name: 'Coffeewithoutsugar',
    title: 'Devloper',
    links: [
      { icon: 'github', link: 'https://github.com/Wonkiest29' },
      { icon: 'discord', link: 'https://discord.gg/3ggAmneTss' }
    ]
  },
]
</script>



Our Team

Say hello to our awesome team.

<VPTeamMembers size="small" :members="members" />