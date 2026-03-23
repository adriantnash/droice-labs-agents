# Background Check Investigator Agent

## Overview

The `background-check-investigator` is a Claude Code sub-agent built for Droice Labs staff to research individuals prior to scheduled meetings. It produces structured, professional background reports in Microsoft Word (.docx) format using only publicly available information.

## Purpose

Droice Labs is a Contract Research Organization (CRO) specializing in converting electronic health record (EHR) data into formats suitable for regulatory approval submissions. Before meetings with partners, vendors, clients, or collaborators, this agent helps the sales team arrive informed and prepared.

The agent targets **C-suite and VP-level leaders at pharmaceutical or biotech companies** who are involved in sponsoring or executing clinical trials.

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

## Input

For each person being researched, provide:

| Field | Required |
|---|---|
| Full name | Yes |
| Company / organization | Yes |
| Job title | Yes |
| LinkedIn profile URL | Recommended |
| Email address | Optional |

When multiple people from the same company are provided, the agent produces a **combined report** — individual sections per person plus a single shared organization section.

## Research Sources

### Individual Research
- **LinkedIn URL (as search anchor)** — Used to guide Google searches for cached/indexed profile content, company bios, and speaker profiles. Also noted in the report for manual review by the sales team.
- **Company websites** — Official bios, leadership pages, press releases
- **Academic and institutional websites** — Faculty pages, research profiles
- **News articles and press coverage** — Interviews, announcements, industry features
- **Conference and event listings** — Speaking engagements, panelist bios, abstracts
- **Published research** — PubMed, Google Scholar, journal websites (with direct links)
- **ClinicalTrials.gov** — Investigator and principal investigator records
- **Government and regulatory databases** — FDA advisory committee rosters
- **Patent databases** — USPTO, Espacenet

### Organization Research (prioritized order)
1. Active and recent clinical trials (ClinicalTrials.gov)
2. Drug and treatment pipeline
3. Company funding stage and financials
4. Recent partnerships, acquisitions, and licensing deals
5. Key recent news (FDA decisions, trial readouts, leadership changes)

## Output Format

A `.docx` report, 1–2 pages per individual plus an organization section. For meetings with multiple people from the same company, a combined report is generated.

### Individual Sections
1. **Professional Summary** — LinkedIn-quality 3–5 paragraph narrative (third person, specific, sourced facts only)
2. **Employment History** — Reverse-chronological, with titles, organizations, dates, and role descriptions
3. **Publications & Research** — Full citations with direct links; relevance to RWE/EHR/clinical evidence noted
4. **ClinicalTrials.gov — Trial Involvement** — Trials as investigator/PI with NCT numbers and direct links
5. **LinkedIn Profile** — URL noted for manual sales team review
6. **Sources Consulted**
7. **Researcher Notes** — Gaps, caveats, sources recommended for manual review

### Organization Section
1. **Active & Recent Clinical Trials** — ClinicalTrials.gov records with NCT links, indication, phase, status
2. **Pipeline Overview** — Therapeutic areas, asset names, development stages
3. **Company Stage & Funding** — Public/private, market cap or funding rounds
4. **Recent Partnerships, Acquisitions & Licensing**
5. **Key Recent News**
6. **Sources Consulted**

## Ethical & Legal Boundaries

- Only publicly available information is used
- LinkedIn and platforms with terms of service restricting automated access are flagged for manual human review — the agent will not attempt to circumvent bot-detection or access restrictions
- No fabrication, inference beyond evidence, or speculation
- No collection of sensitive personal data (health, financial, political/religious affiliations)
- Gaps are reported clearly rather than filled with assumptions

## Workflow

1. Clarify subject identity (full name, employer, job title, LinkedIn URL)
2. Research each individual systematically across all source categories
3. Research the organization once (shared across all individuals from the same company)
4. Cross-reference findings for accuracy
5. Draft and format the Word document
6. Quality check (all statements sourced, publications and trials have direct links, no speculation)
7. Deliver the file with a brief verbal summary

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
| 2026-03-23 | 2.0.0 | Refined for C-suite/VP pharma-biotech targets; added LinkedIn URL as search anchor; deepened employment history and publications (with direct links); added ClinicalTrials.gov investigator lookup; added full organization profile section (trials, pipeline, funding, partnerships, news); added combined report structure for multi-person meetings |
