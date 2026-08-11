# HANDOFF

## Goal
Собрать каноническую базу знаний по инструментам платформы 1С:Предприятие 8.3, начиная с подсистемы «Инструменты разработчика» (RDT1C) и инструмента «Исследователь объектов».

## Verified state
- Репозиторий `1c-platform-tools` создан как публичный платформенный knowledge-repo.
- ADR-0001 зафиксировал scope: платформа, а не конкретная конфигурация.
- ADR-0002 зафиксировал версионирование через YAML-frontmatter, без папок `versions/`.
- Model Council сошёлся на tool-first структуре и разделении `docs/` vs `sessions/`.

## Decisions locked
- Один репозиторий, без submodules.
- `github-playbook` не хранит предметный контент этого репо, только ссылку-стандарт.
- Канон живёт в `docs/`, сырьё и ход сессий — в `sessions/`.
- Git tags используются только как снапшоты состояния репозитория.
- Версионный контекст хранится в frontmatter (`platform_verified_on`, `rdt_version`, `verification`, `discarded`).

## Constraints
- Не создавать `versions/8.3.x.x/`.
- Не смешивать platform/tool knowledge с конфигурационными фиксациями из `*-devlab`.
- Не писать утверждения вида «всегда/на всех версиях» без статуса `externally-confirmed`.
- Не удалять опровергнутые гипотезы — фиксировать их как знание.

## First action
Создать каркас `docs/tools/ir-object-explorer/` и первую каноническую страницу по `Ис()` / `Исследовать()` с frontmatter и указанием статуса верификации.

## Last promoted artifacts
- `adr/0001-scope-platform-not-configuration.md`
- `adr/0002-versioning-via-frontmatter.md`

## Last raw session
- Пока не создан. Следующая сессия должна завести raw-note в `sessions/` через `scripts/new-session.ps1`.
