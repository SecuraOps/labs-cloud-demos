# Configure settings

## To configure guest user access
1. Sign in to the Microsoft Entra admin center.

2. Browse to Entra ID > External Identities > External collaboration settings.

3. Under Guest user access, choose the level of access you want guest users to have:

    - **Guest users have the same access as members (most inclusive)**: This option gives guests the same access to Microsoft Entra resources and directory data as member users.

    - **Guest users have limited access to properties and memberships of directory objects**: (Default) This setting blocks guests from certain directory tasks, like enumerating users, groups, or other directory resources. Guests can see membership of all non-hidden groups. Learn more about default guest permissions.

    - **Guest user access is restricted to properties and memberships of their own directory objects (most restrictive)**: With this setting, guests can access only their own profiles. Guests aren't allowed to see other users' profiles, groups, or group memberships.

## To configure guest invite settings
1. Sign in to the Microsoft Entra admin center.

2. Browse to Entra ID > External Identities > External collaboration settings.

3. Under Guest invite settings, choose the appropriate settings:

    - **Anyone in the organization can invite guest users including guests and non-admins (most inclusive)**: To allow guests in the organization to invite other guests including users who aren't members of an organization, select this radio button.
    - **Member users and users assigned to specific admin roles can invite guest users including guests with member permissions**: To allow member users and users who have specific administrator roles to invite guests, select this radio button.
    - **Only users assigned to specific admin roles can invite guest users**: To allow only those users with User Administrator or Guest Inviter roles to invite guests, select this radio button.
    - **No one in the organization can invite guest users including admins (most restrictive)**: To deny everyone in the organization from inviting guests, select this radio button.

## To configure guest self-service sign-up
1. Sign in to the Microsoft Entra admin center.

2. Browse to Entra ID > External Identities > External collaboration settings.

3. Under **Enable guest self-service sign up via user flows**, select **Yes** if you want to be able to create user flows that let users sign up for apps. For more information about this setting, see Add a self-service sign-up user flow to an app.

## To configure external user leave settings
1. Sign in to the Microsoft Entra admin center.

2. Browse to Entra ID > External Identities > External collaboration settings.

3. Under **External user leave settings**, you can control whether external users can remove themselves from your organization.

    - **Yes**: Users can leave the organization themselves without approval from your admin or privacy contact.
    - **No**: Users can't leave your organization themselves. They see a message guiding them to contact your admin or privacy contact to request removal from your organization.

> **Important**
>> You can configure External user leave settings only if you have added your privacy information to your Microsoft Entra tenant. Otherwise, this setting will be unavailable.

## To configure collaboration restrictions (allow or block domains)
 
> **Important**
>> Microsoft recommends that you use roles with the fewest permissions. This practice helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios or when you can't use an existing role.

1. Sign in to the Microsoft Entra admin center.

2. Browse to Entra ID > External Identities > External collaboration settings.

3. Under **Collaboration restrictions**, you can choose whether to allow or deny invitations to the domains you specify and enter specific domain names in the text boxes. For multiple domains, enter each domain on a new line. For more information, see Allow or block invitations to B2B users from specific organizations.


