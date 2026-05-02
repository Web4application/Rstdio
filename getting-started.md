> ## Documentation Index
> Fetch the complete documentation index at: https://docs.discord.com/llms.txt
> Use this file to discover all available pages before exploring further.

# Building your first Discord Bot

> Step-by-step tutorial for building your first Discord app.

export const GlobeEarthIcon = props => <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none"><path fill="currentColor" fill-rule="evenodd" d="M23 12a11 11 0 1 1-22 0 11 11 0 0 1 22 0Zm-4.16 5.85A9 9 0 0 0 15 3.52V4a3 3 0 0 1-3 3h-.77c-.13 0-.23.1-.23.23A2.77 2.77 0 0 1 8.23 10c-.13 0-.23.1-.23.23v1.52c0 .14.11.25.25.25H13a3 3 0 0 1 3 3v.77c0 .13.1.23.23.23 1.2 0 2.23.77 2.61 1.85ZM3.18 10.18A9 9 0 0 0 11 20.94v-2.7c0-.14-.1-.24-.23-.24h-.65A2.12 2.12 0 0 1 8 15.88c0-.56-.22-1.1-.62-1.5l-4.2-4.2Z" clip-rule="evenodd" /></svg>;

export const UserIcon = props => <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none"><path fill="currentColor" d="M12 10a4 4 0 1 0 0-8 4 4 0 0 0 0 8ZM11.53 11A9.53 9.53 0 0 0 2 20.53c0 .81.66 1.47 1.47 1.47h.22c.24 0 .44-.17.5-.4.29-1.12.84-2.17 1.32-2.91.14-.21.43-.1.4.15l-.26 2.61c-.02.3.2.55.5.55h11.7a.5.5 0 0 0 .5-.55l-.27-2.6c-.02-.26.27-.37.41-.16.48.74 1.03 1.8 1.32 2.9.06.24.26.41.5.41h.22c.81 0 1.47-.66 1.47-1.47A9.53 9.53 0 0 0 12.47 11h-.94Z" /></svg>;

export const WrenchIcon = props => <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none"><path fill="currentColor" d="M7.8 15.77c.7.43 1.2 1.14 1.2 1.96V21a1 1 0 0 0 1 1h4a1 1 0 0 0 1-1v-3.27c0-.82.5-1.53 1.2-1.96a8.06 8.06 0 0 0 .12-13.63c-.6-.39-1.32.09-1.32.8v5.98a1 1 0 0 1-1 1h-4a1 1 0 0 1-1-1V2.94c0-.71-.72-1.19-1.32-.8a8.06 8.06 0 0 0 .12 13.63Z" /></svg>;

export const AppsIcon = props => <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none"><path fill="currentColor" d="M2.06 7.61c-.25.95.31 1.92 1.26 2.18l4.3 1.15c.94.25 1.91-.31 2.17-1.26l1.15-4.3c.25-.94-.31-1.91-1.26-2.17l-4.3-1.15c-.94-.25-1.91.31-2.17 1.26l-1.15 4.3ZM12.98 7.87a2 2 0 0 0 1.75 2.95H20a2 2 0 0 0 1.76-2.95l-2.63-4.83a2 2 0 0 0-3.51 0l-2.63 4.83ZM5.86 13.27a.89.89 0 0 1 1.28 0l.75.77a.9.9 0 0 0 .54.26l1.06.12c.5.06.85.52.8 1.02l-.13 1.08c-.02.2.03.42.14.6l.56.92c.27.43.14 1-.28 1.26l-.9.58a.92.92 0 0 0-.37.48l-.36 1.02a.9.9 0 0 1-1.15.57l-1-.36a.89.89 0 0 0-.6 0l-1 .36a.9.9 0 0 1-1.15-.57l-.36-1.02a.92.92 0 0 0-.37-.48l-.9-.58a.93.93 0 0 1-.28-1.26l.56-.93c.11-.17.16-.38.14-.59l-.12-1.08c-.06-.5.3-.96.8-1.02l1.05-.12a.9.9 0 0 0 .54-.26l.75-.77ZM18.52 13.71a1.1 1.1 0 0 0-2.04 0l-.46 1.24c-.19.5-.57.88-1.07 1.07l-1.24.46a1.1 1.1 0 0 0 0 2.04l1.24.46c.5.19.88.57 1.07 1.07l.46 1.24c.35.95 1.7.95 2.04 0l.46-1.24c.19-.5.57-.88 1.07-1.07l1.24-.46a1.1 1.1 0 0 0 0-2.04l-1.24-.46a1.8 1.8 0 0 1-1.07-1.07l-.46-1.24Z" /></svg>;

export const LinkButton = ({children, to, color}) => {
  return <a href={to} className={"MDXLinkButton " + color}>
      <span>{children}</span>
    </a>;
};

[Discord apps](/developers/quick-start/overview-of-apps) let you customize and extend Discord using a collection of APIs and interactive features. This guide will walk you through building your first Discord app using JavaScript and by the end you'll have an app that uses slash commands, sends messages, and responds to component interactions.

<Info>
  If you're interested in building a game or social experience in an iframe, you can follow the tutorial for [building an Activity](/developers/activities/building-an-activity)
</Info>

We'll be building a Discord app that lets users play rock-paper-scissors (with 7 choices instead of 3). This guide is beginner-focused, but it assumes a basic understanding of [JavaScript](https://developer.mozilla.org/en-US/docs/Learn/Getting_started_with_the_web/JavaScript_basics).

<Accordion title="What we'll be building" icon="eye">
  Here's what the finished app will look like:

    <img src="https://mintcdn.com/discord/sE9HKfrfcohZiTYN/images/getting-started-demo.gif?s=0ba7c0265ca95beaa9259559eeb63215" alt="Demo of example app" width="800" height="448" data-path="images/getting-started-demo.gif" />

  To make the user flow a bit more explicit:

  1. User A initiates a new game and picks their object using the app's `/challenge` slash command
  2. A message is sent to channel with a button inviting others to accept the challenge
  3. User B presses the **Accept** button
  4. User B is sent an ephemeral message where they select their object of choice
  5. The result of the game is posted back into the original channel for all to see
</Accordion>

<Accordion title="Resources used in this guide" description="Overview of the tools and technologies we'll use" icon="list">
  * **[GitHub repository](https://github.com/discord/discord-example-app)** where the code from this guide lives along with some additional feature-specific code examples.
  * **[discord-interactions](https://github.com/discord/discord-interactions-js)**, a library that provides types and helper functions for Discord apps.
  * **[Express](https://expressjs.com)**, a popular JavaScript web framework we'll use to create a server where Discord can send us requests.
  * **[ngrok](https://ngrok.com/)**, a tool that lets us tunnel our local server to a public URL where Discord can send requests.
</Accordion>

***

## Step 0: Project Setup

Before we get started, you'll need to set up your local environment and get the project code from the [sample app repository](https://github.com/discord/discord-example-app).

<Info>
  We'll be developing our app locally with a little help from [ngrok](https://ngrok.com/), but you can use your preferred development environment.
</Info>

If you don't have [NodeJS](https://nodejs.org/en/download/) installed, install that first.

After NodeJS is installed, open your command line and clone the project code:

```bash  theme={"system"}
git clone https://github.com/discord/discord-example-app.git
```

Then navigate to the directory and install the project's dependencies:

```bash  theme={"system"}
# navigate to directory
cd discord-example-app

# install dependencies
npm install
```

<Accordion title="Project structure" description="Overview of the project structure for the sample app used in this tutorial" icon="code">
  ```
  ├── examples    -> short, feature-specific sample apps
  ├──── app.js  -> finished app.js code
  ├──── button.js
  ├──── command.js
  ├──── modal.js
  ├──── selectMenu.js
  ├── .env        -> your credentials and IDs
  ├── app.js      -> main entrypoint for app
  ├── commands.js -> slash command payloads + helpers
  ├── game.js     -> logic specific to Rock, Paper, Scissors
  ├── utils.js    -> utility functions and constants
  ├── package.json
  ├── README.md
  └── .gitignore
  ```
</Accordion>

With that out of the way, open your new project in the code editor of your choice, and we'll move ahead to setting up your Discord app.

## Step 1: Creating an app

First, you'll need to create an app in the developer portal if you don't have one already:

<LinkButton to="https://discord.com/developers/applications?new_application=true" color="brand">Create App</LinkButton>

Enter a name for your app, then press **Create**.

After you create your app, you'll land on the **General Information** page of the app's settings where you can update basic information about your app like its description and icon. You'll also see an **Application ID** and **Interactions Endpoint URL**, which we'll use a bit later in the guide.

### Fetching your credentials

We'll need to set up and fetch a few sensitive values for your app, like its token and ID.

<Warning>
  Your token is used to authorize API requests and carry your app's permissions, so they are *highly* sensitive. Make sure to never share your token or check it into any kind of version control.
</Warning>

Back in your project folder, rename the `.env.sample` file to `.env`. This is where we'll store all of your app's credentials.

We'll need three values from your app's settings for your `.env` file:

* On the [**General Information** page](https://discord.com/developers/applications/select/information), copy the value for **Application ID**. In `.env`, replace `<YOUR_APP_ID>` with the ID you copied.
* Back on the [**General Information** page](https://discord.com/developers/applications/select/information), copy the value for **Public Key**, which is used to ensure HTTP requests are coming from Discord. In `.env`, replace `<YOUR_PUBLIC_KEY>` with the value you copied.
* On the [**Bot** page](https://discord.com/developers/applications/select/bot) under **Token**, click "Reset Token" to generate a new bot token. In `.env`, replace `<YOUR_BOT_TOKEN>` with your new token.

<Warning>
  You won't be able to view your token again unless you regenerate it, so make sure to keep it somewhere safe (like in a password manager).
</Warning>

Now that you have the credentials you need, lets configure your bot user and installation settings.

### Configuring your bot

Newly-created apps have a bot user enabled by default. Bot users allow your app to appear and behave similarly to other server members when it's [installed to a server](/developers/quick-start/overview-of-apps#where-are-apps-installed).

On the left hand sidebar in your app's settings, there's a [**Bot** page](https://discord.com/developers/applications/select/bot) (where we fetched the token from). On this page, you can also configure settings like its [privileged intents](/developers/events/gateway#privileged-intents) or whether it can be installed by other users.

<Accordion title="What are intents?" description="Introduction to standard and privileged intents">
  Intents determine which events Discord will send your app when you're creating a [Gateway API connection](/developers/events/gateway). For example, if you want your app to perform an action when users add a reaction to a message, you can pass the `GUILD_MESSAGE_REACTIONS` (`1 << 10`) intent.

  Some intents are [privileged](/developers/events/gateway#privileged-intents), meaning they allow your app to access data that may be considered sensitive (like the contents of messages). Privileged intents can be toggled on the **Bot** page in your app's settings, but they must be approved before you [verify your app](https://support-dev.discord.com/hc/en-us/articles/23926564536471-How-Do-I-Get-My-App-Verified). Standard, non-privileged intents don't require any additional permissions or configurations.

  More information about intents and a full list of available intents (along with their associated events) is in the [Gateway documentation](/developers/events/gateway#gateway-intents).
</Accordion>

For now, we don't need to configure anything additional here, but you may need to in the future depending on your app's use case. Let's go ahead and get our app ready for installation.

### Choosing installation contexts

Now we'll select where your app can be installed in Discord, which is determined by the [installation contexts](/developers/resources/application#installation-context) that your app supports.

<Accordion title="What are installation contexts?" description="Overview of where apps can be installed">
  **Installation contexts** determine where your app can be installed: to servers, to users, or both. Apps can choose which installation contexts they support within the app's settings.

  * Apps installed in a **[server context](/developers/resources/application#server-context)** (server-installed apps) must be authorized by a server member with the `MANAGE_GUILD` permission, and are visible to all members of the server.
  * Apps installed in a **[user context](/developers/resources/application#user-context)** (user-installed apps) are visible only to the authorizing user, and therefore don't require any server-specific permissions. Apps installed to a user context are visible across all of the user's servers, DMs, and GDMs—however, they're limited to using commands.
</Accordion>

Click on [**Installation**](https://discord.com/developers/applications/select/installation) in the left sidebar, then under **Installation Contexts** make sure both "User Install" and "Guild Install" are selected.

<Info>
  Some apps may only want to support one installation context—for example, a moderation app may only support a server context. However, by default, we recommend supporting both installation contexts. For detailed information about supporting user-installed apps, you can read the [user-installable app tutorial](/developers/tutorials/developing-a-user-installable-app).
</Info>

### Setting up an install link

[Install links](/developers/resources/application#install-links) provide an easy way for users to install your app in Discord. We'll set up the default [Discord Provided Link](/developers/resources/application#discord-provided-link), but you can read more about the different type of install links in the [Application documentation](/developers/resources/application#types-of-install-links).

On the [**Installation** page](https://discord.com/developers/applications/select/installation), go to the **Install Link** section and select "Discord Provided Link" if it's not already selected.

When Discorded Provided Link is selected, a new **Default Install Settings** section will appear, which we'll configure next.

### Adding scopes and bot permissions

Apps need approval from installing users to perform actions in Discord (like creating a slash command or fetching a list of server members). Let's add scopes and permissions before installing the app.

<Accordion title="What are scopes and permissions?" description="Introduction to scopes and bot permissions">
  When creating an app, scopes and permissions determine what your app can do and access in Discord.

  * [OAuth2 Scopes](/developers/topics/oauth2#shared-resources-oauth2-scopes) determine what data access and actions your app can take, granted on behalf of an installing or authenticating user.
  * [Permissions](/developers/topics/permissions#permission-overwrites) are the granular permissions for your bot user, the same as other users in Discord have. They can be approved by the installing user or later updated within server settings or with [permission overwrites](/developers/topics/permissions#permission-overwrites). Since apps installed to a user context can only respond to commands, these permissions are only relevant to apps installed to a server.
</Accordion>

On the [**Installation** page](https://discord.com/developers/applications/select/installation) in the **Default Install Settings** section:

* For **User Install**, add the `applications.commands` scope
* For **Guild Install**, add the `applications.commands` scope and `bot` scope. When you select `bot`, a new **Permissions** menu will appear to select the bot user's permissions. Select any permissions that you may want for your app—for now, I'll just select `Send Messages`.

<img src="https://mintcdn.com/discord/sE9HKfrfcohZiTYN/images/getting-started-default-install.png?fit=max&auto=format&n=sE9HKfrfcohZiTYN&q=85&s=805050986569b688a100247b0e67b789" alt="Default Install Settings" width="1386" height="622" data-path="images/getting-started-default-install.png" />

See a list of all [OAuth2 scopes](/developers/topics/oauth2#shared-resources-oauth2-scopes), or read more on [permissions](/developers/topics/permissions) in the documentation.

### Installing your app

<Info>
  When developing apps, you should build and test on your user account (for user-installable apps) and in a server that isn't actively used by others (for server-installable apps). If you don't have your own server already, you can [create one for free](https://support.discord.com/hc/en-us/articles/204849977-How-do-I-create-a-server-).
</Info>

Once you add scopes, copy the URL from the **Install Link** section from before.

Since our app is supporting both installation contexts, we'll install your new app to both a test server and your user account so that we can test in both [installation contexts](/developers/resources/application#installation-context).

###### Install to server

To install your app to your test server, copy the default Install Link for your app from the **Installation** page. Paste the link in your browser and hit enter, then select "Add to server" in the installation prompt.

Select your test server, and follow the installation prompt. Once your app is added to your test server, you should see it appear in the member list.

###### Install to user account

Next, install your app to your user account. Paste the same Install Link in your browser and hit enter. This time, select "Add to my apps" in the installation prompt.

Follow the installation prompt to install your app to your user account. Once it's installed you can open a DM with it.

***

## Step 2: Running your app

With your app configured and installed to your test server and account, let's take a look at the code.

<Info>
  To make development a bit simpler, the app uses [discord-interactions](https://github.com/discord/discord-interactions-js), which provides types and helper functions. If you prefer to use other languages or libraries, check out the [Community Resources](/developers/developer-tools/community-resources) documentation.
</Info>

### Installing slash commands

<Info>
  To install slash commands, the app is using [`node-fetch`](https://github.com/node-fetch/node-fetch). You can see the implementation for the installation in `utils.js` within the `DiscordRequest()` function.
</Info>

The project contains a `register` script you can use to install the commands in `ALL_COMMANDS`, which is defined at the bottom of `commands.js`. It installs the commands as global commands by calling the HTTP API's [`PUT /applications/<APP_ID>/commands`](/developers/interactions/application-commands#bulk-overwrite-global-application-commands) endpoint.

If you want to customize your commands or add additional ones, you can reference the command structure in the [commands documentation](/developers/interactions/application-commands#application-command-object-application-command-structure).

In your terminal within the project folder, run the following command:

```
npm run register
```

If you navigate back to your server, you should see the slash commands appear. But if you try to run them, nothing will happen since your app isn't receiving or handling any requests from Discord.

<Accordion title="What are Discord's APIs?" description="Overview of Discord's HTTP and Gateway APIs">
  Apps have access to [APIs](/developers/quick-start/overview-of-apps#what-apis-can-apps-use) that you can mix-and-match to build apps:

  * **[HTTP API](/developers/reference#http-api)** is a REST-like API for general operations like sending and updating data in Discord, or fetching data about a resource.
  * **[Gateway API](/developers/reference#gateway-websocket-api)** is a WebSocket-based API that is helpful for maintaining state or listening to events happening in a Discord server. We won't be using it in this guide, but more information about how to create a Gateway connection and the different events you can listen to are in the [Gateway documentation](/developers/events/gateway).
</Accordion>

***

## Step 3: Handling interactivity

To enable your app to receive slash command and other interactions requests, Discord needs a public URL to send them. This URL can be configured in your app's settings as **Interaction Endpoint URL**.

### Set up a public endpoint

To set up a public endpoint, we'll start our app which runs an [Express](https://expressjs.com/) server, then use [ngrok](https://ngrok.com/) to expose our server publicly.

First, go to your project's folder and run the following to start your app:

```
npm run start
```

There should be output indicating your app is running on port `3000`. Behind the scenes, our app is ready to handle interactions from Discord, which includes verifying security request headers and responding to `PING` requests. We're skipping over a lot of the details in this tutorial, but details about preparing apps for interactions is in the [Interactions Overview](/developers/interactions/overview#preparing-for-interactions) documentation.

<Info>
  By default, the server will listen to requests sent to port 3000, but if you want to change the port, you can specify a `PORT` variable in your `.env` file.
</Info>

Next, we'll start our ngrok tunnel. If you don't have ngrok installed locally, you can install it by following the instructions on the [ngrok download page](https://ngrok.com/download).

After ngrok is installed, open a new terminal and create a public endpoint that will forward requests to your Express server:

```
ngrok http 3000
```

You should see your connection open with output similar to the following:

```
Tunnel Status                 online
Version                       2.0/2.0
Web Interface                 http://127.0.0.1:4040
Forwarding                    https://1234-someurl.ngrok.io -> localhost:3000

Connections                  ttl     opn     rt1     rt5     p50     p90
                              0       0       0.00    0.00    0.00    0.00
```

We'll use **Forwarding** URL as the publicly-accessible URL where Discord will send interactions requests in the next step.

### Adding an interaction endpoint URL

Go to your [app's settings](https://discord.com/developers/applications) and on the [**General Information** page](https://discord.com/developers/applications/select/information) under **Interaction Endpoint URL**, paste your new ngrok forwarding URL and append `/interactions`.

<img src="https://mintcdn.com/discord/sE9HKfrfcohZiTYN/images/getting-started-interactions-endpoint.png?fit=max&auto=format&n=sE9HKfrfcohZiTYN&q=85&s=1c2c0757dbdda625ed1efbb3d54728d6" alt="Interactions Endpoint URL" width="1242" height="626" data-path="images/getting-started-interactions-endpoint.png" />

Click **Save Changes** and ensure your endpoint is successfully verified.

<Info>
  If you have troubles verifying your endpoint, make sure both ngrok and your app are running on the same port, and that you've copied the ngrok URL correctly
</Info>

The verification is handled automatically by the sample app in two ways:

* It uses the `PUBLIC_KEY` and [discord-interactions package](https://github.com/discord/discord-interactions-js#usage) with a wrapper function (imported from `utils.js`) that makes it conform to [Express's `verify` interface](http://expressjs.com/en/5x/api.html#express.json). This is run on every incoming request to your app.
* It responds to incoming `PING` requests.

You can learn more about preparing your app to receive interactions in [the interactions documentation](/developers/interactions/overview#preparing-for-interactions).

### Handling slash command requests

With the endpoint verified, navigate to your project's `app.js` file and find the code block that handles the `/test` command:

```javascript  theme={"system"}
// "test" command
if (name === 'test') {
  // Send a message into the channel where command was triggered from
  return res.send({
    type: InteractionResponseType.CHANNEL_MESSAGE_WITH_SOURCE,
    data: {
      flags: InteractionResponseFlags.IS_COMPONENTS_V2,
      components: [
        {
          type: MessageComponentTypes.TEXT_DISPLAY,
          // Fetches a random emoji to send from a helper function
          content: `hello world ${getRandomEmoji()}`
        }
      ]
    },
  });
}
```

The code above is responding to the interaction with a message in the channel, DM, or Group DM it originated from. You can see all available response types, like responding with a modal, [in the documentation](/developers/interactions/receiving-and-responding#interaction-response-object-interaction-callback-type).

<Info>
  `InteractionResponseType.CHANNEL_MESSAGE_WITH_SOURCE` is a constant [exported from `discord-interactions`](https://github.com/discord/discord-interactions-js/blob/main/src/index.ts#L33)
</Info>

Go to your server and make sure your app's `/test` slash command works. When you trigger it, your app should send a message that contains “hello world” followed by a random emoji.

In the following section, we'll add an additional command that uses slash command options, buttons, and select menus to build the rock-paper-scissors game.

***

## Step 4: Adding message components

The `/challenge` command will be how our rock-paper-scissors-style game is initiated. When the command is triggered, the app will send message components to the channel, which will guide the users to complete the game.

### Adding a command with options

The `/challenge` command, called `CHALLENGE_COMMAND` in `commands.js`, has an array of `options`. In our app, the options are objects representing different things that a user can select while playing rock-paper-scissors, generated using keys of `RPSChoices` in `game.js`.

You can read more about command options and their structure [in the documentation](/developers/interactions/application-commands#application-command-object-application-command-option-structure).

<Info>
  While this guide won't touch much on the `game.js` file, feel free to poke around and change commands or the options in the commands.
</Info>

<Accordion title="Handling the command interaction" description="Code for handling the challenge command and responding with a message containing a button" icon="code" open>
  To handle the `/challenge` command, add the following code after the `if name === “test”` if block:

  ```javascript  theme={"system"}
  // "challenge" command
  if (name === 'challenge' && id) {
    // Interaction context
    const context = req.body.context;
    // User ID is in user field for (G)DMs, and member for servers
    const userId = context === 0 ? req.body.member.user.id : req.body.user.id;
    // User's object choice
    const objectName = req.body.data.options[0].value;

    // Create active game using message ID as the game ID
    activeGames[id] = {
      id: userId,
      objectName,
    };

    return res.send({
      type: InteractionResponseType.CHANNEL_MESSAGE_WITH_SOURCE,
      data: {
        flags: InteractionResponseFlags.IS_COMPONENTS_V2,
        components: [
          {
            type: MessageComponentTypes.TEXT_DISPLAY,
            // Fetches a random emoji to send from a helper function
            content: `Rock papers scissors challenge from <@${userId}>`,
          },
          {
            type: MessageComponentTypes.ACTION_ROW,
            components: [
              {
                type: MessageComponentTypes.BUTTON,
                // Append the game ID to use later on
                custom_id: `accept_button_${req.body.id}`,
                label: 'Accept',
                style: ButtonStyleTypes.PRIMARY,
              },
            ],
          },
        ],
      },
    });
  }
  ```

  <Info>
    If you aren't sure where to paste the code, you can see the full code in `examples/app.js`.
  </Info>

  The above code is doing a few things:

  1. Parses the request body to get the ID of the user who triggered the slash command (`userId`), and the option (object choice) they selected (`objectName`). If the interaction is run in a server (`context === 0`), the user ID will be nested in the `member` object. If it's in a DM or Group DM, it will be in the `user` object.
  2. Adds a new game to the `activeGames` object using the interaction ID. The active game records the `userId` and `objectName`.
  3. Sends a message back to the channel with a button with a `custom_id` of `accept_button_<SOME_ID>`.

  <Warning>
    The sample code uses an object as in-memory storage, but for production apps you should use a database.
  </Warning>

  When sending a message with [message components](/developers/components/reference), the individual payloads are appended to a `components` array. Actionable components (like buttons) need to be inside of an [action row](/developers/components/reference#action-row), which you can see in the code sample.

  Note the unique `custom_id` sent with message components, in this case `accept_button_` with the active game's ID appended to it. A `custom_id` can be used to handle requests that Discord sends you when someone interacts with the component, which you'll see in a moment.

  Now when you run the `/challenge` command and pick an option, your app will send a message with an **Accept** button. Let's add code to handle the button press.
</Accordion>

<Accordion title="Handling button interactions" description="Code for handling button clicks and responding with an ephemeral message" icon="code" open>
  When users interact with a message component, Discord will send a request with an [interaction type](/developers/interactions/receiving-and-responding#interaction-object-interaction-type) of `3` (or the  `MESSAGE_COMPONENT` value when using `discord-interactions`).

  To set up a handler for the button, we'll check the `type` of interaction, followed by matching the `custom_id`.

  Paste the following code under the type handler for `APPLICATION_COMMAND`s:

  ```javascript  theme={"system"}
  if (type === InteractionType.MESSAGE_COMPONENT) {
    // custom_id set in payload when sending message component
    const componentId = data.custom_id;

    if (componentId.startsWith('accept_button_')) {
      // get the associated game ID
      const gameId = componentId.replace('accept_button_', '');
      // Delete message with token in request body
      const endpoint = `webhooks/${process.env.APP_ID}/${req.body.token}/messages/${req.body.message.id}`;
      try {
        await res.send({
          type: InteractionResponseType.CHANNEL_MESSAGE_WITH_SOURCE,
          data: {
            // Indicates it'll be an ephemeral message
            flags: InteractionResponseFlags.EPHEMERAL | InteractionResponseFlags.IS_COMPONENTS_V2,
            components: [
              {
                type: MessageComponentTypes.TEXT_DISPLAY,
                content: 'What is your object of choice?',
              },
              {
                type: MessageComponentTypes.ACTION_ROW,
                components: [
                  {
                    type: MessageComponentTypes.STRING_SELECT,
                    // Append game ID
                    custom_id: `select_choice_${gameId}`,
                    options: getShuffledOptions(),
                  },
                ],
              },
            ],
          },
        });
        // Delete previous message
        await DiscordRequest(endpoint, { method: 'DELETE' });
      } catch (err) {
        console.error('Error sending message:', err);
      }
    }
    return;
  }
  ```

  The above code:

  1. Checks for a `custom_id` that matches what we originally sent (in this case, it starts with `accept_button_`). The custom ID also has the active game ID appended, so we store that in `gameID`.
  2. [Deletes the original message](/developers/interactions/receiving-and-responding#delete-original-interaction-response) calling a webhook using `node-fetch` and passing the unique interaction `token` in the request body. This is done to clean up the channel, and so other users can't click the button.
  3. Responds to the request by sending a message that contains a select menu with the object choices for the game. The payload should look fairly similar to the previous one, with the exception of the `options` array and `flags: 64`, [which indicates that the message is ephemeral](/developers/interactions/receiving-and-responding#create-followup-message).

  The `options` array is populated using the `getShuffledOptions()` method in `game.js`, which manipulates the `RPSChoices` values to conform to the shape of [string select options](/developers/components/reference#string-select-select-option-structure).
</Accordion>

<Accordion title="Handling select menu interactions" description="Code for responding to select menu interactions and updating the game state" icon="code" open>
  The last thing to add is code to handle select menu interactions, and to send the result of the game to channel.

  Since select menus are just another message component, the code to handle their interactions will be almost identical to buttons.

  Modify the code above to handle the select menu:

  ```javascript  theme={"system"}
  if (type === InteractionType.MESSAGE_COMPONENT) {
    // custom_id set in payload when sending message component
    const componentId = data.custom_id;

    if (componentId.startsWith('accept_button_')) {
      // get the associated game ID
      const gameId = componentId.replace('accept_button_', '');
      // Delete message with token in request body
      const endpoint = `webhooks/${process.env.APP_ID}/${req.body.token}/messages/${req.body.message.id}`;
      try {
        await res.send({
          type: InteractionResponseType.CHANNEL_MESSAGE_WITH_SOURCE,
          data: {
            // Indicates it'll be an ephemeral message
            flags: InteractionResponseFlags.EPHEMERAL | InteractionResponseFlags.IS_COMPONENTS_V2,
            components: [
              {
                type: MessageComponentTypes.TEXT_DISPLAY,
                content: 'What is your object of choice?',
              },
              {
                type: MessageComponentTypes.ACTION_ROW,
                components: [
                  {
                    type: MessageComponentTypes.STRING_SELECT,
                    // Append game ID
                    custom_id: `select_choice_${gameId}`,
                    options: getShuffledOptions(),
                  },
                ],
              },
            ],
          },
        });
        // Delete previous message
        await DiscordRequest(endpoint, { method: 'DELETE' });
      } catch (err) {
        console.error('Error sending message:', err);
      }
    } else if (componentId.startsWith('select_choice_')) {
      // get the associated game ID
      const gameId = componentId.replace('select_choice_', '');

      if (activeGames[gameId]) {
        // Interaction context
        const context = req.body.context;
        // Get user ID and object choice for responding user
        // User ID is in user field for (G)DMs, and member for servers
        const userId = context === 0 ? req.body.member.user.id : req.body.user.id;
        const objectName = data.values[0];
        // Calculate result from helper function
        const resultStr = getResult(activeGames[gameId], {
          id: userId,
          objectName,
        });

        // Remove game from storage
        delete activeGames[gameId];
        // Update message with token in request body
        const endpoint = `webhooks/${process.env.APP_ID}/${req.body.token}/messages/${req.body.message.id}`;

        try {
          // Send results
          await res.send({
            type: InteractionResponseType.CHANNEL_MESSAGE_WITH_SOURCE,
            data: {
              flags: InteractionResponseFlags.IS_COMPONENTS_V2,
              components: [
                {
                  type: MessageComponentTypes.TEXT_DISPLAY,
                  content: resultStr
                }
              ]
              },
          });
          // Update ephemeral message
          await DiscordRequest(endpoint, {
            method: 'PATCH',
            body: {
              components: [
                {
                  type: MessageComponentTypes.TEXT_DISPLAY,
                  content: 'Nice choice ' + getRandomEmoji()
                }
              ],
            },
          });
        } catch (err) {
          console.error('Error sending message:', err);
        }
      }
    }

    return;
  }
  ```

  Similar to earlier code, the code above is getting the user ID and their object selection from the interaction request.

  That information, along with the original user's ID and selection from the `activeGames` object, are passed to the `getResult()` function. `getResult()` determines the winner, then builds a readable string to send back to the channel.

  We're also calling another webhook, this time to [update the follow-up ephemeral message](/developers/interactions/receiving-and-responding#edit-followup-message) since it can't be deleted.

  Finally, the results are sent in the channel using the `CHANNEL_MESSAGE_WITH_SOURCE` interaction response type.
</Accordion>

....and that's it 🎊 Go ahead and test your app and make sure everything works.

***

## Next steps

Congrats on building your first Discord app! 🤖

Hopefully you learned a bit about Discord apps, how to configure them, and how to make them interactive. From here, you can continue building out your app or explore what else is possible.

<CardGroup cols={2}>
  <Card title="Overview of Apps" href="/developers/quick-start/overview-of-apps" icon={<AppsIcon />}>
    Explore the platform features and APIs you have access to when building an app on Discord
  </Card>

  <Card title="Explore developer tools" href="/developers/developer-tools/community-resources" icon={<WrenchIcon />}>
    Explore 1st party and community-built libraries and tools to speed up and simplify your development
  </Card>

  <Card title="Developing User-Installable Apps" href="/developers/tutorials/developing-a-user-installable-app" icon={<UserIcon />}>
    Tutorial on building and handling interactions for apps installed to a user
  </Card>

  <Card title="Discord Developers" href="https://discord.gg/discord-developers" icon={<GlobeEarthIcon />}>
    Join our community to ask questions about the API, attend events hosted by the Discord platform team, and interact with other devs
  </Card>
</CardGroup>
