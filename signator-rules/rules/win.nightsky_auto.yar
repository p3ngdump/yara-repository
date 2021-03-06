rule win_nightsky_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.nightsky."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.nightsky"
        malpedia_rule_date = "20220513"
        malpedia_hash = "7f4b2229e6ae614d86d74917f6d5b41890e62a26"
        malpedia_version = "20220516"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { 75b6 420fb6442420 eb02 b0ff 4188442f08 48ffc5 }
            // n = 6, score = 100
            //   75b6                 | movzx               eax, byte ptr [esp + 0x1a0]
            //   420fb6442420         | inc                 ebp
            //   eb02                 | mov                 edx, dword ptr [esi]
            //   b0ff                 | inc                 ecx
            //   4188442f08           | dec                 edx
            //   48ffc5               | inc                 ebp

        $sequence_1 = { e9???????? 0f85b7ffffff 4863d7 4533c0 c6c5bf 490fbfcb }
            // n = 6, score = 100
            //   e9????????           |                     
            //   0f85b7ffffff         | cmp                 eax, 8
            //   4863d7               | jb                  0x11f
            //   4533c0               | dec                 eax
            //   c6c5bf               | mov                 ebx, dword ptr [ebx + 8]
            //   490fbfcb             | jmp                 0x123

        $sequence_2 = { 48c787a000000003000000 48894760 488d05d2910200 c7475001000000 48c7475803000000 48894778 488d05a8530300 }
            // n = 7, score = 100
            //   48c787a000000003000000     | dec    eax
            //   48894760             | lea                 edx, [0xfffca1db]
            //   488d05d2910200       | inc                 esp
            //   c7475001000000       | mov                 dword ptr [esp + 0x40], esp
            //   48c7475803000000     | mov                 al, 1
            //   48894778             | test                al, al
            //   488d05a8530300       | je                  0x1de

        $sequence_3 = { 413394be10690500 0fb6c3 458bc1 448bde 41339486107d0500 413317 4983c704 }
            // n = 7, score = 100
            //   413394be10690500     | je                  0x68d
            //   0fb6c3               | dec                 eax
            //   458bc1               | lea                 ebx, [0x39d92]
            //   448bde               | dec                 eax
            //   41339486107d0500     | mov                 ecx, ebx
            //   413317               | je                  0x6b8
            //   4983c704             | dec                 eax

        $sequence_4 = { 48c7432007000000 48896b18 6689746b08 eb1c 4885ff 7517 48897318 }
            // n = 7, score = 100
            //   48c7432007000000     | dec                 eax
            //   48896b18             | lea                 ecx, [esp + 0x68]
            //   6689746b08           | nop                 
            //   eb1c                 | dec                 eax
            //   4885ff               | lea                 eax, [0xde39]
            //   7517                 | dec                 eax
            //   48897318             | mov                 dword ptr [edi], eax

        $sequence_5 = { 4533848ea0710400 418bc9 48c1e908 4183e13f 83e13f 4533848e30690400 418bca }
            // n = 7, score = 100
            //   4533848ea0710400     | mov                 edi, 1
            //   418bc9               | dec                 eax
            //   48c1e908             | mul                 edi
            //   4183e13f             | dec                 ecx
            //   83e13f               | mov                 edi, 0xffffffff
            //   4533848e30690400     | dec                 ecx
            //   418bca               | cmovo               eax, edi

        $sequence_6 = { 488b4b08 668901 488bc3 488b5c2430 488b742438 4883c420 5f }
            // n = 7, score = 100
            //   488b4b08             | inc                 esp
            //   668901               | btr                 edx, edi
            //   488bc3               | inc                 ebp
            //   488b5c2430           | xadd                al, al
            //   488b742438           | cwd                 
            //   4883c420             | dec                 eax
            //   5f                   | mov                 edx, dword ptr [esp + 8]

        $sequence_7 = { 8b7808 e9???????? 488d058a0d0200 4a8b0ce8 42f644313880 744d 0fbecb }
            // n = 7, score = 100
            //   8b7808               | inc                 ebx
            //   e9????????           |                     
            //   488d058a0d0200       | inc                 eax
            //   4a8b0ce8             | mov                 bh, byte ptr [ebp + 1]
            //   42f644313880         | dec                 eax
            //   744d                 | inc                 ebp
            //   0fbecb               | inc                 eax

        $sequence_8 = { 4585c0 e9???????? 0f84b0ffffff 448b8c088c000000 6699 f5 }
            // n = 6, score = 100
            //   4585c0               | rcl                 ch, 0x95
            //   e9????????           |                     
            //   0f84b0ffffff         | test                cl, dh
            //   448b8c088c000000     | stc                 
            //   6699                 | sub                 eax, 0x47082e91
            //   f5                   | clc                 

        $sequence_9 = { c7475001000000 48c7475806000000 48894778 488d05c2560300 }
            // n = 4, score = 100
            //   c7475001000000       | dec                 ecx
            //   48c7475806000000     | sub                 ebx, 4
            //   48894778             | shr                 cx, 0x80
            //   488d05c2560300       | and                 cx, di

    condition:
        7 of them and filesize < 19536896
}