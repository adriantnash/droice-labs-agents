# Background Check Investigator Agent

## Overview

The `background-check-investigator` is a Claude Code sub-agent built for Droice Labs staff to research individuals prior to scheduled meetings. It produces structured, professional background reports in Microsoft Word (.docx) format using only publicly available information.

## Purpose

Droice Labs is a Contract Research Organization (CRO) specializing in converting electronic health record (EHR) data into formats suitable for regulatory approval submissions. Before meetings with partners, vendors, clients, or collaborators, this agent helps the team arrive informed and prepared.

## Trigger Conditions

This agent activates when a user mentions an upcoming meeting and requests background research on the individual. Examples:

- *"I have a meeting with Dr. Jane Smith from BioData Corp next Tuesday. Can you run a background check?"*
- *"We're meeting with John Karimi from RegulatoryEdge Consulting on Friday. Please do a background check."*

## Configuration

| Setting | Value |
|---|---|
| **Agent Name** | `background-check-investigator` |
| **Model** | `claude-sonnet-4-6` (Sonnet) |
| **File Location** | `.claude/agents/background-check-investigator.md` |
| **Memory Path** | `.claude/agent-memory/background-check-investigator/` |

## Research Sources

The agent pulls from the following publicly accessible sources:

- Company websites (official bios, leadership pages, press releases)
- Academic and institutional websites (faculty pages, publications)
- News articles and press coverage
- Conference and event listings
- Published research (PubMed, Google Scholar)
- Government and regulatory databases (FDA advisory committees, ClinicalTrials.gov)
- Patent databases (USPTO, Espacenet)
- Public professional databases (Crunchbase, ZoomInfo public portions)

> **Note:** LinkedIn and platforms with terms of service restricting automated access are flagged for manual human review — the agent will not attempt to circumvent bot-detection or access restrictions.

## Output Format

The agent generates a `.docx` report with the following sections:

1. **About Summary** — 2–4 paragraph professional narrative
2. **Work History** — reverse-chronological roles with titles, organizations, dates, and highlights
3. **Educational Background** — degrees, institutions, graduation years, honors
4. **Sources Consulted** — all URLs and references used
5. **Researcher Notes** — gaps, caveats, and sources recommended for manual review

## Ethical & Legal Boundaries

- Only publicly available information is used
- No fabrication, inference beyond evidence, or speculation
- No collection of sensitive personal data (health, financial, political/religious affiliations)
- Terms of service and bot-detection systems are never circumvented
- Gaps are reported clearly rather than filled with assumptions

## Workflow

1. Clarify subject identity (full name, employer, any other identifiers)
2. Search systematically across all source categories
3. Cross-reference findings for accuracy
4. Draft and format the Word document
5. Quality check (all statements sourced, no speculation)
6. Deliver the file with a brief verbal summary

## Agent Memory

The agent maintains persistent memory at `.claude/agent-memory/background-check-investigator/` to build institutional knowledge across conversations, including:

- Previously researched individuals and report locations
- Recurring organizations Droice Labs engages with
- Reliable source patterns by industry
- Sources found to be unreliable or outdated

## Changelog

| Date | Version | Change |
|---|---|---|
| 2026-03-23 | 1.0.0 | Initial agent created and documented |
