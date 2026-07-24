<p align="center">
  <img width="900" height="500" alt="image" src="https://github.com/user-attachments/assets/2c068a6c-d82b-4a43-ad32-d9fe559e1837" />
</p>

# Okta JML Lifecycle Automation

This lab covers automating the joiner, mover, and leaver lifecycle using PowerShell scripts against Active Directory, with changes synced to Okta through the AD Agent. Includes individual scripts for onboarding, role changes, and offboarding, plus a CSV-driven batch script that processes multiple lifecycle events in a single run.

---

## Prerequisites
This is the sixth lab of the [Okta IAM Lab Series](https://github.com/RyanKennon/Okta-Lab-Series/tree/main).
Complete all previous labs before starting this one.
The following should be in place before starting:
- Active Okta Integrator org with users, groups, and policies configured from previous labs
- Active Directory integration configured and synced from Lab 2
- RBAC group structure in place from Lab 3 (Finance, IT, Human Resources, Helpdesk, Cloud Engineer)
- PowerShell 7 installed on the domain controller
- `_DisabledUsers` OU created in Active Directory (used for offboarded/leaver accounts)

---

## Environments and Technologies Used
- Okta Identity Engine (Integrator Free Plan)
- Active Directory (Kennon Technologies domain)
- PowerShell 7
- Active Directory Module for PowerShell
- Okta AD Agent

---

## Table of Contents
1. [Joiner Onboarding Script](#1-joiner-onboarding-script)
2. [Mover Role Change Script](#2-mover-role-change-script)
3. [Leaver Offboarding Script](#3-leaver-offboarding-script)
4. [CSV-Driven Batch Processing](#4-csv-driven-batch-processing)

---

### 1) Joiner Onboarding Script

1. On the **Domain Controller** open **PowerShell 7** and run this **[Onboarding Script](./scripts/Onboard-Joiner.ps1)**

<p align="center">
  <img width="988" height="521" alt="image" src="https://github.com/user-attachments/assets/1db4b503-1cd1-4df5-908d-9d5e033cf100" />
</p>

2. In **Okta** run an **Incremental Import**
3. Open the **Groups** tab then open the **IT** group
4. Confirm the **Emily Rhodes** appears in the **IT** group

<p align="center">
  <img width="1012" height="667" alt="image" src="https://github.com/user-attachments/assets/4f1d9c55-37f2-437f-9b34-50cf6959a4ef" />
</p>

---

### 2) Mover Role Change Script

1. In the **Domain Controller** run the **[Mover Role Change Script](/scripts/Mover-Role-Change.ps1)** in **PowerShell 7**

<p align="center">
  <img width="982" height="515" alt="image" src="https://github.com/user-attachments/assets/38a8b68d-a5ff-47a8-81a0-5ba5c4e592bc" />
</p>

2. In **Okta** run an **Incremental Import**
3. Open the **Groups** tab then open the **Finance** group
4. Confirm the **Emily Rhodes** appears in the **Finance** group

<p align="center">
  <img width="1012" height="674" alt="image" src="https://github.com/user-attachments/assets/45d7fb53-31bd-4e09-af83-d029fba55dff" />
</p>

5. Confirm the **Emily Rhodes** no longer appears in the **IT** group

<p align="center">
  <img width="1017" height="621" alt="image" src="https://github.com/user-attachments/assets/3f7afd53-ff51-4f9e-bcb8-1cd5ecf45a51" />
</p>

---

### 3) Leaver Offboarding Script

1. In the **Domain Controller** run the **[Offboarding Script](/scripts/offboarding-script.ps1)** in **PowerShell 7**

<p align="center">
  <img width="984" height="518" alt="image" src="https://github.com/user-attachments/assets/3f04805e-e2ee-44aa-a093-8b7aad123a4b" />
</p>

2. In **Okta** run an **Incremental Import**
3. Open the **Groups** tab then open the **Finance** group
4. Confirm the **Emily Rhodes** no longer appears in the **Finance** group

<p align="center">
  <img width="1013" height="623" alt="image" src="https://github.com/user-attachments/assets/71b9dab4-bd30-4b46-addf-90d538b8c7fd" />
</p>

5. Open the **People** tab
6. Confirm the **Emily Rhodes** account has the **Deactivated** status

<p align="center">
  <img width="1024" height="365" alt="image" src="https://github.com/user-attachments/assets/6a4c1879-9347-45e3-bc6a-59eef8a1463f" />
</p>

---

### 4) CSV-Driven Batch Processing

1. In the **Domain Controller** create a **csv file** that matches my [CSV File](/jml-batch.csv) on the **Desktop** named **jml-batch.csv**
2. Then in **PowerShell 7** run the [Batch Script](/scripts/Batch-Script.ps1)

<p align="center">
  <img width="985" height="519" alt="image" src="https://github.com/user-attachments/assets/84c1d02f-41a3-40fa-b26e-457fa8b13c2e" />
</p>

3. In **Okta** run a **Full Import**
4. Open the **People** tab and confirm that **Lisa Park** has the **Deactivated Status** and **Mike Chen** has the **Active** status

<p align="center">
  <img width="1020" height="510" alt="image" src="https://github.com/user-attachments/assets/bf5a101a-4a1a-402b-aed6-0c80231780a2" />

</p>

5. Open the **Groups** tab then open the **Human Resources** Group
6. Confirm that **Mike Chen** appears and **Bob Johnson** no longer appears

<p align="center">
  <img width="1020" height="613" alt="image" src="https://github.com/user-attachments/assets/351a1d67-5b78-4cdb-89a9-1500bcb5582c" />
</p>

7. Go to the **Finance** group and confirm that **Bob Johnson** appears

<p align="center">
  <img width="1003" height="691" alt="image" src="https://github.com/user-attachments/assets/3098611f-4ada-42ad-b5b3-a334d493b5d7" />
</p>

---

> **Note:** This lab is intentionally left open. The lifecycle automation scripts 
> configured here serve as the foundation for subsequent Okta labs. Continue 
> to the [Okta IAM Lab Series](https://github.com/RyanKennon/Okta-Lab-Series/tree/main) 
> for the next lab in the series.

---
<p align="left">
  <a href="https://github.com/RyanKennon/okta-mfa-adaptive-authentication">⬅ Lab 5 — Okta MFA & Adaptive Authentication</a>
</p>
