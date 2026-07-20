<p align="center">
  <img width="900" height="500" alt="image" src="https://github.com/user-attachments/assets/2c068a6c-d82b-4a43-ad32-d9fe559e1837" />
</p>

# okta-jml-lifecycle-automation

---

### 1) Joiner Onboarding Script

1. On the **Domain Controller** open **PowerShell 7** and run this **[Onboarding Script](./scripts/Onboard-Joiner.ps1)**

<p align="center">
  <img width="988" height="521" alt="image" src="https://github.com/user-attachments/assets/1db4b503-1cd1-4df5-908d-9d5e033cf100" />
</p>

2. In **Okta** run a **Incremental Import**
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

2. In **Okta** run a **Incremental Import**
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

2. In **Okta** run a **Incremental Import**
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

1. In the **Domain Controller** save the [CSV File](/scripts/jml-batch.csv.txt) to the **Desktop**
2. Then in **PowerShell 7** run the [Batch Script](/scripts/Batch-Script.ps1)

<p align="center">
  
</p>
