Below is a **clean, repeatable Azure CLI script** you can use to **provision and deprovision a demo Azure environment** for customer demos (FinOps / Governance / AZ-104 level).

This is **production-realistic but intentionally misconfigured** to showcase:

* Cost waste
* Governance gaps
* Optimization opportunities

No Bicep/Terraform required (keep friction low for demos).

---

# 🧩 What This Demo Environment Creates

**Resources (low cost):**

* Resource Group
* Virtual Network + Subnet
* Oversized VM (intentional)
* Public IP (unused)
* Storage Account (no lifecycle policy)
* No tags (on purpose)

Estimated cost if left running: **~€10–15/month**

---

# ✅ Prerequisites

* Azure CLI installed
* Logged in:

```bash
az login
az account set --subscription "<SUBSCRIPTION_ID>"
```
### Before the demo

```bash
chmod +x demo-provision.sh
./demo-provision.sh
```

Wait ~5 minutes.

---

### During the demo, show:

* **Cost Management**

  * Oversized VM
  * Forecasted spend
* **Azure Advisor**

  * Right-sizing
  * Idle resources
* **Governance gaps**

  * No tags
  * No budgets
  * No shutdown schedule

Say:

> “This is exactly what we see in many EU SME Azure subscriptions.”

---

### After the demo

```bash
chmod +x demo-destroy.sh
./demo-destroy.sh
```

---

# 🔐 Why This Script Is Perfect for Sales

* AZ-104 aligned
* Safe (isolated RG)
* Cheap
* Repeatable
* No customer access required
* Demonstrates **real operational maturity**

---

# 🚀 Optional Enhancements (Tell Me If You Want These)

I can add:

* 🔔 Budget + cost alert script
* 🏷️ Tagging + Azure Policy demo
* 🌙 Auto-shutdown schedule
* 📊 Power BI cost export
* 🔐 Security misconfigurations (Defender demo)

👉 Which enhancement do you want next?
