import httpclient, asyncdispatch

# Sequential Link Checker
proc sequentialChecker*(links: seq[string]) =
    let client = newHttpClient()  # Reuse the client for all links
    for link in links:
        try:
            let response = client.get(link)
            echo link, " is ", response.code == Http200
        except HttpRequestError as e:
            echo link, " is invalid, Error: ", e.msg
        except:
            let msg = getCurrentExceptionMsg()
            echo link, " check failed: ", msg
        finally:
            # Ensure client is closed after all requests are done
            client.close()

# Asynchronous Link Checker
proc checkLink(client: AsyncHttpClient, link: string): Future[void] {.async.} =
    try:
        let response = await client.get(link)  # Default timeout set at client level
        echo link, " is ", response.code == Http200
    except HttpRequestError as e:
        echo link, " is invalid, Error: ", e.msg
    except OSError as e:
        if e.errorCode == 60:  # Error code 60 is a timeout error
            echo link, " timed out"
        else:
            echo link, " failed due to OS error: ", e.msg
    except:
        let msg = getCurrentExceptionMsg()
        echo link, " check failed: ", msg

# Async Checker for Multiple Links
proc asyncChecker*(links: seq[string]): Future[void] {.async.} =
    let client = newAsyncHttpClient()
    client.timeout = 5000  # Set timeout to 5 seconds for all requests
    var futures: seq[Future[void]]
    
    try:
        for link in links:
            futures.add(checkLink(client, link))  # Add each async task to the futures
        await all(futures)  # Wait for all tasks to complete
    finally:
        client.close()  # Close the client once done