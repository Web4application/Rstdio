> ## Documentation Index
> Fetch the complete documentation index at: https://anaconda.com/docs/llms.txt
> Use this file to discover all available pages before exploring further.

# Channel management

export const GCell = ({children, className}) => <div className={`grid-table-cell ${className || ""}`} role="cell">
    {children}
  </div>;

export const GTH = ({children, className}) => <div className={`grid-table-th ${className || ""}`} role="columnheader">
    {children}
  </div>;

export const GRow = ({children}) => <div className="grid-table-row">{children}</div>;

export const GBody = ({children}) => <div className="grid-table-body">{children}</div>;

export const GHead = ({children}) => <div className="grid-table-head">{children}</div>;

export const GTable = ({children, className, cols}) => <div className={`grid-table not-prose overflow-hidden rounded-2xl ${className || ""}`} style={{
  "--grid-table-cols": cols
}}>
    {children}
  </div>;

export const Comments = ({children}) => {
  return <div class="my-4 px-5 py-4 overflow-hidden rounded-2xl flex gap-3 border border-zinc-500/20 bg-zinc-50/50 dark:border-zinc-500/30 dark:bg-zinc-500/10" data-callout-type="comments">
      <div class="w-4">
        <svg width="14" height="14" viewBox="0 0 640 640" fill="currentColor" xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" aria-label="Comments">
            <path d="M320 112C434.9 112 528 205.1 528 320C528 434.9 434.9 528 320 528C205.1 528 112 434.9 112 320C112 205.1 205.1 112 320 112zM320 576C461.4 576 576 461.4 576 320C576 178.6 461.4 64 320 64C178.6 64 64 178.6 64 320C64 461.4 178.6 576 320 576zM280 400C266.7 400 256 410.7 256 424C256 437.3 266.7 448 280 448L360 448C373.3 448 384 437.3 384 424C384 410.7 373.3 400 360 400L352 400L352 312C352 298.7 341.3 288 328 288L280 288C266.7 288 256 298.7 256 312C256 325.3 266.7 336 280 336L304 336L304 400L280 400zM320 256C337.7 256 352 241.7 352 224C352 206.3 337.7 192 320 192C302.3 192 288 206.3 288 224C288 241.7 302.3 256 320 256z" />
        </svg>
      </div>
      <div class="text-sm prose min-w-0 w-full">
        {children}
      </div>
    </div>;
};

Channels let administrators curate specific sets of <Tooltip tip="Software files and information about the software, such as its name, version, and description, bundled into a file that can be installed and managed by a package manager.">packages</Tooltip> and control who can access them. By creating virtual channels and applying [policy filters](/anaconda-platform/cloud/admin/policy-filters) to them, you're defining unique sets of packages to meet the needs of specific users. Assigning both a channel and its intended users to a [group](/anaconda-platform/cloud/admin/groups) ensures that only those users can access the packages the channel contains.

<Tip>
  Just getting started? For basic information about channels, see [What is a channel?](/getting-started/concepts/what-is-a-channel)
</Tip>

## Channel types

* **Anaconda channels**: Anaconda hosts several channels that connect to our premium, curated <Tooltip tip="Any storage location from which software or software assets, like packages, can be retrieved and installed on a local computer.">repository</Tooltip> and provide you with thousands of the most popular data science platform software packages available on the open source market today.

* **Community channels**: Community channels provide organizations with access to a broader ecosystem of conda packages that are built and maintained by volunteers in the open-source community. These packages are included in Anaconda's security pipeline and are compatible with Anaconda packages.

  <Note>
    While the individual *packages* in the community channels are maintained by volunteers, the *channels* themselves are hosted and maintained by Anaconda.

    ***

    Community-maintained packages are selected for inclusion in the community channels based on Anaconda's review of their compatibility with Anaconda-built packages.

    ***

    Community channels are not enabled by default. For more information about enabling community channels, see [Enabling community channels](/anaconda-platform/cloud/admin/channels#enabling-community-channels).
  </Note>

  <AccordionGroup>
    <Accordion title="Differences between Anaconda and Community channels">
      <GTable cols="20% 40% 40%">
        <GHead>
          <GRow>
            <GTH>Feature</GTH>
            <GTH>Anaconda official channels</GTH>
            <GTH>Community channels</GTH>
          </GRow>
        </GHead>

        <GBody>
          <GRow>
            <GCell>**Package Maintenance**</GCell>
            <GCell>Maintained by Anaconda</GCell>
            <GCell>Maintained by community contributors</GCell>
          </GRow>

          <GRow>
            <GCell>**Package Security**</GCell>
            <GCell>Comprehensive security review; includes package signatures and CVE curation metadata</GCell>
            <GCell>Security is on par with official channels; CVE reporting</GCell>
          </GRow>

          <GRow>
            <GCell>**Support**</GCell>
            <GCell>Anaconda support</GCell>

            <GCell>
              * Community support
              * Anaconda support
            </GCell>
          </GRow>

          <GRow>
            <GCell>**Policy Use**</GCell>

            <GCell>
              * CVE score
              * CVE status
              * License family
              * conda spec
              * Package age
              * Platform
            </GCell>

            <GCell>
              * CVE score
              * License family
              * conda spec
              * Package age
            </GCell>
          </GRow>
        </GBody>
      </GTable>

      <Note>
        For more information about policies, see [Policy filters](/anaconda-platform/cloud/admin/policy-filters).
      </Note>
    </Accordion>

    <Accordion title="Community channel best practices">
      When building <Tooltip tip="A self-contained, isolated space for installing and running software packages.">environments</Tooltip> using the `community` channel, Anaconda recommends the following best practices:

      * Only use the `community` channel when you cannot find the package you need in Anaconda's channels.

      * When installing packages from the `community` channel, try to get as many dependencies as possible for those packages from Anaconda's channels.

        To accomplish this, use the following syntax when installing packages from the `community` channel:

        ```sh theme={null}
        conda install https://repo.anaconda.cloud/repo/community::<PACKAGE_NAME>
        ```

            <Comments>
              Replace \<PACKAGE\_NAME> with the name of the package you want to install.
            </Comments>

        This helps ensure that the package is compatible with other packages in your environment by instructing conda to install only the named package from the community channel, then use the channels configured in your `.condarc` file to install the dependencies for the environment in priority order.

      * List the community channel in your `.condarc` file at the end of the `channels:` list to give them the lowest priority. Conda will only use this channel when necessary to fulfill transitive package dependencies, because conda's default setting is for strict channel priority.

        Edit the `.condarc` file manually or run the following command to add the community channel to the `channels:` list:

        ```sh theme={null}
        conda config --append channels https://repo.anaconda.cloud/repo/community
        ```

            <Note>
              Because all community packages have a CVE Status of Reported, virtual channels that use community as a source should not include filters for CVE Status in their policies.
            </Note>
    </Accordion>

    <span id="enabling-community-channels" />

    <Accordion title="Enabling community channels">
      Community channels must be enabled by an organization administrator before they can be used. To enable community channels:

      1. [Navigate to your Organizations page](https://anaconda.cloud/profile/organizations).
      2. Select your organization.
      3. Select <Icon icon="network-wired" iconType="regular" /> **Channels** from the left-hand navigation.
      4. Select the **Community packages** tab.
      5. Select **Enable Channel** beside the channel.
      6. Select **Confirm** to accept the Terms of Service (ToS) and enable the channel.

      <Note>
        Access to community channels can also be managed from the <Icon icon="pen-to-square" iconType="regular" /> [Organization Settings page](/anaconda-platform/cloud/admin/organizations#organization-settings).
      </Note>
    </Accordion>
  </AccordionGroup>

* **Virtual channels**: Virtual channels are copies of their source channel. For example, if you create a virtual channel from the Anaconda `main` channel, it contains the same packages as `main`.

  <Note>
    You can create virtual channels using any of Anaconda's hosted channels as a source.
  </Note>

* **External channels**: External channels point to an anaconda.org URL to look for packages.

  <Note>
    You cannot apply [policy filters](./policy-filters) to external channels. Currently, Anaconda only supports connection to external channels located at [https://conda.anaconda.org/](https://conda.anaconda.org/), but we plan to support any URL soon.
  </Note>

## Channel permissions

There are two levels of permissions associated with channels in Anaconda: *internal* and *private*.

* **Internal channels**: Internal channels are visible to all members of your organization who have been assigned a seat.

* **Private channels**: Private channels have their contents restricted to those members who are part of the group the channel is assigned to. For more information about assigning channels to a group, see [Groups](/anaconda-platform/cloud/admin/groups).

Organization Administrators can change the permission level of a channel at any time.

1. From the <Icon icon="network-wired" iconType="regular" /> **Channels** page, open the actions dropdown beside the channel.
2. Select either *Make Channel Internal* or *Make Channel Private*. (Your available option depends on the current permissions level of the channel.)

<Note>
  Private channels that are not assigned to a group are only visible to organization administrators.
</Note>

## Creating a channel

<Tabs>
  <Tab title="Virtual channel">
    1. From the <Icon icon="network-wired" iconType="regular" /> **Channels** page, select **Add channel** to open the Create Channel dialog.
    2. Enter a unique channel name.
    3. Select **Virtual** as your channel type.
    4. Select channel from the **Source** dropdown.
    5. Set the permission level for the channel.
    6. Select **Save**.

    <Note>
      Virtual channels using `community` as a source might take a few minutes to complete.
    </Note>
  </Tab>

  <Tab title="External channel">
    1. From the <Icon icon="network-wired" iconType="regular" /> **Channels** page, select **Add channel** to open the Create Channel dialog.

    2. Enter a unique channel name.

    3. Select **External** as your channel type.

    4. Enter a valid anaconda.org channel URL.

           <CodeGroup>
             ```sh External channel format theme={null}
             https://conda.anaconda.org/<CHANNEL_NAME>
             ```

             ```sh Example  theme={null}
             https://conda.anaconda.org/bioconda
             ```
           </CodeGroup>

    5. Set the permission level for the channel.

    6. Select **Save**.

    <Note>
      Creation time for external channels varies based on the size of the source channel.
    </Note>
  </Tab>
</Tabs>

## Channel tracking

Track your channels to receive emails at configurable intervals to keep up-to-date with the latest changes to your channels' contents.

1. From the <Icon icon="network-wired" iconType="regular" /> **Channels** page, select **Channel Tracking** to view the **Track Channels** page.

   <Note>
     You can also track a channel from the channel details page.
   </Note>

2. Select your channel from the list, choose which types of emails you would like to receive, and then set the frequency at which you would like to receive them. You can receive emails in realtime, daily, or weekly.

   <Tip>
     Because deltas are generated when the policy filter runs, the realtime option can generate a maximum of one email every four hours.
   </Tip>

3. Select **Save** to retain your changes.

   <Frame>
     <img src="https://mintcdn.com/anaconda-29683c67/38V1XTpdo_dUNFXe/images/ap_channel_tracking_configs.png?fit=max&auto=format&n=38V1XTpdo_dUNFXe&q=85&s=5280313b8dce2686dcbd0fcd1a238d9f" alt="Channel tracking configurations" width="1922" height="1030" data-path="images/ap_channel_tracking_configs.png" />
   </Frame>
