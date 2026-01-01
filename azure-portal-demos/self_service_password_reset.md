# Enable self-service password reset
1. Sign in to the Microsoft Entra admin center as at least an Authentication Policy Administrator.

2. Browse to Entra ID > Password reset.

3. From the Properties page, under the option Self service password reset enabled, choose Selected.

4. If your group isn't visible, choose No groups selected, browse for and select your Microsoft Entra group, like SSPR-Test-Group, and then choose Select.

# Select authentication methods and registration options

1. From the menu on the left side of the Authentication methods page, set the Number of methods required to reset to 2.

    To improve security, you can increase the number of authentication methods required for SSPR.

2. Choose the Methods available to users that your organization wants to allow. For this tutorial, enable the following methods:

    - Mobile app notification
    - Mobile app code
    - Email
    - Mobile phone
3. To apply the authentication methods, select Save.

# Set up notifications and customizations
1. From the menu on the left side of the Notifications page, set up the following options:
    - Set **Notify users on password resets?** option to Yes.
    - Set **Notify all admins when other admins reset their password?** to Yes.
2. To apply the notification preferences, select Save.

# Enable password writeback for SSPR
1. Sign in to the Microsoft Entra admin center as a Global Administrator.
2. Browse to Entra ID > Password reset, then choose On-premises integration.
3. Check the option for Write back passwords to your on-premises directory .
4. (optional) If Microsoft Entra Connect provisioning agents are detected, you can additionally check the option for Write back passwords with Microsoft Entra Connect cloud sync.
5. Check the option for Allow users to unlock accounts without resetting their password to Yes.
6. When ready, select Save.