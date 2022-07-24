rule win_cryptic_convo_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.cryptic_convo."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.cryptic_convo"
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
        $sequence_0 = { 5e c3 55 8bec 81ec1c020000 }
            // n = 5, score = 100
            //   5e                   | pop                 esi
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   81ec1c020000         | sub                 esp, 0x21c

        $sequence_1 = { 75f8 be???????? a5 a5 8d7dc8 4f }
            // n = 6, score = 100
            //   75f8                 | jne                 0xfffffffa
            //   be????????           |                     
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   8d7dc8               | lea                 edi, [ebp - 0x38]
            //   4f                   | dec                 edi

        $sequence_2 = { eb06 40 0fafc6 03c8 83c328 ff4d08 }
            // n = 6, score = 100
            //   eb06                 | jmp                 8
            //   40                   | inc                 eax
            //   0fafc6               | imul                eax, esi
            //   03c8                 | add                 ecx, eax
            //   83c328               | add                 ebx, 0x28
            //   ff4d08               | dec                 dword ptr [ebp + 8]

        $sequence_3 = { 8985b0fbffff c785ecfeffff50726f00 4f 8a4701 47 84c0 }
            // n = 6, score = 100
            //   8985b0fbffff         | mov                 dword ptr [ebp - 0x450], eax
            //   c785ecfeffff50726f00     | mov    dword ptr [ebp - 0x114], 0x6f7250
            //   4f                   | dec                 edi
            //   8a4701               | mov                 al, byte ptr [edi + 1]
            //   47                   | inc                 edi
            //   84c0                 | test                al, al

        $sequence_4 = { 899df4fcffff 4f 8a4701 47 3ac3 75f8 be???????? }
            // n = 7, score = 100
            //   899df4fcffff         | mov                 dword ptr [ebp - 0x30c], ebx
            //   4f                   | dec                 edi
            //   8a4701               | mov                 al, byte ptr [edi + 1]
            //   47                   | inc                 edi
            //   3ac3                 | cmp                 al, bl
            //   75f8                 | jne                 0xfffffffa
            //   be????????           |                     

        $sequence_5 = { b8???????? c3 ff15???????? 68???????? }
            // n = 4, score = 100
            //   b8????????           |                     
            //   c3                   | ret                 
            //   ff15????????         |                     
            //   68????????           |                     

        $sequence_6 = { 8d85b4feffff 50 8d85b0fdffff 50 8d8594feffff 50 8d85b8feffff }
            // n = 7, score = 100
            //   8d85b4feffff         | lea                 eax, [ebp - 0x14c]
            //   50                   | push                eax
            //   8d85b0fdffff         | lea                 eax, [ebp - 0x250]
            //   50                   | push                eax
            //   8d8594feffff         | lea                 eax, [ebp - 0x16c]
            //   50                   | push                eax
            //   8d85b8feffff         | lea                 eax, [ebp - 0x148]

        $sequence_7 = { 888c05f0fdffff 40 84c9 75ed }
            // n = 4, score = 100
            //   888c05f0fdffff       | mov                 byte ptr [ebp + eax - 0x210], cl
            //   40                   | inc                 eax
            //   84c9                 | test                cl, cl
            //   75ed                 | jne                 0xffffffef

        $sequence_8 = { 3bfe 7cdb 68d4300000 0500120000 50 ff7580 }
            // n = 6, score = 100
            //   3bfe                 | cmp                 edi, esi
            //   7cdb                 | jl                  0xffffffdd
            //   68d4300000           | push                0x30d4
            //   0500120000           | add                 eax, 0x1200
            //   50                   | push                eax
            //   ff7580               | push                dword ptr [ebp - 0x80]

        $sequence_9 = { c605????????01 8dbd48ffffff c78548ffffff76337300 4f 8a4701 47 84c0 }
            // n = 7, score = 100
            //   c605????????01       |                     
            //   8dbd48ffffff         | lea                 edi, [ebp - 0xb8]
            //   c78548ffffff76337300     | mov    dword ptr [ebp - 0xb8], 0x733376
            //   4f                   | dec                 edi
            //   8a4701               | mov                 al, byte ptr [edi + 1]
            //   47                   | inc                 edi
            //   84c0                 | test                al, al

    condition:
        7 of them and filesize < 97280
}